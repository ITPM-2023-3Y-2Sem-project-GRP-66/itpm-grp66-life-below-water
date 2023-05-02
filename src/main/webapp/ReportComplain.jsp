<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="aquatic.AquaticAdd"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Report Preview</title>
	
<link href="css/Report.css" rel="stylesheet">
	
		
<style>
    tab1 { padding-left: 16em; }
    
    img {
			width: 100px;
  			height: 80px;
  			
	}
</style>
    
</head>
<body>


 		<%
	String id = request.getParameter("id");
	String driverName = "com.mysql.jdbc.Driver";
	String ConnectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "lifebelow";
	String UserId="root";
	String password = "1234";
	
	try{
		Class.forName(driverName);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	
	

%>

<div class="A4" style="border:1px solid black; padding:20px; height:39.7cm; ">

	<div class="content">
	<table width="100%">
<tr>
<td><img src="img/3.png" width="200px" heigth="400px"></td>


</tr>
	</div>
	</table>
<hr>
<br>
<p><tab1><b><u><font size="+2" color="886C65">COMPLAIN REPORT</b></u></font></tab1></p>

<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebelow","root","1234");
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM complain_table";
ResultSet rs = st.executeQuery(strQuery);
String Countrow="";
while(rs.next()){
Countrow = rs.getString(1);
out.println("Complains  :" +Countrow);
}
}
catch (Exception e){
e.printStackTrace();
}
%>

  		<table class="table table-striped" cellspacing="18" align="center">
									<thead>
									  <tr>
										<th scope="col">No</th>
										<th scope="col">Complain Type</th>
										<th scope="col">Description</th>
										<th scope="col">Image</th>

									  </tr>
									  
									
										<%
											try{
												connection = DriverManager.getConnection(ConnectionUrl+dbName,UserId,password);
												statement=connection.createStatement();
												String sql ="SELECT * from complain_table";
												
												resultset = statement.executeQuery(sql);
												while(resultset.next()){
													
												
											
										
									%>
									<tr>
									<td><%=resultset.getInt("id") %></td>
									<td><%=resultset.getString("cType") %></td>
									<td><%=resultset.getString("cDescri") %></td>
									<td>
                                <%-- Retrieve the image data from the result set --%>
                                <% Blob imageBlob = resultset.getBlob("image");
                                if (imageBlob != null && imageBlob.length() > 0) {
                                    byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    %>
                                    <img src="data:image/png;base64, <%=base64Image %>" width="100px" height="100px">
                                <% } %>
                            </td>

									</tr>
									<%
												}
											connection.close();	
											} catch(Exception e){
												e.printStackTrace();
											}
											
									%>
									
									
								  </table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
								  
<footer>
<p align="center"><b>PAGE NO:: 01<b></p>
<p align="center"><i><b>----------------------------CREATED BY:: Life Below Water----------------------------</i><b></p>
</footer>

</div>

        
     


      <script>
        window.print();
      </script>
	
</body>
</html>