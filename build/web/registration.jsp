<%-- 
    Document   : registration
    Created on : Mar 15, 2022, 3:44:09 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <form action="mainController" method="post" class="form">
                <table>
                    <tr>
                        <td>email</td>
                        <td> <input type="text" name="txtemail"> </td>
                    </tr>
                    <tr>
                        <td>fullname</td>
                        <td> <input type="text" name="txtfullname"> </td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td><input type="password" name="txtpassword"></td>
                    </tr>
                    <tr>
                        <td>phone</td>
                        <td><input type="text" name="txtphone"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="action" value="register"></td>
                    </tr>
                </table>
            </form>
        <footer>
            <%@include file="footer.jp" %>
        </footer>
    </body>
</html>
