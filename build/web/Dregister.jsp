<%-- 
    Document   : Dregister
    Created on : Mar 13, 2017, 11:00:14 PM
    Author     : Java
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function func()
        {
            var a1=document.ff1.t1.value;
            var a2=document.ff1.t2.value;
            var a3=document.ff1.t3.value;
            var a4=document.ff1.t4.value;
            var a5=document.ff1.t5.value;
            var a6=document.ff1.t6.value;
            var a7=document.ff1.t7.value;
            
            if((a1=="")||(a2=="")||(a3=="")||(a4=="")||(a5=="")||(a6=="")||(a7==""))
            {
                alert("Please fill all fields");
                return false;
            }
            else if(a2!=a3)
            {
                alert("Password and confirm password should be same");
                return false;
            }
            
        }
    </script>
    <body align="center">
        <h1>Doctor Registration Page!</h1>
        <form name="ff1" action="Register" method="POST" onsubmit="return func()">
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td>Doctor Name:</td>
                        <td><input type="text" name="t1" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="t2" value="" /></td>
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td><input type="password" name="t3" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email ID:</td>
                        <td><input type="email" name="t4" value="" /></td>
                    </tr>
                    <tr>
                        <td>Mobile Number:</td>
                        <td><input type="number" name="t5" value="" /></td>
                    </tr>
                    <tr>
                        <td>Qualification:</td>
                        <td><input type="text" name="t6" value="" /></td>
                    </tr>
                    <tr>
                        <td>Specialization:</td>
                        <td><input type="text" name="t7" value="" /></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><select name="t8">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                </tbody>
            </table><br><br>
            <input type="submit" value="Register" name="b1" />
        </form>
    </body>
</html>
