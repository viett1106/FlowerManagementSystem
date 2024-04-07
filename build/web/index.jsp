<%-- 
    Document   : newjsp
    Created on : Mar 14, 2022, 4:18:08 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>

        <header>
            <c:if test="${sessionScope.email == null}">
                <%@include file="header.jsp" %>
            </c:if>
            
            
            <c:if test="${sessionScope.email != null}">
                <%@include file="header_loginedUser.jsp" %>
            </c:if>
        </header>

        <section>

            <c:if test="${sessionScope.email != null}">
                <h3>Welcome, ${sessionScope.name}</h3>
                <a href="mainController?action=logout&action2=testnek">Logout</a>
            </c:if>

            <h1>INDEX HERE!</h1>
            <p>This website is deploying in ${requestScope.tmp}</p>
            <p>Language is used only in this page: ${requestScope.tmp2}</p>

            <table class="product">

                <c:forEach var="p" items="${requestScope.LIST_PLANT}">
                    <tr>
                        <td>
                            <img src="${p.imgpath}" alt="alt" class="plantimg"/>
                        </td>

                        <td>Product ID: ${p.id}</td>
                        <td>Prduct Name: ${p.name}</td>
                        <td>Price: ${p.price}</td>
                        <td>Status ${p.status}</td>
                        <td>Category: ${p.catename}</td>
                        <!--<td><a href="#">view details</a></td>-->
                        <td><a href="mainController?action=addtocart&pid=${p.id}">Add to cart</a></td>

                    </tr> 
                </c:forEach>

            </table>

        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
