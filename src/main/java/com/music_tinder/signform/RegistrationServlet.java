package com.music_tinder.signform;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;

import io.github.cdimascio.dotenv.Dotenv;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static boolean checkValidEmail(String email) {
		String emailFormat = "^(?=.{1,64}@)[\\p{L}0-9_-]+(\\.[\\p{L}0-9_-]+)*@" 
		        + "[^-][\\p{L}0-9-]+(\\.[\\p{L}0-9-]+)*(\\.[\\p{L}]{2,})$";
		return Pattern.compile(emailFormat).matcher(email).matches();
	}
	
	private static boolean checkValidPassword(String password) {
		if (password.length() < 12 || password.length() > 30) {
			return false;
		}
		boolean hasSpecialChar = false;
		boolean hasNumChar = false;
		boolean hasUpperChar = false;
		boolean hasLowerChar = false;
		for (int i = 0; i < password.length(); i++) {
			char ch = password.charAt(i);
			if (Character.isDigit(ch)) {
				hasNumChar = true;
			}
			else if (Character.isUpperCase(ch)) {
				hasUpperChar = true;
			}
			else if (Character.isLowerCase(ch)) {
				hasLowerChar = true;
			}
			else if (ch > 32 && ch < 48) {
				hasSpecialChar = true;
			}
			else {
				return false;
			}
		}
		if (hasSpecialChar && hasNumChar && hasUpperChar && hasLowerChar) {
			return true;
		}
		return false;
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		RequestDispatcher dispatcher = null;
		Connection conn = null;
		
		boolean isValid = true;
		
		if (username == null || username.equals("")) {
			request.setAttribute("status", "invalidUsername");
			isValid = false;
		}
		else if (email == null || email.equals("")) {
			request.setAttribute("status", "invalidEmail1");
			isValid = false;
		}
		else if (!checkValidEmail(email)){
			request.setAttribute("status", "invalidEmail2");
			isValid = false;
		}
		else if (password == null || password.equals("")) {
			request.setAttribute("status", "invalidPassword1");
			isValid = false;
		}
		else if (password.length() < 12 || password.length() > 30) {
			request.setAttribute("status", "invalidPassword2");
			isValid = false;
		}
		else if (!checkValidPassword(password)) {
			request.setAttribute("status", "invalidPassword3");
			isValid = false;
		}
		
		if (!isValid) {
			dispatcher = request.getRequestDispatcher("signform.jsp");
			dispatcher.forward(request, response);
		}
		else {
			try {
				Argon2PasswordEncoder encoder = new Argon2PasswordEncoder(16, 32, 1, 65536, 10);
				String encodedPassword = encoder.encode(password);
			
				Dotenv dbInfo = Dotenv.load();
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbInfo.get("DB_JDBC"), dbInfo.get("DB_USER"), dbInfo.get("DB_PASS"));
				PreparedStatement pst = conn.prepareStatement("INSERT INTO person(username, email, pass_word, date_joined, friend_count, post_count) values(?, ?, ?, ?, ?, ?)");
				pst.setString(1, username);
				pst.setString(2, email);
				pst.setString(3, encodedPassword);
				pst.setTimestamp(4, new Timestamp(new Date().getTime()));
				pst.setInt(5, 0);
				pst.setInt(6, 0);
				
				int rowCount = pst.executeUpdate();
				dispatcher = request.getRequestDispatcher("signform.jsp");
				if (rowCount > 0) {
					request.setAttribute("status", "success1");
				}
				else {
					request.setAttribute("status", "failed1");
				}
				
				dispatcher.forward(request, response);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					conn.close();
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
