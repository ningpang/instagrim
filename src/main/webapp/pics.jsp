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
        ul{
            float:left;
        }
        a{
            padding-right:50px;
            float:left;
        }
        li{
            margin-left:20px;
            font-size:20px;
            font-weight:bold;
            color:white;
            display:block;
            border:1px solid black;
            width:100px;
            
            text-decoration:none;
            text-align:center;
            background-color:darkseagreen;
        }
        li:hover{
            color:red;
            }
        #zjda01{margin-left:50px;float:left}
        </style>       
    </head>
    <body background="/Instagrim/1.jpg">
       <header>
            <center> <h1 style="color:white">InstaGrim !</h1></center><hr>
             <h2 style=" text-align:right;color:white">Your world in Black and White</h2>  
        </header>
        
        <nav>
            <ul>
                <a style="text-decoration:none" href="/Instagrim"><li>Home</li></a>
                <a style="text-decoration:none" href="/Instagrim/upload.jsp"><li>Upload</li></a>
                 <%        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <a style="text-decoration:none" href="/Instagrim/Images/<%=lg.getUsername()%>"><li style="background-color:white;color:darkseagreen;">Images</li></a>
                
                <%}
                            }else{
                                %><%          
                    }%>
               <a style="text-decoration:none" href="/Instagrim/Logout"> <li>Logout</li></a>
            </ul>
        </nav>
 
        <article>
            <br><br><br>
            <h1 style="color: white;text-align: left;padding-left: 50px">Your Pics</h1>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %> 
        <p style="color:white">No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        
            <div id="zjda01">
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
            </div>
        
        
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
