<%-- 
    Document   : detail
    Created on : May 9, 2020, 4:18:52 PM
    Author     : deptr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c1" uri="http://www.springframework.org/tags/form" %> 

<%-- Check login --%>
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
        <title>Trang chủ</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .dropdown:hover>.dropdown-menu {
                display: block;
            }

            body{
                background-image: url("https://i.ibb.co/d7j4XDk/background-qlkho.jpg");
                background-repeat: no-repeat;   
            }
        </style>

    </head>
    <body style="background-color: silver; ">
        <div class="container">
            <!-- NavBar -->
            <%@include file="navBar.jsp" %>
            <!-- NavBar -->

            <div class="container">
                <div class="container my-5">
                    <div class="row mx-3">
                        <div class="col-4">
                            <c1:form method="post" action="index.htm">
                                <ul class="list-group">
                                    <li class="list-group-item">Giá</li>
                                    <li class="list-group-item">
                                      <div class="row">
                                        <div class="col">
                                            <input type="number" class="form-control" placeholder="Thấp nhất" name="gia1" max="2147483647">
                                        </div>
                                        <h3>-</h3>
                                        <div class="col">
                                            <input type="number" class="form-control" placeholder="Cao nhất" name="gia2" max="2147483647">
                                        </div>
                                      </div>
                                    </li>

                                    <li class="list-group-item">
                                        Nhà xuất bản

                                        <button class="btn btn-outline-secondary btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample" 
                                                aria-expanded="false" aria-controls="collapseExample" style="margin-left: 140px">>
                                        </button>

                                    </li>
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body">
                                            <c:forEach var="it" items="${dsnxb}">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheckxb${it.maNXB}" name="nhaxb" value="${it.maNXB}">
                                                    <label class="custom-control-label" for="customCheckxb${it.maNXB}">${it.tenNXB}</label>
                                                </div>
                                            </c:forEach>
                                            <div class="custom-control custom-checkbox" style="display: none">
                                                <input type="checkbox" class="custom-control-input" id="customChecknhaxb" name="nhaxb" value="0" checked="true">
                                                <label class="custom-control-label" for="customChecknhaxb"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <li class="list-group-item">
                                        Năm xuất bản
                                    
                                        <button class="btn btn-outline-secondary btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample1" 
                                                aria-expanded="false" aria-controls="collapseExample1" style="margin-left: 135px">>
                                        </button>
                                    </li>
                                    <div class="collapse" id="collapseExample1">
                                        <div class="card card-body">
                                            <c:forEach var="it" items="${namxb}">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customChecknam${it}" name="nam" value="${it}">
                                                    <label class="custom-control-label" for="customChecknam${it}">${it}</label>
                                                </div>
                                            </c:forEach>
                                            <div class="custom-control custom-checkbox" style="display: none">
                                                <input type="checkbox" class="custom-control-input" id="customChecknam" name="nam" value="0" checked="true">
                                                <label class="custom-control-label" for="customChecknam"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <li class="list-group-item">
                                        Tác giả
                                    
                                        <button class="btn btn-outline-secondary btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample2" 
                                                aria-expanded="false" aria-controls="collapseExample2" style="margin-left: 187px">>
                                        </button>
                                    </li>
                                    <div class="collapse" id="collapseExample2">
                                        <div class="card card-body">
                                            <c:forEach var="it" items="${dstacgia}">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customChecktg${it.maTacGia}" name="tacgia" value="${it.maTacGia}">
                                                    <label class="custom-control-label" for="customChecktg${it.maTacGia}">${it.tenTacGia}</label>
                                                </div>
                                            </c:forEach>
                                            <div class="custom-control custom-checkbox" style="display: none">
                                                <input type="checkbox" class="custom-control-input" id="customChecktg" name="tacgia" value="0" checked="true">
                                                <label class="custom-control-label" for="customChecktg"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <li class="list-group-item">
                                        Nhà cung cấp
                                    
                                        <button class="btn btn-outline-secondary btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample3" 
                                                aria-expanded="false" aria-controls="collapseExample3" style="margin-left: 137px">>
                                        </button>
                                    </li>
                                    <div class="collapse" id="collapseExample3">
                                        <div class="card card-body">
                                            <c:forEach var="it" items="${dsncc}">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheckncc${it.maNCC}" name="ncc" value="${it.maNCC}">
                                                    <label class="custom-control-label" for="customCheckncc${it.maNCC}">${it.tenNCC}</label>
                                                </div>
                                            </c:forEach>
                                            <div class="custom-control custom-checkbox" style="display: none">
                                                <input type="checkbox" class="custom-control-input" id="customCheckncc" name="ncc" value="0" checked="true">
                                                <label class="custom-control-label" for="customCheckncc"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Áp dụng</button>
                                </ul>
                            </c1:form>
                        </div>
                        <div class="col-8">
                            <%@include file="product.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
            
        </div>


    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script>
        $(".clickable").click(function() {
            
            $(this).removeClass("btn-outline-dark");
            $(this).val();
        });    
    </script>


    
    
</html>
