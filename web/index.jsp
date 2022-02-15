<%-- 
    Document   : index
    Created on : Mar 12, 2017, 12:27:37 AM
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
            var a1=document.f1.t1.value;
            var a2=document.f1.t2.value;
            
            if((a1=="")||(a2==""))
            {
                alert("Enter username and password");
                return false;
            }
            return true;
        }
    </script>
    <body align="center">
        <h1>Login Page!</h1>
        <form name="f1" action="Dlogin" method="POST" onsubmit="return func()">
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="t1" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="t2" value="" /></td>
                    </tr>
                </tbody>
            </table><br><br>
            <input type="submit" value="Login" name="b1" />
            
            
        </form><br>
        <form name="f2" action="Dregister.jsp" method="post">
            <button type="submit" name="register" onclick="f2.action='Dregister.jsp';"><span>Doctor registration </span></button>
            </form>
    </body>
</html>
