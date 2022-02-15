<%-- 
    Document   : Slottiming
    Created on : Mar 13, 2017, 11:50:46 PM
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
    <script>
        function valid()
        {
            var aa1=document.form2.c1.value;
            
            if(aa1>1)
            {
                alert("Please select one slot");
                return false;
            }
            return true;
        }
    </script>
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
            //Logger.getLogger(Slot.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
            
        %>
        <h1>Select Timing</h1>
        <h4>Welcome,<%=ppid%> </h4>
        <form name="form2" action="Slottiming" method="POST" onsubmit="return valid()">
            <div>
  <h3>Morning Timings</h3>
  <label>
    <input type="checkbox" class="radio" value="9.00 AM-10.00 AM" name="c1" />9.00 AM-10.00 AM</label>&nbsp;&nbsp;
  <label>
    <input type="checkbox" class="radio" value="10.00 AM-11.00 AM" name="c1" />10.00 AM-11.00 AM</label>&nbsp;&nbsp;
  <label>
    <input type="checkbox" class="radio" value="11.00 AM-12.00 PM" name="c1" />11.00 AM-12.00 PM</label>&nbsp;&nbsp;
    <label>
    <input type="checkbox" class="radio" value="12.00 PM-1.00 PM" name="c1" />12.00 PM-1.00 PM</label>&nbsp;&nbsp;
    <label>
    <input type="checkbox" class="radio" value="1.00 PM-2.00 PM" name="c1" />1.00 PM-2.00 PM</label>&nbsp;&nbsp;
</div>
<div>
  <h3>Afternoon Timings</h3>
  
  <label>
    <input type="checkbox" class="radio" value="3.00 PM-4.00 PM" name="c1" />3.00 PM-4.00 PM</label>&nbsp;&nbsp;
  <label>
    <input type="checkbox" class="radio" value="4.00 PM-5.00 PM" name="c1" />4.00 PM-5.00 PM</label>&nbsp;&nbsp;
  <label>
    <input type="checkbox" class="radio" value="5.00 PM-6.00 PM" name="c1" />5.00 PM-6.00 PM</label>&nbsp;&nbsp;
    <label>
    <input type="checkbox" class="radio" value="6.00 PM-7.00 PM" name="c1" />6.00 PM-7.00 PM</label>&nbsp;&nbsp;
    <label>
    <input type="checkbox" class="radio" value="7.00 PM-8.00 PM" name="c1" />7.00 PM-8.00 PM</label>&nbsp;&nbsp;
</div><br><br>
           
            <input type="submit" value="Select" name="bb1" />
        </form>
    </body>
</html>
