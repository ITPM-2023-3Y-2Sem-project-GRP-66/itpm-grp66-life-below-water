package community;

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

@SuppressWarnings("serial")
@WebServlet("/Community_Add")
@MultipartConfig(maxFileSize = 161772150)
public class Community_Add extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/lifebelow";
    private String dbUser = "root";
    private String dbPass = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String cName = request.getParameter("cName");
		String cPlace = request.getParameter("cPlace");
		String cGoal = request.getParameter("cGoal");
		String cDate = request.getParameter("cDate");
		String cTime = request.getParameter("cTime");
		String cOrg = request.getParameter("cOrg");
		String cDesc = request.getParameter("cDesc");
        
        Connection conn = null;
        String message = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO community_table (cName, cPlace, cGoal, cDate, cTime, cOrg, cDesc) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cName);
		    statement.setString(2, cPlace);
		    statement.setString(3, cGoal);
		    statement.setString(4, cDate);
		    statement.setString(5, cTime);
		    statement.setString(6, cOrg);
		    statement.setString(7, cDesc);
            
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Create Community successfully";
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
        getServletContext().getRequestDispatcher("/ManageCommunity.jsp").forward(request, response);
    }
}
