<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from community_table where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link href="css/index.css" rel="stylesheet" type="text/css">
	<style>
	 body {
      background-image: url("img/back.png");
      background-repeat: no-repeat;
      background-size: cover;
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
	
	<h2>Update Aquatic</h2>



<div class="container">
  <form action="UpdateProcessCommunity.jsp" method="post">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">ID</label>
    </div>
    <div class="col-65">
      <input type="text"  name="id" readonly id="id" value="<%=resultSet.getInt("id") %>" >
    </div>
  </div>
    <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Name</label>
    </div>
    <div class="col-65">
      <input type="text" id="cName" name="cName" value="<%=resultSet.getString("cName") %>">
    </div>
  </div>
	<div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Place</label>
    </div>
    <div class="col-65">
      <input type="text" id="cPlace" name="cPlace" value="<%=resultSet.getString("cPlace") %>">
    </div>
  </div>


  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Goal</label>
    </div>
    <div class="col-65">
      <input type="text" id="cGoal" name="cGoal" value="<%=resultSet.getString("cGoal") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Date</label>
    </div>
    <div class="col-65">
      <input type="text" id="cDate" name="cDate" value="<%=resultSet.getString("cDate") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Time</label>
    </div>
    <div class="col-65">
      <input type="text" id="cTime" name="cTime" value="<%=resultSet.getString("cTime") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Organizer</label>
    </div>
    <div class="col-65">
      <input type="text" id="cOrg" name="cOrg" value="<%=resultSet.getString("cOrg") %>">
    </div>
  </div>
   <div class="col-35">
    <label for="givennames" class="form__label">Description</label>
  </div>
  <div class="col-65">
    <textarea name="cDesc" id="cDesc" rows="4" cols="50"><%= resultSet.getString("cDesc") %></textarea>
  </div>
</div>

   
 

  <div class="row">
    <input type="submit" value="Update">
  </div>
  </form>
<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>   
</div>


</body>
</html>