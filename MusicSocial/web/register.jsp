<%-- 
    Document   : register
    Created on : Jul 10, 2014, 12:27:26 AM
    Author     : hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form method="post" action="Account">
            <table>
                <tr>
                    <h1>Register</h1>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtName"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtPassword" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type = "text" name="txtEmail"/></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit" name="act" value="register">Create</button></td>
                </tr>
            </table>
            <c:if test="${!empty(msgR)}" >
                <h2 style="color:red;">${msgR}</h2>
            </c:if>
        </form>
    </body>
</html>
