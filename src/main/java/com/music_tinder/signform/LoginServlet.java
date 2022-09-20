package com.music_tinder.signform;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;

import io.github.cdimascio.dotenv.Dotenv;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		Connection conn = null;
		if (username == null || username.equals("")) {
			request.setAttribute("status", "invalidUsername");
			dispatcher = request.getRequestDispatcher("signform.jsp");
			dispatcher.forward(request, response);
		}
		
		if (password == null || password.equals("")) {
			request.setAttribute("status", "invalidPassword1");
			dispatcher = request.getRequestDispatcher("signform.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Dotenv dbInfo = Dotenv.load();
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbInfo.get("DB_JDBC"), dbInfo.get("DB_USER"), dbInfo.get("DB_PASS"));
			PreparedStatement pst = conn.prepareStatement("select pass_word from person where username = ?");
			
			Argon2PasswordEncoder encoder = new Argon2PasswordEncoder(16, 32, 1, 65536, 10);
			pst.setString(1, username);

			
			ResultSet rs = pst.executeQuery();
			if (rs.next() && encoder.matches(password, rs.getString("pass_word"))) {
				session.setAttribute("name", username);
				dispatcher = request.getRequestDispatcher("index.jsp");
			}
			else {
				request.setAttribute("status", "failed2");
				dispatcher = request.getRequestDispatcher("signform.jsp");
			}
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
