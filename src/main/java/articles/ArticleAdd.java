package articles;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/ArticleAdd")
@MultipartConfig(maxFileSize = 161772150)
public class ArticleAdd extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/lifebelow";
    private String dbUser = "root";
    private String dbPass = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String atTitle = request.getParameter("atTitle");
       
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        
        String atDesc = request.getParameter("atDesc");
        
        Connection conn = null;
        String message = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO article_table (atTitle, image, atDesc) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, atTitle);
            if (inputStream != null) {
                statement.setBlob(2, inputStream);
            }
            statement.setString(3, atDesc);
            
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Create Article successfully";
            }
        } catch (SQLException | ClassNotFoundException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        request.setAttribute("message", message);
        PrintWriter out = response.getWriter(); 

		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Article Post Successfully' ,  '' ,  'success' );");
		out.println("});");
		out.println("</script>");
		
		RequestDispatcher rd = request.getRequestDispatcher("/ViewArticles.jsp");
        
        rd.include(request, response);
        
    }
}
