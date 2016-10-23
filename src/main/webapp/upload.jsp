<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <style>
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
             width:400; 
             margin-left: -200px;
             margin-top:-100px; 
        } 
        #text_box{ 
             position: absolute; 
             width:200px;
              top:100px; 
             left:40px; 
             z-index: 1; 

        } 
      #text_box div{ 
            color:white;
            font-size:20px; 
        } 
      #titel_text{ 
           position: absolute; 
       }
            </style>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body background="1.jpg">
         <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
         <h2 style="text-align: right; color:white">Your world in Black and White</h2>
        <nav>
            <ul id="nav">
                <li><a style="text-decoration:none" href="/Instagrim"> Home</a></li><br><br>
                <li style="background-color:darkseagreen"><a style="text-decoration:none" href="upload.jsp">Upload</a></li><br><br>
                
                <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                    <li><a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li><br><br>
                
                <%}
                            }else{
                                %><%          
                    }%>
                <li><a style="text-decoration:none" href="Logout"> Logout</a></li>
            </ul>
        </nav>
 
        <article>
           
            <form method="POST" enctype="multipart/form-data" action="Image">
               
            <ul>
                <div id="log_image"> 
                <div id="titel_text"> 
                <img id=titel_img src="3.jpg">
                </div> 
                <div id="text_box"> 
                    <div>File to Upload</div><br>
                    <div> <input type="file" name="upfile"></div><br><br>
                <input type="submit" value="Confirm">
                 
                </div>  </ul>                        
            </form>
            
        </article>
        <footer>
            <ul>
               
            </ul>
        </footer>
    </body>
</html>
