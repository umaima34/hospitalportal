<%-- 
    Document   : Conditionresult
    Created on : Mar 19, 2017, 10:55:04 PM
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
            String selectitem=request.getParameter("c12");
            System.out.println(selectitem);
        try {
            ResultSet rrs=Common_DB.ViewParticularData("hospital", "healthproblem", "serial", selectitem);
            if(rrs.next())
            {
                ppid=rrs.getString("patientid");
                System.out.println(ppid);
                ss1.setAttribute("pid", ppid);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        %>
        <h1>Description Page</h1>
        <h4>Welcome,<%=ppid%></h4>
        <form name="ff2" action="Conditionresult" method="POST">
            <table border="0" align="center">
                
                <tbody>
                    <tr>
                        <td>Tablet Name:</td>
                        <td><input type="text" name="t1" value="" /></td>
                    </tr>
                    <tr>
                       <td>Timings of Tablet:</td>
                       <td><label><input type="checkbox" name="cc1" value="Morning" />Morning</label>
                       <label><input type="checkbox" name="cc2" value="Afternoon" />Afternoon</label>
                       <label><input type="checkbox" name="cc3" value="Night" />Night</label></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><textarea name="m1" rows="4" cols="20">
                            </textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Send to patient" name="p1" />
        </form>
    </body>
</html>
