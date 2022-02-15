<%-- 
    Document   : Report
    Created on : Mar 14, 2017, 10:22:33 PM
    Author     : Java
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.commondb.Common_DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   
    <body align="center">
        <%
            String ppid=null;
            HttpSession ss1=request.getSession(true);
            String selectitem=request.getParameter("c1");
            System.out.println(selectitem);
        try {
            ResultSet rrs=Common_DB.ViewParticularData("hospital", "pregister", "sl_no", selectitem);
            if(rrs.next())
            {
                ppid=rrs.getString("id");
                System.out.println(ppid);
                ss1.setAttribute("pid", ppid);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
            
            
            
        %>
        <h1>Upload X-ray report</h1><br><br>
        <h3>Welcome,<%=ppid%></h3>
        <form name="f2" action="Report" method="POST" enctype="multipart/form-data">
            <label>Choose File: <input type="file" name="Browse" value="" /> </label><br><br>
            <input type="submit" value="Upload" name="b1" />
            
        </form>
    </body>
</html>
