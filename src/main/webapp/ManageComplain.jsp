<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lifebelow";
String userid = "root";
String password = "1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String searchName = request.getParameter("searchName");
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/nav.css">
  <link href="css/table.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/search.css">
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <style>
   body {
      background-image: url("img/back.png");
      background-repeat: no-repeat;
      background-size: cover;
    }
.button {
  background-color: #308C6E;
  border: none;
  color: white;
  padding: 15px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 6px 2px;
  cursor: pointer;
  margin: 0 460px;
}
.button3 {
  background-color: #0080c0;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {
  background-color: #ff0000;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
img {
			width: 100px;
  			height: 80px;
  			
	}
</style>
</head>
<body>
  <header>
		<nav>
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="CreateComplains.jsp">Create</a></li>
				<li><a href="ManageComplain.jsp">Manage</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact US</a></li>
				<lii><a href="Index.jsp">LogOut</a></lii>
			</ul>
		</nav>
	</header>
  
<h2>Complain Details</h2>

<form class="search-form" method="GET" action="ManageComplain.jsp">
    <input class="search-input" type="text" name="searchName" placeholder="Search by Type">
    <input class="search-button" type="submit" value="Search">
</form>

<div class="">

	<a href="ReportComplain.jsp" class="button">Download Report</a> 
			  <center>
						
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Complain Type</th>
								 <th scope="col">Description</th>
								 <th scope="col">Image</th>
						
								   
								  
									<th>Update</th>
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT * FROM complain_table WHERE 1=1";
if (searchName != null && !searchName.isEmpty()) {
    sql += " AND cType LIKE '%" + searchName + "%'";
}
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("id") %></td>
                            <td><%=resultSet.getString("cType") %></td>
                            <td><%=resultSet.getString("cDescri") %></td>
                            <td>
                                <%-- Retrieve the image data from the result set --%>
                                <% Blob imageBlob = resultSet.getBlob("image");
                                if (imageBlob != null && imageBlob.length() > 0) {
                                    byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    %>
                                    <img src="data:image/png;base64, <%=base64Image %>" width="20px" height="10px">
                                <% } %>
                            </td>
				 
                 
				  				  
				   <td><a href="UpdateComplain.jsp?id=<%=resultSet.getInt("id") %>"><button class="button3" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-edit"></span></button></p></a></td>
				 
				  <td><a href="DeleteComplain.jsp?id=<%=resultSet.getInt("id") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>
			
		</div>  
		
	<footer>
		<p>&copy; 2023 Life Below Water</p>
	</footer>
</body>
</html>
