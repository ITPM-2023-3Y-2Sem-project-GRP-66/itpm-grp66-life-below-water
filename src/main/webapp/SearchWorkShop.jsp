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
String searchPlace = request.getParameter("searchPlace");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
<link rel="stylesheet" type="text/css" href="css/nav.css">
<style>
.btn { 
  background-color: #6d65d1;
  border: none;
  color: white;
  padding: 12px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 6px 2px;
  cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
}
	.grid-container {
			display: grid;
			grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
			grid-gap: 15px;
			padding: 10px;
		}
		.grid-item {
			background-color: #7bbb9b;
			border: 1px solid #000000;
			padding: 2px;
			text-align: center;
			overflow: hidden;
			position: relative;
		}
		.grid-item:hover img {
			transform: scale(1.1);
		}
		img {
			width: 180px;
  			height: 160px;
  			
		}
	
		.name {
			font-weight: bold;
			margin-bottom: 10px;
			font-size: 2.8em;
		}
		.view1 {
			font-size: 1.4em;
		}
		.view2 {
			font-size: 1.6em;
		}
		.view3 {
			font-size: 1.2em;
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
  
<h2>Free Work Shop</h2>

<form method="GET" action="SearchWorkShop.jsp" class="search-form">
    <input type="text" name="searchName" placeholder="Search by Name">
    <input type="text" name="searchPlace" placeholder="Search by Place">
    <button type="submit">Search</button>
</form>
<div class="grid-container">

				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT * FROM community_table WHERE 1=1";
if (searchName != null && !searchName.isEmpty()) {
    sql += " AND cName LIKE '%" + searchName + "%'";
}
if (searchPlace != null && !searchPlace.isEmpty()) {
    sql += " AND cPlace LIKE '%" + searchPlace + "%'";
}
resultSet = statement.executeQuery(sql);
int i = 0;
while(resultSet.next()){
	int id = resultSet.getInt("id");
	String name = resultSet.getString("cName");
	String cPlace = resultSet.getString("cPlace");
	String cGoal = resultSet.getString("cGoal");
	String cDate = resultSet.getString("cDate");
	String cTime = resultSet.getString("cTime");
	String cOrg = resultSet.getString("cOrg");
	String cDesc = resultSet.getString("cDesc");
 
	
%>
    <div class="grid-item">
         
        <p class="name"><%= name %></p>
        <p class="view1"><%= cPlace %></p>
        <p class="view1">Goal: <%= cGoal %></p>
        <p class="view3">Date: <%= cDate %> &  Time: <%= cTime %></p>
        <p class="view2">Organizer: <%= cOrg %></p>
        <p class="view"><%= cDesc %></p>
        <a href="WorkShopPDF.jsp?id=<%= id %>" class="btn" >Download PDF</a>
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