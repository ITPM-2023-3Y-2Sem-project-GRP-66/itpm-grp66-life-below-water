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
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>

 body {
      background-image: url("img/back.png");
      background-repeat: no-repeat;
      background-size: cover;
    }

	h1 {
		font-size: 24px;
		color: #333;
		margin-bottom: 10px;
	}
	img {
	  width: 220px;
	  height: 160px;
	  object-fit: cover;
	  margin-bottom: 20px;
	}

	.container {
      display: grid;
      grid-template-columns: 1fr 4fr 1fr;  
      align-items: center;
      grid-gap: 10px;
      border: 1px solid #333;
      padding: 10px;
      
    }
	
    
    .container.item {
       text-align: center;

    }
    
    
  .button {
  background-color: #308C6E;
  border: none;
  color: white;
  padding: 5px 60px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  margin: 20px 1300px;
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
  
<h2>Article</h2>

<center>
<form class="search-form" method="GET" action="ViewArticles.jsp">
    <input class="search-input" type="text" name="searchName" placeholder="Search by Name">
    <input class="search-button" type="submit" value="Search">
</form>
</center>

<a href="CreateArticle.jsp" class="button">Create Article</a>	

<br>
<div class="container">

				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql = "SELECT * FROM article_table WHERE 1=1";
if (searchName != null && !searchName.isEmpty()) {
    sql += " AND atTitle LIKE '%" + searchName + "%'";
}

resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
	int id = resultSet.getInt("id");
	String atTitle = resultSet.getString("atTitle");
	String atDesc = resultSet.getString("atDesc");
 
	
%>
		
              <div class="item">
            <h1><%= atTitle %></h1>
                  <% Blob imageBlob = resultSet.getBlob("image");
                                if (imageBlob != null && imageBlob.length() > 0) {
                                    byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    %>
                                   <img src="data:image/png;base64, <%=base64Image %>" alt="<%= atTitle %>">
                                     <% } %>
              </div>
              <div class="item">
                  <p class="view"><%= atDesc %></p>
              </div>
              
              <div class="item">
                  <a href="UpdateArticle.jsp?id=<%=resultSet.getInt("id") %>"><button class="button3" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-edit"></span></button></a>		 
				  <a href="DeleteArticle.jsp?id=<%=resultSet.getInt("id") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></a>
	
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
      
      <br>    <br>    <br>    <br>    <br>
      <footer>
		<p>&copy; 2023 Life Below Water</p>
	</footer>
</body>
</html>