<%-- 
    Document   : login
    Created on : Apr 15, 2020, 11:28:11 AM
    Author     : deptr
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="springframework" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<%@ include file="../css/styleRegistry.jsp"%>

<html>
    <head>
        <title>Đăng nhập</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

        <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">

    </head>

    <body>
        <!-- main -->
        <div class="main-w3layouts wrapper">
            <h1>ĐĂNG NHẬP</h1>
            <div class="main-agileinfo">
                <div class="agileits-top">
                    <springframework:form method="post" commandName="account" action="/FinalProjectHttt/account/login.htm" >

                        <label style="color: white">Tên đăng nhập</label>
                        <springframework:input path="tenDangNhap" cssClass="text" onclick="onClickHideError()" cssStyle="width : 100%; margin-top: 7px"/> <br>

                        <label style="color: white">Mật khẩu</label>
                        <springframework:password path="matKhau" showPassword="false" cssClass="text" onclick="onClickHideError()" cssStyle="width : 100%; margin-top: 7px"/>

                        <c:choose>
                            <c:when test="${empty message}">
                            </c:when>
                            <c:otherwise>
                                <br>
                                <div style="padding-left: 30px; padding-right: 30px"><p id="messError">${message}</p></div>
                            </c:otherwise>
                        </c:choose>
                        <input type="submit" value="ĐĂNG NHẬP">

                    </springframework:form>
                    <p>Bạn chưa có tài khoản?<a href="registry.htm"> Đăng ký ngay</a></p>
                </div>
            </div>

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
        <!-- //main -->
    </body>
</html>
