<%-- 
    Document   : detail
    Created on : May 9, 2020, 4:18:52 PM
    Author     : deptr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Ki???m tra ????n h??ng</title>
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
    <body style="background-color: silver;">
        <div class="container">
            <!-- NavBar -->
            <%@include file="navBar.jsp" %>
            <!-- NavBar -->

            <div class="rounded-lg mx-5 my-5" style="background-color: white; padding: 2rem;">

                <c:choose>
                    <c:when test="${empty invalidUser}">
                    </c:when>
                    <c:otherwise>
                        <br>
                        <div><p id="messError">
                            Vui l??ng <a href="${pageContext.request.contextPath}/account/login.htm">????ng nh???p</a>. N???u ch??a c?? t??i kho???n, ????ng k?? <a href="${pageContext.request.contextPath}/account/regitry.htm">t???i ????y</a>.
                        </p></div>
                    </c:otherwise>
                </c:choose>
                <h2>KI???M TRA L???I ????N H??NG</h2>
                <form action="${pageContext.request.contextPath}/checkout/order.htm" method="post">
                    <table class="table table-bordered mt-3 table-sm-responsive">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">Thao t??c</th>
                                <th scope="col" class="text-center">H??nh ???nh</th>
                                <th scope="col" class="text-center">T??n s???n ph???m</th>
                                <th scope="col" class="text-center">????n gi??</th>
                                <th scope="col" class="text-center">S??? l?????ng</th>
                                <th scope="col" class="text-center">Th??nh ti???n</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var = "sum" value = "0" target ="test"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <c:set var = "sum" value = "${sum + item.book.gia * item.quantity}"></c:set>
                                    <tr>
                                        <td class="align-middle text-center"><a href="${pageContext.request.contextPath}/checkout/delete/${item.book.maSach}.htm">X??a</a></td>
                                    <th scope="row"><img src="${pageContext.request.contextPath}/resources/images/${item.book.hinh1}" alt="" class="img-thumbnail mx-auto d-block" style="width: 60px; height: 100px;"></th>
                                    <td class="align-middle text-center">${item.book.tenSach}</td>
                                    <td class="align-middle text-center"><fmt:formatNumber value = "${item.book.gia}" type = "NUMBER"/>??</td>
                                    <td class="align-middle text-center">${item.quantity}</td>
                                    <td class="align-middle text-center"><fmt:formatNumber value = "${item.book.gia * item.quantity}" type = "NUMBER"/>??</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="5" class="align-middle text-right">T???ng c???ng: </td>
                                <td class="align-middle text-center" name = "??dsa"><fmt:formatNumber value = "${sum}" type = "NUMBER"/>??</td>
                            </tr>
                        </tbody>
                    </table>

                    <h2 class="mt-4">TH??NG TIN GIAO H??NG</h2>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">?????a ch???: </label>
                        <input name="address" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">S??? ??i???n tho???i: </label>
                        <input name="phone" type="text" class="form-control" required>
                    </div>
                    
                    <div class="d-flex flex-row-reverse bd-highlight">
                        <div class="p-2 bd-highlight">
                            <input type="submit" value="?????t h??ng" class="btn btn-warning">
                        </div>
                    </div>
                </form>
            </div>

            <%@include file="footer.jsp" %>

        </div>




    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</script>
</html>
