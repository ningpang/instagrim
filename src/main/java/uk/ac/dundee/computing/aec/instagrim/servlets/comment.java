/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "comment", urlPatterns = {"/comment","/comment/*"})
public class comment extends HttpServlet {

    Cluster cluster=null;


    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String tmp=request.getRequestURI();
        String[] parts=tmp.split("/");
        
        System.out.print(parts[3]);
        User us=new User();
        us.setCluster(cluster);

        HttpSession session=request.getSession();
        System.out.println("Session in servlet "+session);
        session.setAttribute("imgnow", parts[3]);
            
            RequestDispatcher rd=request.getRequestDispatcher("/comment.jsp");
	    rd.forward(request,response);       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        User us=new User();
        
        us.setCluster(cluster);
        
        String comment = (String)request.getParameter("comment");
        String picid=(String)session.getAttribute("imgnow");
             
        System.out.println(comment+picid);
        
        Session session1 = cluster.connect("instagrim");
        String code="update pics set comment=comment+{\'"+comment+"\'} where picid="+picid;
        PreparedStatement ps = session1.prepare(code);
       
        BoundStatement boundStatement = new BoundStatement(ps);
        ResultSet rs =session1.execute( // this is where the query is executed
                boundStatement.bind());
            String word="\n";
        for (Row row:rs)
        {
            word=row.toString();
        }
        LoggedIn lg=(LoggedIn)session.getAttribute("LoggedIn");
        session.setAttribute("commentword", word);
        System.out.println("Session in servlet "+session);
        response.sendRedirect("/Instagrim/Images/"+lg.getUsername());
        
    }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
