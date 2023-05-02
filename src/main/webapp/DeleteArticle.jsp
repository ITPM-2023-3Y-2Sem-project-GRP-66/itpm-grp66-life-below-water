<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("id");
	int no = Integer.parseInt(id);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebelow","root","1234");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from article_table where id ='" +id+"'");
	response.sendRedirect("ViewArticles.jsp");
	%>