<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/nav.css">
  <link href="css/table.css" rel="stylesheet" type="text/css">
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
				<li><a href="CreateCommunity.jsp">Create</a></li>
				<li><a href="ManageCommunity.jsp">Manage</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact US</a></li>
				<lii><a href="Index.jsp">LogOut</a></lii>
			</ul>
		</nav>
	</header>
  
<h2>Community Details</h2>

<div class="">

	<a href="ReportCommunity.jsp" class="button">Download PDF</a> 
			  <center>
						
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Name</th>
								 <th scope="col">Place</th>
								 <th scope="col">Goal</th>
								 <th scope="col">Date</th>
								 <th scope="col">Time</th>
								 <th scope="col">Organizer</th>
								 <th scope="col">Description</th>
								 
						
								   
								  
									<th>Update</th>
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from community_table";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("id") %></td>
                            <td><%=resultSet.getString("cName") %></td>
                            <td><%=resultSet.getString("cPlace") %></td>
                            <td><%=resultSet.getString("cGoal") %></td>
                            <td><%=resultSet.getString("cDate") %></td>
                            <td><%=resultSet.getString("cTime") %></td>
                            <td><%=resultSet.getString("cOrg") %></td>
                            <td><%=resultSet.getString("cDesc") %></td>

                            
				 
                 
				  				  
				   <td><a href="UpdateCommunity.jsp?id=<%=resultSet.getInt("id") %>"><button class="button3" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-edit"></span></button></p></a></td>
				 
				  <td><a href="DeleteCommunity.jsp?id=<%=resultSet.getInt("id") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
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
