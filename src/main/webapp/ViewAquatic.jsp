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
<meta charset="ISO-8859-1">
<title>View</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
<style>
 body {
      background-image: url("img/back.png");
      background-repeat: no-repeat;
      background-size: cover;
    }
    
	.grid-container {
			display: grid;
			grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
			grid-gap: 10px;
			padding: 10px;
		}
		.grid-item {
			background-color: #4872c8;
			border: 1px solid #000000;
			padding: 5px;
			text-align: center;
			overflow: hidden;
			position: relative;
		}
		.grid-item:hover img {
			transform: scale(1.1);
		}
		img {
			width: 220px;
  			height: 160px;
  			
		}
	
		.name {
			font-weight: bold;
			margin-bottom: 10px;
			font-size: 2.2em;
		}
		.view {
			font-size: 1.2em;
		}
		

		
	</style>
</head>
<body>
<header>
		<nav>
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="ViewWorkShop.jsp">WorkShop</a></li>
				<li><a href="ViewAquatic.jsp">Aquatic</a></li>
				<li><a href="ViewArticles.jsp">Articles</a></li>
				<li><a href="CreateComplains.jsp">Complains</a></li>
				<lii><a href="Login.jsp">Admin Login</a></lii>
			</ul>
		</nav>
	</header>
  
<h2>Aquatic</h2>

<center>
<form class="search-form" method="GET" action="ViewAquatic.jsp">
    <input class="search-input" type="text" name="searchName" placeholder="Search by Name">
    <input class="search-button" type="submit" value="Search">
</form>
</center>
<div class="grid-container">

				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql = "SELECT * FROM aquatic_table WHERE 1=1";
if (searchName != null && !searchName.isEmpty()) {
    sql += " AND aName LIKE '%" + searchName + "%'";
}

resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
	int id = resultSet.getInt("id");
	String name = resultSet.getString("aName");
	String aDesc = resultSet.getString("aDesc");
 
	
%>
    <div class="grid-item">
         <% Blob imageBlob = resultSet.getBlob("image");
                                if (imageBlob != null && imageBlob.length() > 0) {
                                    byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    %>
                                    <img src="data:image/png;base64, <%=base64Image %>" width="150px" height="100px">
                                <% } %>

        <p class="name"><%= name %></p>
        <p class="view"><%= aDesc %></p>
         
    </div>
 
   
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
      </div>    
      
      <footer>
		<p>&copy; 2023 Life Below Water</p>
	</footer>
</body>
</html>