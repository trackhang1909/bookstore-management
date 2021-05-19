<%-- 
    Document   : registry
    Created on : Apr 18, 2020, 10:24:26 PM
    Author     : deptr
--%>

<%@page contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@include file="../css/styleRegistry.jsp"%>

<c:choose>
    <c:when test="${sessionScope.role != null}">
        <c:choose>
            <c:when test="${sessionScope.role == 1}">
                <style type="text/css">
                    #regUser{
                        display: none;
                    }
                </style>
            </c:when>
        </c:choose>
    </c:when>
    <c:otherwise>
        <style type="text/css">
            #regEmployee{
                display: none;
            }
        </style>
    </c:otherwise>
</c:choose>

<html>
    <head>
        <title>Đăng kí</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

        <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">

        <style>
            .error{
                color: white;
                padding-top: 10px;
                margin-left: auto;
                margin-right: auto;
                display:table;
            }
        </style>
    </head>
    <body>

        <!-- main -->
        <div class="main-w3layouts wrapper">
            <h1>ĐĂNG KÍ TÀI KHOẢN</h1>
            <div class="main-agileinfo" id="regUser">
                <div class="agileits-top">
                    <!-- Spring FORM start -->
                    <spring:form commandName="account" method="post" action="${pageContext.request.contextPath}/account/registry.htm">

                        <!-- Input họ tên -->
                        <spring:input path="hoTen" cssClass="text" required="required" onclick="onClickHideError()" placeholder="Họ tên" cssStyle="width: 100%;"/> <br>

                        <!-- Input giới tính -->
                        <label style="color: white;">Giới tính</label><br>
                        <spring:radiobutton path="gioiTinh" value="1" cssStyle = "margin-top:7px;"/>Nam
                        <spring:radiobutton path="gioiTinh" value="0" cssStyle = "margin-left:30px;"/>Nữ

                        <br>
                        <br>

                        <!-- Input tên đăng nhập -->
                        <spring:input path="tenDangNhap" cssClass="text" required="required" onclick="onClickHideError()" placeholder="Tên đăng nhập" cssStyle="width: 100%;"/> <br>

                        <!-- Input mật khẩu -->
                        <spring:password path="matKhau" cssClass="text myInput" required="required" onclick="onClickHideError()" placeholder="Mật khẩu" cssStyle="margin-top: 7px; width: 100%;"/>
                        <spring:errors cssClass="error" path="matKhau" cssStyle="margin-top : 10px;"/>
                        <br>

                        <input name="confirmPass" type="password" class="text myInput" required="" onclick="onClickHideError()" placeholder="Xác nhận mật khẩu" style="margin-top : 7px; width: 100%;"/>

                        <!-- Thông báo lỗi khi 2 mật khẩu không trùng -->
                        <c:choose>
                            <c:when test="${empty message}">
                            </c:when>
                            <c:otherwise>
                                <br id="deleteBR">
                                <div align="center"><p id="message">${message}</p></div>
                                </c:otherwise>
                            </c:choose>

                        <c:choose>
                            <c:when test="${empty message}">
                            </c:when>
                            <c:otherwise>
                                <br id="deleteBR">
                                <div align="center"><p id="messagePass">${messagePass}</p></div>
                                </c:otherwise>
                            </c:choose>

                        <input type="submit" value="ĐĂNG KÍ">
                    </spring:form>
                    <p>Bạn đã có tài khoản? <a href="login.htm"> Đăng nhập ngay!</a></p>

                    <ul class="colorlib-bubbles">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>

            <div class="main-agileinfo" id="regEmployee">
                <div class="agileits-top">
                    <!-- Spring FORM start -->
                    <spring:form commandName="account" method="post" action="${pageContext.request.contextPath}/admin/registry.htm">

                        <!-- Input họ tên -->
                        <spring:input path="hoTen" cssClass="text" required="required" onclick="onClickHideError()" placeholder="Họ tên" cssStyle="width: 100%;"/> <br>

                        <!-- Input giới tính -->
                        <label style="color: white;">Giới tính</label><br>
                        <spring:radiobutton path="gioiTinh" value="1" cssStyle = "margin-top:7px;"/>Nam
                        <spring:radiobutton path="gioiTinh" value="0" cssStyle = "margin-left:30px;"/>Nữ

                        <br>
                        <br>

                        <!-- Input tên đăng nhập -->
                        <spring:input path="tenDangNhap" cssClass="text" required="required" onclick="onClickHideError()" placeholder="Tên đăng nhập" cssStyle="width: 100%;"/> <br>

                        <!-- Input mật khẩu -->
                        <spring:password path="matKhau" cssClass="text myInput" required="required" onclick="onClickHideError()" placeholder="Mật khẩu" cssStyle="margin-top: 7px; width: 100%;"/>
                        <spring:errors cssClass="error" path="matKhau" cssStyle="margin-top : 10px;"/>
                        <br>

                        <input name="confirmPass" type="password" class="text myInput" required="" onclick="onClickHideError()" placeholder="Xác nhận mật khẩu" style="margin-top : 7px; width: 100%;"/>

                        <!-- Thông báo lỗi khi 2 mật khẩu không trùng -->
                        <c:choose>
                            <c:when test="${empty message}">
                            </c:when>
                            <c:otherwise>
                                <br id="deleteBR">
                                <div align="center"><p id="message">${message}</p></div>
                                </c:otherwise>
                            </c:choose>

                        <c:choose>
                            <c:when test="${empty message}">
                            </c:when>
                            <c:otherwise>
                                <br id="deleteBR">
                                <div align="center"><p id="messagePass">${messagePass}</p></div>
                                </c:otherwise>
                            </c:choose>

                        <input type="submit" value="ĐĂNG KÍ">
                    </spring:form>

                    <p>Bạn đã có tài khoản? <a href="login.htm"> Đăng nhập ngay!</a></p>

                    <ul class="colorlib-bubbles">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <!-- //main -->
    </body>
</html>
