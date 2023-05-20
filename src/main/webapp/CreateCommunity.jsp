<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
 body {
      background-image: url("img/back.png");
      background-repeat: no-repeat;
      background-size: cover;
    }
.button{

	height: 75px;
	margin: 85px 0;
	margin-top: -15px;
	margin-left: 240px
}

.button{

height: 100%;
width: 40%;
padding: 20px 32px;
outline: none;
color: #fff;
background: linear-gradient(135deg,#0F2027, #203A43,#2C5364);
border: none;
font-size: 14px;
font-weight: 500;
border-radius: 5px;
letter-spacing: 1px;
margin: 600px;
}
</style>
	<title>Community</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link href="css/index.css" rel="stylesheet" type="text/css">
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
	
	<h2>Create Community</h2>

<div class="container">
  <form action="Community_Add" method="post" enctype="multipart/form-data">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Name</label>
    </div>
    <div class="col-65">
      <input type="text" id="cName" name="cName" required>
    </div>
  </div>

   <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Place</label>
    </div>
    <div class="col-65">
      <input type="text" id="cPlace" name="cPlace" required >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Goal</label>
    </div>
    <div class="col-65">
      <input type="text" id="cGoal" name="cGoal" required >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Date</label>
    </div>
    <div class="col-65">
      <input type="date" id="cDate" name="cDate" required >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Time</label>
    </div>
    <div class="col-65">
      <input type="time" id="cTime" name="cTime"  required>
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Organizer</label>
    </div>
    <div class="col-65">
      <input type="text" id="cOrg" name="cOrg" required >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Description</label>
    </div>
    <div class="col-65">
      <textarea name="cDesc" id="cDesc" rows="4" cols="50" required></textarea>
    </div>
  </div>


  <br>
  
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>
<br><br><br><br><br>

	<footer>
		<p>&copy; 2023 Life Below Water</p>
	</footer>
	
</body>
</html>
