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
        <title>Kiểm tra đơn hàng</title>
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
                            Vui lòng <a href="${pageContext.request.contextPath}/account/login.htm">đăng nhập</a>. Nếu chưa có tài khoản, đăng kí <a href="${pageContext.request.contextPath}/account/regitry.htm">tại đây</a>.
                        </p></div>
                    </c:otherwise>
                </c:choose>
                <h2>KIỂM TRA LẠI ĐƠN HÀNG</h2>
                <form action="${pageContext.request.contextPath}/checkout/order.htm" method="post">
                    <table class="table table-bordered mt-3 table-sm-responsive">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">Thao tác</th>
                                <th scope="col" class="text-center">Hình ảnh</th>
                                <th scope="col" class="text-center">Tên sản phẩm</th>
                                <th scope="col" class="text-center">Đơn giá</th>
                                <th scope="col" class="text-center">Số lượng</th>
                                <th scope="col" class="text-center">Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var = "sum" value = "0" target ="test"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <c:set var = "sum" value = "${sum + item.book.gia * item.quantity}"></c:set>
                                    <tr>
                                        <td class="align-middle text-center"><a href="${pageContext.request.contextPath}/checkout/delete/${item.book.maSach}.htm">Xóa</a></td>
                                    <th scope="row"><img src="${pageContext.request.contextPath}/resources/images/${item.book.hinh1}" alt="" class="img-thumbnail mx-auto d-block" style="width: 60px; height: 100px;"></th>
                                    <td class="align-middle text-center">${item.book.tenSach}</td>
                                    <td class="align-middle text-center"><fmt:formatNumber value = "${item.book.gia}" type = "NUMBER"/>đ</td>
                                    <td class="align-middle text-center">${item.quantity}</td>
                                    <td class="align-middle text-center"><fmt:formatNumber value = "${item.book.gia * item.quantity}" type = "NUMBER"/>đ</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="5" class="align-middle text-right">Tổng cộng: </td>
                                <td class="align-middle text-center" name = "ádsa"><fmt:formatNumber value = "${sum}" type = "NUMBER"/>đ</td>
                            </tr>
                        </tbody>
                    </table>

                    <h2 class="mt-4">THÔNG TIN GIAO HÀNG</h2>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Địa chỉ: </label>
                        <input name="address" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Số điện thoại: </label>
                        <input name="phone" type="text" class="form-control" required>
                    </div>
                    
                    <div class="d-flex flex-row-reverse bd-highlight">
                        <div class="p-2 bd-highlight">
                            <input type="submit" value="Đặt hàng" class="btn btn-warning">
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
