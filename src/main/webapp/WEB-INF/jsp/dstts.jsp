<%-- 
    Document   : dstts
    Created on : Apr 20, 2020, 9:45:38 PM
    Author     : Trac Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c1" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <title>Danh s??ch T??nh tr???ng s??ch</title>

        <style>
            .error {
                color: red;
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
            <!-- Nav -->
            <%@include file="navBar.jsp" %>
            <!-- Table -->
            <div class="rounded-lg mx-5 my-5" style="background-color: white;">
                <h1 class="text-center" style="padding-top: 30px">Danh s??ch T??nh tr???ng s??ch</h1>

        <div style="margin: 20px; overflow: auto">

            <div style="padding-bottom: 20px">
                <c1:form method="post" commandName="tts" action="dstts.htm">

                    <button type="button" class="btn btn-light btn-outline-info" data-toggle="modal" data-target="#exampleModal">Th??m m???i</button>
                    <c1:errors path="tinhTrang" cssClass="error"/>

                    <a class="btn btn-secondary" role="button" href="qlkho.htm" style="right: 20px; margin-left: 20px;">Tr??? v???</a>
                    <div class="error" style="display: inline">${msg}</div>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">T??nh tr???ng s??ch:</label>
                                            <c1:input path="tinhTrang" cssClass="form-control"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">H???y</button>
                                    <button type="submit" class="btn btn-primary">L??u</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </c1:form>

            </div>

            <table class="table table-hover table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">M?? t??nh tr???ng s??ch</th>
                        <th scope="col">T??nh tr???ng s??ch</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="it" items="${ds}">
                        <tr>
                            <th scope="row">${it.maTTS}</th>
                            <td>${it.tinhTrang}</td>
                            <td>

                                <c1:form method="post" action="suatts.htm">

                                    <button type="button" class="btn btn-light btn-outline-info btn-sm" data-toggle="modal" data-target="#exampleModal${it.maTTS}">Ch???nh s???a</button>

                                    <c:if test="${it.check() == false}">
                                        <button type="button" class="btn btn-light btn-outline-info btn-sm" data-toggle="modal" data-target="#exampleModalx${it.maTTS}">
                                            X??a
                                        </button>
                                    </c:if>

                                    <c:if test="${it.check() == true}">
                                        <button type="button" disabled class="btn btn-light btn-outline-info btn-sm" data-toggle="modal" data-target="#exampleModalx${it.maTTS}">
                                            X??a
                                        </button>
                                    </c:if>

                                    <!-- Sua -->
                                    <div class="modal fade" id="exampleModal${it.maTTS}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>

                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label">M?? t??nh tr???ng s??ch: </label>
                                                            <input name="maTTS" type="text" class="form-control" id="recipient-name" value="${it.maTTS}" readonly>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label">T??nh tr???ng s??ch: </label>
                                                            <input name="tinhTrang" type="text" class="form-control" id="recipient-name">
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">H???y</button>
                                                    <button type="submit" class="btn btn-primary">L??u</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Xoa -->
                                    <div class="modal fade" id="exampleModalx${it.maTTS}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    B???n ch???c ch???n mu???n x??a th??ng tin ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">H???y</button>
                                                    <a class="btn btn-primary" role="button" href="xoatts.htm?id=${it.maTTS}">?????ng ??</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

                                </c1:form>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            </div>

            <!-- Footer -->
            <%@include file="footer.jsp" %>
        </div>
        

    </body>
</html>
