<%-- 
    Document   : dssach
    Created on : Apr 19, 2020, 3:04:51 PM
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

        <title>Danh sách Sách</title>
        <style>
            #p1 {
                word-break: break-all;
                width: 500px;
                overflow: hidden;
                text-overflow: ellipsis;
                line-height: 25px;
                -webkit-line-clamp: 3;
                height: 75px;
                display: -webkit-box;
                -webkit-box-orient: vertical;
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
                <h1 class="text-center" style="padding-top: 30px">Danh sách Sách</h1>

            <div style="margin: 20px">
                <a style="margin-bottom:20px" class="btn btn-light btn-outline-info" role="button" href="themsach.htm">Thêm mới</a>
                <a class="btn btn-secondary" role="button" href="qlkho.htm" style="right: 20px; margin-bottom:20px; margin-left: 20px;">Trở về</a>
                <table class="table table-hover table-sm table-bordered table-responsive">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col"><p class="text-center" style="width: 70px">Mã sách</p></th>
                            <th scope="col"><p class="text-center" style="width: 90px">Tên sách</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Loại sách</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Tác giả</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Giá</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">NXB</p></th>
                            <th scope="col"><p class="text-center" style="width: 130px">Năm xuất bản</p></th>
                            <th scope="col"><p class="text-center" style="width: 110px">Trọng lượng</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Số trang</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Kích thước</p></th>
                            <th scope="col"><p class="text-center" style="width: 100px">Hình thức</p></th>
                            <th scope="col"><p class="text-center">Hình 1</p></th>
                            <th scope="col"><p class="text-center">Hình 2</p></th>
                            <th scope="col"><p class="text-center">Hình 3</p></th>
                            <th scope="col"><p class="text-center" style="width: 120px">Nhà cung cấp</p></th>
                            <th scope="col"><p class="text-center" style="width: 140px">Tình trạng sách</p></th>
                            <th scope="col"><p class="text-center">Mô tả</p></th>
                            <th scope="col"><p class="text-center">Số lượng</p></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="it" items="${ds}">
                            <tr>
                                <th scope="row" class="text-center">${it.maSach}</th>
                                <td class="text-center">${it.tenSach}</td>
                                <td class="text-center">${it.getLoaiSach(it.maLoaiSach)}</td>
                                <td class="text-center">${it.getTacGia(it.maTacGia)}</td>
                                <td class="text-center">${it.gia}</td>
                                <td class="text-center">${it.getNXB(it.maNXB)}</td>
                                <td class="text-center">${it.namXB}</td>
                                <td class="text-center">${it.trongLuong} gr</td>
                                <td class="text-center">${it.soTrang}</td>
                                <td class="text-center">${it.kichThuoc}</td>
                                <td class="text-center">${it.hinhThuc}</td>
                                <td><img height="100" width="100" src="${pageContext.request.contextPath}/resources/images/${it.hinh1}"></td>
                                <td><img height="100" width="100" src="${pageContext.request.contextPath}/resources/images/${it.hinh2}"></td>
                                <td><img height="100" width="100" src="${pageContext.request.contextPath}/resources/images/${it.hinh3}"></td>
                                <td class="text-center">${it.getNCC(it.maNCC)}</td>
                                <td class="text-center">${it.getTTS(it.maTTS)}</td>
                                <td><p class="text-center" id="p1">${it.moTa}</p></td>
                                <td><p class="text-center">${it.soLuong}</p></td>
                                <td>
                                    <a style="width: 95px; margin-bottom: 10px" class="btn btn-light btn-outline-info btn-sm" role="button" href="suasach.htm?id=${it.maSach}">Chỉnh sửa</a>
                                    <button type="button" class="btn btn-light btn-outline-info btn-sm" data-toggle="modal" data-target="#exampleModalx${it.maSach}" style="width: 95px">
                                        Xóa
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModalx${it.maSach}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    Bạn chắc chắn muốn xóa thông tin ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                    <a class="btn btn-primary" role="button" href="xoasach.htm?id=${it.maSach}">Đồng ý</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </td>
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
