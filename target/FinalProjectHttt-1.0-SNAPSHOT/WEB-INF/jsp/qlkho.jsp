<%-- 
    Document   : qlkho
    Created on : Apr 18, 2020, 11:35:55 PM
    Author     : Trac Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Quản lý kho</title>
        <style>
            .center {
                margin: 0;
                /* position: absolute; */
                /* position: fixed; */
                /* top: 50%;
                left: 30%; */
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
            }
            .c {
                margin-bottom: 20px;
            }
            body {
                background-image: url("https://i.ibb.co/d7j4XDk/background-qlkho.jpg");
                background-repeat: no-repeat;
            }
            .dropdown:hover>.dropdown-menu {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="navBar.jsp" %>

            <div class="rounded-lg mx-5 my-5" style="background-color: white;">
                <h1 class="text-center" style="padding-top: 30px; color: black">Quản lý kho</h1>
                <div class="py-4 text-center">
                    <a class="c btn btn-outline-info ml-5" role="button" href="dsloaisach.htm">Danh sách Loại sách</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="dsncc.htm">Danh sách Nhà cung cấp</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="dsnxb.htm">Danh sách Nhà xuất bản</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="dstts.htm">Danh sách Tình trạng sách</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="dstacgia.htm">Danh sách Tác giả</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="dssach.htm">Danh sách Sách</a>
                    <br>
                    <a class="c btn btn-outline-info ml-5" role="button" href="doanhthu.htm">Quản lý doanh thu</a>
                </div>
            </div>

            <%@include file="footer.jsp" %>
        </div>

        


    </body>
</html>
