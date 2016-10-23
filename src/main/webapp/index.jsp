<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <meta charset="utf-8" /> 
        <style >
       ul#nav{ 
           position:absolute;
           left:30px;
           height:60px;
         
           margin:0 auto} 
      ul#nav li{
          display:inline;
            background:#00A2CA;
         
          height:40px} 
      ul#nav li a{
          width:70px;  
          text-align: center;
          display:inline-block;
          padding:0 30px;
          height:60px;
          line-height:60px;
          color:#FFF;
          font-family:"\5FAE\8F6F\96C5\9ED1";
          font-size:20px;} 
      ul#nav li a:hover{
          background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
      #face{
          position: absolute;
          top:150px;
          right:80px;
      } 
        </style>
     
    </head>
    <body background="1.jpg">
        <header>
            <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
        </header>
        <nav>
            <ul id="nav">
              <li style="background-color:darkseagreen" >  <a  style="text-decoration:none" href="/Instagrim">Home</a></li>
                <li><a style="text-decoration:none" href="upload.jsp">Upload</a> <li>
                    <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a><li>
                 <li><a style="text-decoration:none" href="/Instagrim/Logout">Logout</a></li>
              
                    <%}
                            }else{
                                %>
               <li> <a style="text-decoration:none" href="register.jsp">Register</a></li>
                <li><a style="text-decoration:none" href="login.jsp">Login</a></li>
                
                <%          
                    }%>
            </ul>
            <br><br>
            <img id="face" src="2.jpg" >
                 
        </nav> 
<div> 
    
        <footer >
            <ul>
               <h2 class="footer" style="position:absolute;bottom:30px; color:white">Your world in Black and White</h2>    
            </ul>
        </footer>
    </body>
</html>
