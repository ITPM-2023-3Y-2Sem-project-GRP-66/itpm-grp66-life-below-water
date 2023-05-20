package aquatic;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/AquaticAdd")
@MultipartConfig(maxFileSize = 161772150)
public class AquaticAdd extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3307/lifebelow";
    private String dbUser = "root";
    private String dbPass = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String aName = request.getParameter("aName");
       
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        
        String aDesc = request.getParameter("aDesc");
        
        Connection conn = null;
        String message = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO aquatic_table (aName, image, aDesc) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, aName);
            if (inputStream != null) {
                statement.setBlob(2, inputStream);
            }
            statement.setString(3, aDesc);
            
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Create Aquatic successfully";
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
        getServletContext().getRequestDispatcher("/ManageAquatic.jsp").forward(request, response);
    }
}
