<%-- 
    Document   : viewCart.jsp
    Created on : Mar 17, 2022, 6:28:15 PM
    Author     : Fang Long
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%
//            Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new HashMap<>();
//            }
//            session.setAttribute("cart", cart);
        %>

        <c:if test="${sessionScope.cart != null}">
            <table>

                <tr><td>product id</td><td>quantity</td><td>action</td></tr>

                <c:forEach var="c" items="${sessionScope.cart}">
                    <form action="mainController">
                        <tr>
                            <td>
                                <input type="hidden" name="pid" value="${c.key}">
                                <a href="#">${c.key}</a>
                            </td>

                            <td>
                                <input type="number" name="quantity" value="${c.value.name}">
                            </td>
                            <td><input type="submit" name="action" value="update">
                                <input type="submit" name="action" value="delete">
                            </td>
                        </tr>
                    </form>


                </c:forEach>
                <tr>Total money:</tr>
            </table>

        </c:if>
        <c:if test="${sessionScope.cart == null}">
            Not thing in cart!!!
        </c:if>
            

    </body>
</html>
