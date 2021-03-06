<%-- 
    Document   : dsloaisach
    Created on : Apr 20, 2020, 9:44:50 PM
    Author     : Trac Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c1" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c1" uri="http://www.springframework.org/tags/form" %> 
<c:choose>
    <%-- If have any account login --%>
    <c:when test="${sessionScope.user != null}">
        <c:choose>
            <%-- If have role --%>
            <c:when test="${sessionScope.role != null}">
                <c:choose>
                    <c:when test="${sessionScope.role == 1}">
                        <style type="text/css">
                            .hideDropdown{
                                display: none;
                            }
                            #userDropdown{
                                display: none;
                            }
                        </style>
                    </c:when>
                    <c:otherwise>
                        

                        <c:choose>
                            <c:when test="${sessionScope.role == 2}">
                                <style type="text/css">
                                    .hideDropdown{
                                        display: none;
                                    }
                                    #adminDropdown{
                                        display: none;
                                    }
                                </style>
                            </c:when>
                            <c:otherwise>
                                <style type="text/css">
                                    .hideDropdown{
                                        display: none;
                                    }
                                    #adminDropdown{
                                        display: none;
                                    }
                                    #adminStorage{
                                        display: none;
                                    }
                                </style>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>

    </c:when>

    <%-- If haven't account login --%>
    <c:otherwise>
        <%-- Hide Item INFO_ACCOUNT --%>
        <style type="text/css">
            #userDropdown{
                display: none;
            }
            #adminDropdown{
                display: none;
            }
            #adminStorage{
                display: none;
            }
        </style>
    </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <title>Doanh thu</title>
        <style>
            .error {
                color: red;
            }
            .dropdown:hover>.dropdown-menu {
                display: block;
            }

            body{
                background-image: url("https://i.ibb.co/d7j4XDk/background-qlkho.jpg");
                background-repeat: no-repeat;   
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="navBar.jsp" %>

            <div class="rounded-lg mx-5 my-5" style="background-color: white;">
            <h1 class="text-center" style="padding-top: 30px">Danh s??ch Lo???i s??ch</h1>

            <a class="btn btn-secondary" role="button" href="qlkho.htm" style="right: 20px; margin-left: 20px;">Tr??? v???</a>    
            <div style="margin: 20px; overflow: auto;">

                <table class="table table-hover table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">T??n s??ch</th>
                            <th scope="col">T??n t??i kho???n</th>
                            <th scope="col">S??? ??i???n tho???i</th>
                            <th scope="col">?????a ch???</th>
                            <th scope="col">S??? l?????ng s??ch</th>
                            <th scope="col">T???ng ti???n</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="it" items="${doanhthu}">
                            <tr>
                                <th scope="row">${it.getTenSach()}</th>
                                <td>${it.getTenTK()}</td>
                                <td>${it.sdt}</td>
                                <td>${it.diachi}</td>
                                <td>${it.soLuong}</td>
                                <td>${it.tongTien} VND</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            </div>
            
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>