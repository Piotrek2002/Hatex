<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 02.05.2020
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">


    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>

<%@include file="backend-menu.jsp" %>
<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-3 ">
                    <h1 class="h2">Zamówienia</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pr-5"><a type="button" class="btn form-control btn-outline-secondary "
                                                    href="/order/add">Nowe zamówienie</a></li>
                                <li><input class="form-control" id="myInput" type="text" placeholder="Search" aria-label="Search"></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="all">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Numer</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Cena</th>
                                    <th>Data</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach items="${orders}" var="order">
                                    <tr onclick="window.location='/order/details/${order.id}';">
                                        <c:if test="${order.progress==0}">
                                            <td><i class="fas fa-calculator text-secondary mr-2 pr-2"></i></td>
                                        </c:if>
                                        <c:if test="${order.progress==1}">
                                            <td><i class="fa fa-times text-danger mr-2 pr-2"></i></td>
                                        </c:if>
                                        <c:if test="${order.progress==2}">
                                            <td><i class="fa fa-check text-success mr-2 pr-2"></i></td>
                                        </c:if>
                                        <c:if test="${order.progress==3}">
                                            <td><i class="fas fa-dollar-sign text-warning mr-2 pr-2"></i></td>
                                        </c:if>
                                        <td>${order.id}</td>
                                        <td>${order.customer.name}</td>
                                        <td>${order.customer.surname}</td>
                                        <td>${order.price}</td>
                                        <td>${order.created.dayOfMonth}-${order.created.month}-${order.created.year}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>