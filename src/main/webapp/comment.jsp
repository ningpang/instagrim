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
   <script type="text/javascript">  
    //刷新页面  
    function refreshOnce(){  
           if (location.href.indexOf("?xyz=") < 0) {  
                 location.href = location.href + "?xyz=" + Math.random();  
            }  
     }  
</script>   
          
<body onload="refreshOnce()">  

    <head>
        
        <title>Instagrim</title>
       <style type="text/css">
        ul{
            float:left;
        }
       
        div.abs{
            position: relative;
            top:14px;
            left:18px;
            width:100%;
}
   div.rel{
           color:darkseagreen;
           font-size:30px;
           position: absolute;
           top:0;
           left:800px;
           width:250px;
}
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
            margin-left:50px;
            float:left
        }
        </style>       
    </head>
    <body background="/Instagrim/1.jpg">
       <header>
            <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
             <h2 style=" text-align:right;color:white">Your world in Black and White</h2> 
              <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                    <ul id="nav"><li> <a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>">Back</a></li></ul><br><br>      
               <%}}%>
        </header>
       <%
           String img=(String)session.getAttribute("imgnow");
           String hello=(String)session.getAttribute("commentword");
           hello=hello.substring(5,hello.length()-2);
           hello=hello.replace(",", "<br>");
       %>
       <div class="abs">
           
       <div>
        <img src="/Instagrim/Image/<%=img%>" width="50%">
       </div>
        <div class="rel">
            <p style="color:white;font-size:25px">COMMENT AREA</p><hr>
            <a><%=hello%></a>
        </div>
        <div style="font-size: 20px">
            <form method="POST" action="comment">
                 <input type="text" name="comment">
            <input type="submit" value="click to comment">
            </form>
        </div>
        
       
        
       </div>
        <footer>
            <ul>
               
            </ul>
        </footer>
            
    </body>
</html>
