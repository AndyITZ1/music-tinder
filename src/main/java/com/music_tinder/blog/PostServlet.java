package com.music_tinder.blog;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import io.github.cdimascio.dotenv.Dotenv;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/post")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forum = request.getParameter("forum");
		String title = request.getParameter("title");
		String postText = request.getParameter("post-content");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection conn = null;
		if (postText == null || postText == "") {
			request.setAttribute("status", "failed3");
			dispatcher = request.getRequestDispatcher("newjeans.jsp");
			dispatcher.forward(request, response);
		}
		else {
			try {
				Dotenv dbInfo = Dotenv.load();
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbInfo.get("DB_JDBC"), dbInfo.get("DB_USER"), dbInfo.get("DB_PASS"));
				PreparedStatement getForumID = conn.prepareStatement("SELECT forum_id FROM forum WHERE forum_name = ?");
				getForumID.setString(1, forum);
				ResultSet forumID = getForumID.executeQuery();
				PreparedStatement getPersonID = conn.prepareStatement("SELECT person_id FROM person WHERE username = ?");
				getPersonID.setString(1, (String) session.getAttribute("name"));
				ResultSet personID = getPersonID.executeQuery();
				if (forumID.next() && personID.next()) {
					PreparedStatement pst = conn.prepareStatement("INSERT INTO post(forum_id, post_title, post_text, post_date, person_id, post_last_edited) VALUES (?, ?, ?, ?, ?, ?)");
					Timestamp now = new Timestamp(new Date().getTime());
					pst.setInt(1, forumID.getInt("forum_id"));
					pst.setString(2, title);
					pst.setString(3, postText);
					pst.setTimestamp(4, now);
					pst.setInt(5, personID.getInt("person_id"));
					pst.setTimestamp(6, now);
					
					int rowCount = pst.executeUpdate();
					if (rowCount > 0) {
						request.setAttribute("status", "success1");
					}
					else {
						request.setAttribute("status", "failed1");
					}
				}
				else {
					request.setAttribute("status", "failed2");
				}
				response.sendRedirect(request.getContextPath() + "/GetPostServlet");
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
