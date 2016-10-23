<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" /> 
        <title>Instagrim</title>
        <style type="text/css">
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
       #titel_img{ 
             width:500px;
             height:300px;
        } 
        #log_image { 
             z-index: 0; 
             position: absolute; 
             left: 50%;
             top:50%; 
             height: 200px;
             margin-left: -200px;
             margin-top:-100px; 
        } 
        #text_box{ 
             position: absolute; 
             width:200px;
             top:50px; 
             left:40px; 
             z-index: 1; 
/* background-color: #FF0000;*/ 
        } 
       #text_box div{ 
            color:white;
            font-size:30px; 
        } 
       #titel_text{ 
           position: absolute; 
       }
        </style>
        
    </head>
    <body background="1.jpg">
        <header>
        <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
       <h2 style=" text-align:right;color:white">Your world in Black and White</h2>  
        </header>
        <nav>
            <ul id="nav">
                <li><a style="text-decoration:none" href="/Instagrim">Home</a><li><br><br>
                <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
               <li> <a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li><br><br>
                <%}
                            }else{
                                %>
                <li style="background-color:darkseagreen;"><a style="text-decoration:none" href="register.jsp">Register</a></li><br><br>
                 <li><a style="text-decoration:none" href="login.jsp">Login</a></li>
                 <%          
                    }%>
            </ul>
        </nav>
       
        <article>
                <form method="POST"  action="Register">
                <ul>
                <div id="log_image"> 
                <div id="titel_text"> 
                <img id=titel_img src="3.jpg">
                </div> 
                <div id="text_box"> 
                <div style="font-size:17px">User Name <input type="text" name="username"></div><br>
                <div style="font-size:17px"> Password <input type="password" name="password"></div> <br>
                <div style="font-size:17px"> E-mail <input type="email" name="e-mail"></div> <br>
                <input style="color:darkseagreen;font-size:17px" type="submit" value="Register"></div> 
                </div>  </ul>                  
                <br/>
               
            </form>

        </article>
        <footer>
            <ul>
                
            </ul>
        </footer>
    </body>
</html>
