<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        
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
        #zjda01{
            margin-left:150px;
            float:left
        }
        </style>       
    </head>
    <body background="/Instagrim/1.jpg">
       <header>
            <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
             <h2 style=" text-align:right;color:white">Your world in Black and White</h2>  
        </header>
        
        <nav>
            <ul id="nav">
                <li> <a style="text-decoration:none" href="/Instagrim">Home</a></li><br><br>
                <li><a style="text-decoration:none" href="/Instagrim/upload.jsp">Upload</a></li><br><br>
                 <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li style="background-color:darkseagreen;"><a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li><br><br>
                
                <%}
                            }else{
                                %><%          
                    }%>
              <li> <a style="text-decoration:none" href="/Instagrim/Logout"> Logout</a></li><br><br>
            </ul>
        </nav>
 
        <article>
            <br><br><br>
            <h1  style="color: white;text-align: left;padding-left: 200px">Your Pics </h1>
           <p style="color: white;text-align: left;padding-left: 200px">click the pics to add comment</p>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %> 
        <p style="color:white;padding-left: 200px">No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();
                    String picname=p.getSUUID();
        %>
        <ul class="hello">
            <div id="zjda01">
            <a href="/Instagrim/comment/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
            </div>
            
        </ul>
        <%

            }
            }
        %>
        </article>
        <footer>
            <ul>
               
            </ul>
        </footer>
    </body>
</html>
