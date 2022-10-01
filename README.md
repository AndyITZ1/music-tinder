# MuseIt (Project Music Tinder)
MuseIt is an ongoing project that replicates a social media platform which centers on facilitating interactions for people with interests in music regardless of their background. Users are allow to share, discuss, and post their own creations as well as jumping on to the website to view what others have posted. While this may not a real platform, the project emulates how public forums work like Reddit and Tumblr.

# Project Development
The project was developed using Maven dependencies and Eclipse's dynamic web project. As for server hosting, Apache Tomcat was utilized to run servlet pages for the website. As for programming: 
- HTML, CSS and SASS laid the foundation for web page construction.
- JavaScript provided some of the user-interactive functionalities of the web pages.
- Java and MySQL made up the backend of the website allowing for interactions such as storing user data, post data, and linking the web pages together.

# Instructions for Porting to Your Device
1) Importing the Project to Your Choice of IDE
- While the original project was built in the Eclipse IDE for JEE development, you can use the source files provided in this repository and run it on a different IDE like IntelliJ as long as you have an IDE supports JEE applications/development. This step is important as a web project in Java is different from a regular Java project (Note the usage of the phrase JEE (Jakarta Enterprise Edition) which is the platform that is used provide Java technologies for web development).

2) Setting up a MySQL Database
The project utilized a MySQL image containerized by Docker. For running the project, you don't have to Docker or a database contained by Docker, you just need MySQL database running and its JDBC connection information. For the credentials to the MySQL database you are planning to use for this website. Simply to avoid having to directly change any part of the source code. You only need a .env file which store your username, password, and the JDBC database connection string.
## How the .env file should look:
```
DB_JDBC = "yourjdbcconnectionstring"
DB_USER = "yourusername"
DB_PASS = "yourpassword"
```

3) Ensure you have a Web/Application Server
The project used Apache Tomcat as the web server to run the web project. Note that other servers like Jetty, Apache TomEE and more can be used to run this project, but please note that these servers you have to be able to configure with your IDE to run the project.


# Image/Resource Attributions
- <a href="https://www.flaticon.com/free-icons/pencil" title="pencil icons">Pencil icons created by Pixel perfect - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/message" title="message icons">Message icons created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/like" title="like icons">Like icons created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/image" title="image icons">Image icons created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/share" title="share icons">Share icons created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/happy" title="happy icons">Happy icons created by Freepik - Flaticon</a>
