<%-- 
    Document   : Slot
    Created on : Mar 13, 2017, 11:32:48 PM
    Author     : Java
--%>

<%@page import="com.commondb.Common_DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body align="center">
        <h1>Patient Information!</h1>
        <form name="form1" action="Slottiming.jsp" method="POST">
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>Select Patient</th>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Mobile Number</th>
                        <th>Email ID</th>
                        <th>Age</th>
                        <th>Blood Group</th>
                        <th>Gender</th>
                        <th>Joining Date</th>
                        <th>Timing</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs=Common_DB.ViewTable("hospital", "pregister");
                        while(rs.next())
                        {
                    %>
                    <tr>
                        <td><input type="checkbox" name="c1" value="<%=rs.getString(1)%>"/></td>
                        <td><%=rs.getString("id") %></td>
                        <td><%=rs.getString("name") %></td>
                        <td><%=rs.getString("mobile") %></td>
                        <td><%=rs.getString("emailid") %></td>
                        <td><%=rs.getString("age") %></td>
                        <td><%=rs.getString("bgroup") %></td>
                        <td><%=rs.getString("gender") %></td>
                        <td><%=rs.getString("date") %></td>
                        <td><%=rs.getString("Timing") %></td>
                        <%
                       
                        HttpSession session1=request.getSession(true);
                        String sl=rs.getString(1);
                        session1.setAttribute("sl", sl);
                        String id=rs.getString("id");
                        session1.setAttribute("id", id);
                        %>
                    </tr>
            <%
            }
            %>
                </tbody>
            </table><br><br>
                <input type="submit" value="Select Timing" name="s1" />
                <button type="submit" name="s2" onclick="form.action='Report.jsp';"><span>Update Reports</span></button>
                <button type="submit" name="s2" onclick="form.action='Condition.jsp';"><span>Patient Condition</span></button>
        </form>
    </body>
</html>
