<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/lifebelow";%>
<%!String user = "root";%>
<%!String psw = "1234";%>
<%
String id = request.getParameter("id");
String cName =request.getParameter("cName");
String cPlace =request.getParameter("cPlace");
String cGoal =request.getParameter("cGoal");
String cDate = request.getParameter("cDate");
String cTime =request.getParameter("cTime");
String cOrg =request.getParameter("cOrg");
String cDesc =request.getParameter("cDesc");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update community_table set id=?,cName=?,cPlace=?,cGoal=?,cDate=?,cTime=?,cOrg=?,cDesc=?  where id="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,cName);
ps.setString(3,cPlace);
ps.setString(4,cGoal);
ps.setString(5,cDate);
ps.setString(6,cTime);
ps.setString(7,cOrg);
ps.setString(8,cDesc);
int i = ps.executeUpdate();
if(i > 0)
{
	
	 
RequestDispatcher rd = request.getRequestDispatcher("ManageCommunity.jsp");
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