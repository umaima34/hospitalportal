<%-- 
    Document   : Condition
    Created on : Mar 15, 2017, 12:10:59 AM
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
        <h1>Patient Condition</h1>
        <form name="fff1" action="Conditionresult.jsp" method="POST">
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>Select Patient</th>
                        <th>Patient ID</th>
                        <th>Condition</th>
                        <th>Started Timing</th>
                        <th>Information</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs1=Common_DB.ViewTable("hospital", "healthproblem");
                        while(rs1.next())
                        {
                     %>
                    <tr>
                        <td><input type="checkbox" name="c12" value="<%=rs1.getString(1)%>"/></td>
                        <td><%=rs1.getString("patientid")%></td>
                        <td><%=rs1.getString("condition")%></td>
                        <td><%=rs1.getString("startedtiming")%></td>
                        <td><%=rs1.getString("information")%></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table><br><br>
                <input type="submit" value="Submit" name="b2" />
        </form>
    </body>
</html>
