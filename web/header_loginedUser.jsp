<%-- 
    Document   : header_loginedUser
    Created on : Mar 15, 2022, 4:03:33 PM
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
        <nav>
            <ul>
                <li>
                    <a href="mainController?action=search&txtsearch=&searchBy=byname">Home</a>
                </li>
                <li>

                    <a href="mainController?action=changeProfilePage&txtemail=${sessionScope.email}">change profile</a>
                </li>
                <li>
                    <a href="mainController?action=viewOrder&orderstatus=2">completed orders</a>
                </li>
                <li>
                    <a href="mainController?action=viewOrder&orderstatus=3">Canceled orders</a>
                </li>
                <li>
                    <a href="mainController?action=viewOrder&orderstatus=1">proccessing orders</a>
                </li>
                <li>
                    from <input type="date" name="from"> to <input type="date" name="to">
                    <input type="submit" name="search">
                </li>
            </ul>

        </nav>
    </body>
</html>
