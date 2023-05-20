<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/lifebelow";%>
<%!String user = "root";%>
<%!String psw = "1234";%>
<%
String id = request.getParameter("id");
String atTitle =request.getParameter("atTitle");
String atDesc =request.getParameter("atDesc");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update article_table set id=?,atTitle=?,atDesc=?  where id="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,atTitle);
ps.setString(3,atDesc);
int i = ps.executeUpdate();
if(i > 0)
{
	
	 
RequestDispatcher rd = request.getRequestDispatcher("ViewArticles.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 