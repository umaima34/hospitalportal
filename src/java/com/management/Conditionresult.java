/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.management;

import com.commondb.Common_DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Java
 */
@WebServlet(name = "Conditionresult", urlPatterns = {"/Conditionresult"})
public class Conditionresult extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Conditionresult</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Conditionresult at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession ss1=request.getSession(true);
        String pat=ss1.getAttribute("pid").toString();
        System.out.println(pat);;
        String tablet=request.getParameter("t1");
        String timi1=request.getParameter("cc1");
        if(timi1==null)
        {
            timi1="No";
            System.out.println("Morning= "+timi1);
        }
        else
        {
            timi1="Yes";
            System.out.println("Morning= "+timi1);
        }
        String timi2=request.getParameter("cc2");
        if(timi2==null)
        {
            timi2="No";
            System.out.println("Morning= "+timi2);
        }
        else
        {
            timi2="Yes";
            System.out.println("Morning= "+timi2);
        }
        String timi3=request.getParameter("cc3");
        if(timi3==null)
        {
            timi3="No";
            System.out.println("Afternoon= "+timi3);
        }
        else
        {
            timi3="Yes";
            System.out.println("Night= "+timi3);
        }
        String descrip=request.getParameter("m1");
        
        try
        {
            String query1="insert into conditionresult(patientid,tabletname,morning,afternoon,night,description) values ('"+pat+"', '"+tablet+"','"+timi1+"','"+timi2+"','"+timi3+"','"+descrip+"')";
            int j=Common_DB.InsertTable("hospital", query1);
            if(j>0)
            {
                response.sendRedirect("Condition.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
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
