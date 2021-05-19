<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-fixed-top navbar-expand-sm navbar-light bg-light rounded">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.htm">
        <!-- <img src="../images/logo-brand.png" width="85" height="45" alt=""> -->
        <img src="https://i.ibb.co/HYsdtPY/book.png" width="85" height="45" alt="">
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="row align-items-start navbar-nav ml-auto mr-auto">

            <!-- Item KHO <admin>  -->
            <li class="col nav-item dropdown" id="adminStorage">
                <a class="text-danger bg-light nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> KHO </a>

                <div class="bg-light dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/storage/qlkho.htm">Quản lí kho</a>
                </div>
            </li>

            <!-- Item TAI_KHOAN	 -->
            <li class="col nav-item dropdown hideDropdown">
                <a class="text-danger bg-light nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">TÀI KHOẢN</a>
                <div class="bg-light dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/account/registry.htm">Đăng kí</a>
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/account/login.htm">Đăng nhập</a>
                </div>
            </li>

            <!-- Item INFO_ACCOUNT -->
            <li class="col nav-item dropdown" id="userDropdown">
                <a class="text-danger bg-light nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">TÀI KHOẢN</a>
                <div class="bg-light dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="bg-transparent text-danger dropdown-item" href="#">Welcome, ${sessionScope.user}</a>
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/account/logout.htm">Đăng xuất</a>
                </div>
            </li>

            <!-- Item ADMIN -->
            <li class="col nav-item dropdown" id="adminDropdown">
                <a class="text-danger bg-light nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ADMIN</a>
                <div class="bg-light dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="bg-transparent text-danger dropdown-item" href="#">Welcome, ${sessionScope.user}</a>
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/admin/registry.htm">Đăng kí nhân viên</a>
                    <a class="bg-transparent text-danger dropdown-item" href="${pageContext.request.contextPath}/account/logout.htm">Đăng xuất</a>
                </div>
            </li>
        </ul>

        <!-- CART -->
        <a href="${pageContext.request.contextPath}/cart/orderNow.htm">
            <button class="btn btn-outline-success my-2 my-sm-0 mx-2">
                <img src="https://i.ibb.co/PtF26vF/mobile-store.png" width="20" height="20" alt="">
                <span class="badge badge-warning">${sessionScope.cartSize}</span>
            </button>
        </a>

        <!-- Search Bar -->
        <c1:form cssClass="form-inline my-2 my-lg-0" method="post" action="search.htm">
            <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm" name="search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                <img src="https://i.ibb.co/sF7XdCk/search-icon.png" width="20" height="20" alt="">
            </button>
        </c1:form>
    </div>
</nav>