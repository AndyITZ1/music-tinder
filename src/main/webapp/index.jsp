<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.Date" %>
<%@page import="io.github.cdimascio.dotenv.Dotenv"%>
<%!
String calculatePostedTime(Timestamp postTimestamp) {
    Date date = new Date();
    long diff = date.getTime() - postTimestamp.getTime();
    long diffSeconds = diff / 1000 % 60;
    long diffMinutes = diff / (60 * 1000) % 60;
    long diffHours = diff / (60 * 60 * 1000) % 24;
    long diffDays = diff / (24 * 60 * 60 * 1000);
    long diffWeeks = diff / (24 * 7 * 60 * 60 * 1000);
    long diffMonths = diff / (24 * 30 * 60 * 60 * 1000);
    long diffYears = diff / (24 * 30 * 12 * 60 * 60 * 1000);
    
    if (diffYears != 0) {
        if (diffYears == 1)
            return "Posted a year ago";
        else
            return "Posted " + diffYears + " years ago";
    }
    else if (diffMonths != 0) {
        if (diffMonths == 1)
            return "Posted a month ago";
        else
            return "Posted " + diffMonths + " months ago";
    }
    else if (diffWeeks != 0) {
        if (diffWeeks == 1)
            return "Posted a week ago";
        else
            return "Posted " + diffWeeks + " weeks ago";
    }
    else if (diffDays != 0) {
        if (diffDays == 1)
            return "Posted a day ago";
        else
            return "Posted " + diffDays + " days ago";
    }
    else if (diffHours != 0) {
        if (diffHours == 1)
            return "Posted an hour ago";
        else
            return "Posted " + diffHours + " hours ago";
    }
    else if (diffMinutes != 0) {
        if (diffMinutes == 1)
            return "Posted a minute ago";
        else
            return "Posted " + diffMinutes + " minutes ago";
    }
    if (diffSeconds == 1)
        return "Posted a second ago";

    return "Posted " + diffSeconds + " seconds ago";
}
%>
<%
    Dotenv dbInfo = Dotenv.load();
    String dbJDBC = dbInfo.get("DB_JDBC");
    String dbUser = dbInfo.get("DB_USER");
    String dbPass = dbInfo.get("DB_PASS");
    Connection conn = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    String imgPath = "images/profile.jpg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MuseIt</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;1,400;1,700&family=Ubuntu:wght@400;700&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="css/main.css">
