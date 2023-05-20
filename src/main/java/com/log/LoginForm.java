package com.log;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginForm
 */
@WebServlet("/LoginForm")
public class LoginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("psw");
		
		if(uname.equals("aquatic")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("CreateAquatic.jsp");
		}
		else if(uname.equals("community")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("CreateCommunity.jsp");
		}
		else if(uname.equals("complain")&& pwd.equals("1234")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Username", uname);
			 response.sendRedirect("ManageComplain.jsp");
		}
		
		else {
			response.sendRedirect("Login.jsp");
		}
		
	}

}