</head>
<body class="theme">
	<div class="create-post-container" id="cap-modal">
        <div class="create-post-content cap-modal-content theme">
            <div class="create-post-header">
                <span id="close">&times;</span>
                <h3>Create Post</h3>
            </div>
            <form action="#">
                <!--  <label>Forum:</label> -->
                <input type="text" id="forum" list="forums" placeholder="Forum" required>
                <datalist id="forums">
                    <option>m+General</option>
                    <option>m+NewJeans</option>
                </datalist>
                <br>
                <!-- <label>Title:</label> -->
                <input type="text" id="title" placeholder="Title of Post" required>
                <textarea name="post-content" id="post-text" placeholder="What's on your mind?" required></textarea>
                <div class="create-post-footer">
                    <div class="post-add">
                        <ul class="media-list">
                            <li><img src="images/imagec.png" alt=""></li>
                            <li><img src="images/happyc.png" alt=""></li>
                            <li><img src="images/hashtagc.png" alt=""></li>
                        </ul>
                    </div>
                    <button type="button" class="post-button">Post</button>
                </div>
            </form>
        </div>
    </div>
    <div class="wrapper">
        <header class="theme">
            <nav class="nav-main">
                <a href="index.jsp" class="logo">MuseIt</a>
                <div class="searchbar">
                    <input type="text" class="search" placeholder="Search Museit">
                </div>
                <svg class="theme-light theme" onclick="themeSwitch()" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
                    <path d="M 32.230469 5 C 23.848469 4.9 16.498672 10.593594 13.888672 18.558594 C 11.127672 26.983594 15.386047 33.640219 18.623047 38.699219 C 20.014047 40.873219 21.260672 42.820437 21.763672 44.523438 C 22.019672 45.390437 22.785453 46 23.689453 46 L 25 46 C 25 43.099 23.216391 40.311031 21.150391 37.082031 C 18.735391 33.309031 16 29.033 16 24 C 16 15.25 23.059203 8.118 31.783203 8 C 38.659203 7.909 44.596297 12.415656 47.029297 18.847656 C 49.811297 26.202656 46.048609 32.083031 42.849609 37.082031 C 40.783609 40.311031 39 43.099 39 46 L 40.310547 46 C 41.214547 46 41.980328 45.389437 42.236328 44.523438 C 42.740328 42.820438 43.985953 40.875172 45.376953 38.701172 C 47.882953 34.785172 51 29.911 51 24 C 51 13.6 42.600469 5.125 32.230469 5 z M 8.6542969 6.5488281 L 6.8105469 8.9160156 L 11.345703 12.451172 L 13.189453 10.083984 L 8.6542969 6.5488281 z M 55.347656 6.5527344 L 50.810547 10.085938 L 52.654297 12.453125 L 57.191406 8.9179688 L 55.347656 6.5527344 z M 2 23 L 2 26 L 7 26 L 7 23 L 2 23 z M 57 23 L 57 26 L 62 26 L 62 23 L 57 23 z M 26.802734 24.755859 L 26.447266 24.957031 C 25.207266 25.663031 24.681547 27.165 25.185547 28.5 C 26.312547 31.485 28 37.389 28 46 L 31 46 C 31 32.26 26.973734 25.056859 26.802734 24.755859 z M 37.197266 24.755859 C 37.026266 25.055859 33 32.26 33 46 L 36 46 C 36 37.388 37.6865 31.483 38.8125 28.5 C 39.3165 27.167 38.793641 25.667938 37.556641 24.960938 L 37.197266 24.755859 z M 52.654297 35.548828 L 50.810547 37.916016 L 55.345703 41.451172 L 57.189453 39.083984 L 52.654297 35.548828 z M 11.34375 35.550781 L 6.8085938 39.085938 L 8.6523438 41.451172 L 13.1875 37.917969 L 11.34375 35.550781 z M 23 49 L 23.609375 53.261719 C 23.844375 54.909719 25.076172 56.238609 26.701172 56.599609 L 28.115234 56.914062 C 28.529925 58.680974 30.106665 60 32 60 C 33.893335 60 35.470075 58.680974 35.884766 56.914062 L 37.298828 56.599609 C 38.923828 56.238609 40.155625 54.909719 40.390625 53.261719 L 41 49 L 33 49 L 31 49 L 23 49 z"></path>
                </svg>
                <svg class="menu menu-closed" id="menu" viewBox="0 0 122.879 103.609" enable-background="new 0 0 122.879 103.609" xml:space="preserve"><g><path fill-rule="evenodd" clip-rule="evenodd" d="M10.368,0h102.144c5.703,0,10.367,4.665,10.367,10.367v0 c0,5.702-4.664,10.368-10.367,10.368H10.368C4.666,20.735,0,16.07,0,10.368v0C0,4.665,4.666,0,10.368,0L10.368,0z M10.368,82.875 h102.144c5.703,0,10.367,4.665,10.367,10.367l0,0c0,5.702-4.664,10.367-10.367,10.367H10.368C4.666,103.609,0,98.944,0,93.242l0,0 C0,87.54,4.666,82.875,10.368,82.875L10.368,82.875z M10.368,41.438h102.144c5.703,0,10.367,4.665,10.367,10.367l0,0 c0,5.702-4.664,10.368-10.367,10.368H10.368C4.666,62.173,0,57.507,0,51.805l0,0C0,46.103,4.666,41.438,10.368,41.438 L10.368,41.438z"/></g></svg>
                <svg class="menu" id="menu-close" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 30 30"><path d="M 7 4 C 6.744125 4 6.4879687 4.0974687 6.2929688 4.2929688 L 4.2929688 6.2929688 C 3.9019687 6.6839688 3.9019687 7.3170313 4.2929688 7.7070312 L 11.585938 15 L 4.2929688 22.292969 C 3.9019687 22.683969 3.9019687 23.317031 4.2929688 23.707031 L 6.2929688 25.707031 C 6.6839688 26.098031 7.3170313 26.098031 7.7070312 25.707031 L 15 18.414062 L 22.292969 25.707031 C 22.682969 26.098031 23.317031 26.098031 23.707031 25.707031 L 25.707031 23.707031 C 26.098031 23.316031 26.098031 22.682969 25.707031 22.292969 L 18.414062 15 L 25.707031 7.7070312 C 26.098031 7.3170312 26.098031 6.6829688 25.707031 6.2929688 L 23.707031 4.2929688 C 23.316031 3.9019687 22.682969 3.9019687 22.292969 4.2929688 L 15 11.585938 L 7.7070312 4.2929688 C 7.5115312 4.0974687 7.255875 4 7 4 z"></path></svg>
                <ul>
                    <li><a href="signform.jsp" class="login">Login/Sign Up</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn logout" onclick="drop()">
                        <%
                            try {
                                conn = DriverManager.getConnection(dbJDBC, dbUser, dbPass);
                                PreparedStatement pst = conn.prepareStatement("SELECT profile_img_ref FROM person WHERE username = ?");
                                pst.setString(1, (String) session.getAttribute("name"));
                                ResultSet profileImg = pst.executeQuery();
                                if (profileImg.next()) {
                                    imgPath = profileImg.getString("profile_img_ref");
                                    if (imgPath == null || imgPath == "") {
                                        imgPath = "images/profile.jpg";
                                    }
                                }
                    	%>
                        	<img src=<%=imgPath %> alt="User Profile Image" id="profile-pic">
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    conn.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                            <span class="user-name"><%=session.getAttribute("name")%></span>
                        </a>
                        <div id="myAcct" class="account-actions theme">
                            <a class="theme" href="#">My Account</a>
                            <a class="theme" href="#" id="cap-trigger">Create a Post</a>
                            <a class="theme" href="#">Account Settings</a>
                            <a class="theme" href="logout">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        <nav class="nav-mobile" id="nav-mobile">
            <a href="signform.jsp" class="login">Login/Sign Up</a>
            <a href="#" class="user-acct logout">
                <img src=<%=imgPath %> alt="User Profile Image" id="profile-pic">
                <span class="user-name"><%=session.getAttribute("name")%></span>
            </a>
            <a class="theme" href="#">Profile</a>
            <a class="theme" href="#" id="cap-trigger">Create a Post</a>
            <a class="theme" href="#">Settings</a>
            <a class="theme" href="logout">Logout</a>
        </nav>
        <section class="bodywrapper">
            <div class="post-section">
            	<%
            		try {
            			conn = DriverManager.getConnection(dbJDBC, dbUser, dbPass);
                        PreparedStatement pst2 = conn.prepareStatement("SELECT post_title, post_text, post_date, person_id FROM post ORDER BY post_date DESC");
                        ResultSet rs2 = pst2.executeQuery();
                        while(rs2.next()) {
            	%>
            	<div class="post theme">
                    <div class="post-header theme">
                        <div class="poster-profile-img">
                            <img src="images/profile.jpg" alt="">
                        </div>
                    <%
                        PreparedStatement pst3 = conn.prepareStatement("SELECT username FROM person WHERE person_id = ?");
                        pst3.setInt(1, rs2.getInt("person_id"));
                        ResultSet rs3 = pst3.executeQuery();
                        String poster_name = "?";
                        if (rs3.next()) {
                            poster_name = rs3.getString("username");
                        }
                    %>
                        <div class="poster-name">
                            <%=poster_name %>
                        </div>
                        <div class="posted-date">
                            <%=calculatePostedTime(rs2.getTimestamp("post_date")) %>
                        </div>
                    </div>
                    <div class="post-body theme">
                        <div class="post-title">
                            <h1><%=rs2.getString("post_title") %></h1>
                        </div>
                        <div class="post-text">
                            <%=rs2.getString("post_text") %>
                        </div>
                    </div>
                    <div class="post-footer theme">
                        <a href="#" class="comment-button">
                            <img src="images/message.png" alt="Comment Button">
                            <span class="comment-word">Comments</span>
                        </a>
                        <div class="like-button">
                            <button>
                                <img src="images/like.png" alt="Like Button"> 
                                <div class="like-word theme">Like</div>
                            </button>
                        </div>
                        <div class="share-button">
                            <button>
                                <img src="images/sharec.png" alt="Share Button"> 
                                <div class="share-word theme">Share</div>
                            </button>
                        </div>
                    </div>
                </div>
            	<%
            		    }
            		} catch (Exception e) {
        				e.printStackTrace();
        			} finally {
        				try {
        					conn.close();
        				} catch (SQLException e) {
        					e.printStackTrace();
        				}
        			}
            	%>
                <div class="post theme">
                    <div class="post-header theme">
                        <div class="poster-profile-img">
                            <img src="images/hanni.jpg" alt="">
                        </div>
                        <div class="poster-name">
                            ilikehanni
                        </div>
                        <div class="posted-date">
                            Posted 6 minutes ago
                        </div>
                    </div>
                    <div class="post-body theme">
                        <div class="post-title">
                            <h1>Hanni's Fancam for Hype Boy on SBS Inkigayo</h1>
                        </div>
                        <div class="post-text">
                            Hanni is such an allrounder, she got the visuals, vocals, and moves.
                        </div>
                        <div class="media-container">
                            <iframe class="media-body" src="https://www.youtube.com/embed/X687sc6_VTA" frameborder="0" allowfullscreen></iframe>
                        </div>
                        <div class="post-text">
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus beatae asperiores illo, libero facere tempora animi, hic enim deleniti quaerat placeat debitis harum laborum exercitationem distinctio autem dolores iste reiciendis?
                        </div>
                    </div>
                    <div class="post-footer theme">
                        <a href="#" class="comment-button">
                            <img src="images/message.png" alt="Comment Button">
                            <span class="comment-word">Comments</span>
                        </a>
                        <div class="like-button">
                            <button>
                                <img src="images/like.png" alt="Like Button"> 
                                <div class="like-word theme">Like</div>
                            </button>
                        </div>
                        <div class="share-button">
                            <button>
                                <img src="images/sharec.png" alt="Share Button"> 
                                <div class="share-word theme">Share</div>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="post theme">
                    <div class="post-header theme">
                        <div class="poster-profile-img">
                            <img src="images/hanni.jpg" alt="">
                        </div>
                        <div class="poster-name">
                            ilikehanni
                        </div>
                        <div class="posted-date">
                            Posted 6 minutes ago
                        </div>
                    </div>
                    <div class="post-body theme">
                        <div class="post-title">
                            <h1>Hanni's Fancam for Hype Boy on SBS Inkigayo</h1>
                        </div>
                        <div class="media-container">
                            <iframe class="media-body" src="https://www.youtube.com/embed/X687sc6_VTA" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="post-footer theme">
                        <a href="#" class="comment-button">
                            <img src="images/message.png" alt="Comment Button">
                            <span class="comment-word">Comments</span>
                        </a>
                        <div class="like-button">
                            <button>
                                <img src="images/like.png" alt="Like Button"> 
                                <div class="like-word theme">Like</div>
                            </button>
                        </div>
                        <div class="share-button">
                            <button>
                                <img src="images/sharec.png" alt="Share Button"> 
                                <div class="share-word theme">Share</div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="forum-section theme">
                <div class="forum-profile theme">
                    <div class="index-title">
                        <h1>Welcome to MuseIt!</h1>
                    </div>
                    <div class="index-desc">
                        <p>
                            MuseIt is a blend of Reddit and Tinder, but only under the pretense of a browser wall. Create your music, unify under commonalities, 
                            share your thoughts and post it for the commmunity to enjoy.
                        </p>
                    </div>
                </div>
                <div class="forum-profile theme">
                    <div class="forum-name">
                        <h1>m+General</h1>
                    </div>
                    <div class="forum-desc">
                        <p>All the most recent posts are here! Look at what's currently happening in the music community.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <input type="hidden" id="user" value=<%=session.getAttribute("name")%>>
    <script src="js/index.js" type="text/javascript"></script>
</body>
</html>