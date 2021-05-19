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
        <title>Chi tiết sách</title>
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

            <div class="rounded-lg row mx-5 my-5" style="padding-top: 2rem; background-color: white; padding-bottom: 2rem;">
                <div class="col-lg-6 col-sm-6 px-lg-5 px-sm-3">
                    <div class="container">
                        <c:choose>
                            <c:when test="${empty items}">
                            </c:when>
                            <c:otherwise>
                                <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="${pageContext.request.contextPath}/resources/images/${items.hinh1}" class="d-block w-100" style="width: 15rem; height: 29rem;" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="${pageContext.request.contextPath}/resources/images/${items.hinh2}" class="d-block w-100" style="width: 15rem; height: 29rem;" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="${pageContext.request.contextPath}/resources/images/${items.hinh3}" class="d-block w-100" style="width: 15rem; height: 29rem;" alt="...">
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- INFO -->
                <div class="col-lg-6 col-sm-6">
                    <div class="container my-3 mx-2">
                        <!-- TÊN SÁCH -->
                        <h1 class="text-truncate" data-toggle="tooltip" title="${items.tenSach}" data-placement ="bottom">${items.tenSach}</h1>

                        <!-- NHÀ CUNG CẤP / TÁC GIẢ -->
                        <div class="row mt-xl-4 mt-lg-4 mt-sm-2">
                            <div class="col-lg row-sm ">
                                <span>Nhà cung cấp: </span><p style="display: inline; color: #fca903;" class="font-weight-bold">${items.getNCC(items.maNCC)}</p>
                            </div>
                            <div class="col-lg row-sm ">
                                <span>Tác giả: </span><p style="display: inline; color: #fca903;" class="font-weight-bold">${items.getTacGia(items.maTacGia)}</p>
                            </div>
                        </div>

                        <!-- NHÀ XUẤT BẢN / HÌNH THỨC BÌA -->
                        <div class="row">
                            <div class="col-lg row-sm ">
                                <span>Nhà xuât bản: </span><p style="display: inline; color: #fca903;" class="font-weight-bold">${items.getNXB(items.maNXB)}</p>
                            </div>
                            <div class="col-lg row-sm ">
                                <span>Hình thức bìa: </span><p style="display: inline; color: #fca903;" class="font-weight-bold">${items.hinhThuc}</p>
                            </div>
                        </div>

                        <!-- GIÁ -->
                        <div class="row mt-xl-4 mt-lg-5 mt-sm-4" id="price">
                            <div class="col">
                                <span></span><h1 style="display: inline; color: #fca903;" class="font-weight-bold"><fmt:formatNumber value = "${items.gia}" type = "NUMBER"/> đ</h1>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/cart/addCart/${items.maSach}.htm" method="post">
                            <!-- SỐ LƯỢNG -->
                            <div class="row mt-xl-5 mt-lg-5 mt-sm-4">
                                <!-- <div class="col"> -->
                                <div class="col-lg-3 col-xl-3 my-auto col-sm-4">
                                    <span>Số lượng:</span>
                                </div>

                                <div class="col-xl-5 col-lg-6 col-sm-7">
                                    <!-- <div class="row border border-primary rounded px-xl-3 py-xl-3 px-sm-1 py-sm-2"> -->
                                    <!-- <div class="col d-flex justify-content-center">
                                        <button id="minus" class="btn btn-sm" style="display: inline;">
                                            <span style="font-weight: bold;">-</span>
                                        </button>
                                    </div> -->

                                    <div class="col d-flex justify-content-center">
                                        <!-- <p id="quantity" class="my-auto" style="display: inline;">1</p> -->
                                        <input class="w-100 rounded px-xl-3 py-xl-3 px-sm-1 py-sm-2" style="text-align: center;" type="number" name="quantity" min="1" value="1">
                                    </div>

                                    <!-- <div class="col d-flex justify-content-center">
                                        <button id="plus" class=" btn btn-sm" style="display: inline;">
                                            <span style="font-weight: bold;">+</span>
                                        </button>
                                    </div> -->
                                    <!-- </div> -->
                                </div>
                            </div>
                        
                            <!-- GIỎ HÀNG / MUA NGAY -->
                            <div class="mt-xl-4 mt-lg-4 mt-sm-4 mr-5">
                                <!-- <a href="${pageContext.request.contextPath}/cart/addCart/${items.maSach}/4.htm">
                                    <button id="addCart" class="btn btn-outline-primary py-3 px-4 btn-sm">
                                        <span class="">Thêm vào giỏ hàng</span>
                                    </button>
                                </a> -->

                                <button type="button"  class="btn btn-outline-primary py-2 btn-sm btn-block" data-toggle="modal" data-target="#exampleModal">
                                    Thêm vào giỏ hàng
                                </button>
                                
                                <!-- <button id="addCart" class="btn btn-outline-primary py-3 px-4 btn-sm">
                                    <span class="">Thêm vào giỏ hàng</span>
                                </button> -->
                            </div>
                        <!-- form end -->

                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">XÁC NHẬN</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                  </button>
                                </div>
                                <div class="modal-body text-center">
                                    Bạn có muốn thêm sản phẩm vào giỏ hàng
                                </div>
                                <div class="modal-footer">
                                  <button type="submit" class="btn btn-outline-info">Xác nhận
                                  </button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </form>


                        <div class="mt-xl-4 mt-lg-4 mt-sm-4 mr-5">
                            <a href="${pageContext.request.contextPath}/cart/orderNow/${items.maSach}.htm">
                                <button id="buyNow" class=" btn btn-primary btn-sm py-2 btn-block">Mua ngay</button>
                            </a>
                        </div>
                            <!-- <div class="row mt-xl-5 mt-lg-5 mt-sm-5">
                                <div class="row-sm col-lg-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-xl-6 col-sm-6 d-flex justify-content-center">
                                            <input type="submit" value="Thêm vào giỏ hàng" class="btn btn-outline-primary py-3 px-4 btn-sm">
                                        </div>
                                    

                                        <div class="col-xl-6 col-sm-6 d-flex justify-content-center">
                                            <a href="${pageContext.request.contextPath}/cart/orderNow/${items.maSach}.htm">
                                                <button id="buyNow" class=" btn btn-primary py-3 px-4 btn-sm">Mua ngay</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                        
                    </div>
                </div>
            </div>

            <div class="rounded-lg mx-5 my-5" style="background-color: white; padding: 2rem;">
                <nav>
                    <div class="nav nav-pills" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-info" role="tab" aria-controls="nav-home" aria-selected="true">Thông tin sản phẩm</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-feedback" role="tab" aria-controls="nav-profile" aria-selected="false">Nhận xét khách hàng</a>

                    </div>
                </nav>
                <div class="tab-content p-4" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-info" role="tabpanel" aria-labelledby="nav-home-tab">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Tên nhà cung cấp</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.getNCC(items.maNCC)}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Tác giả</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.getTacGia(items.maTacGia)}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">NXB</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.getNXB(items.maNXB)}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Năm XB</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.namXB}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Trọng lượng (gr)</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.trongLuong}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Kích thước</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.kichThuoc} cm</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Số trang</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.soTrang}</td>
                                </tr>
                                <tr>
                                    <th class="w-25" style="padding: 4px; font-weight: 400; color: slategrey;">Hình thức</th>
                                    <td style="padding: 4px; font-weight: 500;">${items.hinhThuc}</td>
                                </tr>
                            </tbody>
                        </table>
                        <hr>
                        <span style="font-weight: bold;">${items.tenSach}</span>
                        <span style="display: block;">${items.moTa}</span>
                    </div>
                    <div class="tab-pane fade" id="nav-feedback" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div style="color: red">${notacc}</div>
                        <br>
                        <c1:form method="POST" commandName="nhanXet" action="nhanxet.htm">
                            <c1:textarea rows="5" cols="122" path="nhanXet"/>
                            <input type="text" name="maSach" value="${items.maSach}" style="display: none"/>
                            <input type="text" name="maTK" value="${sessionScope.userID}" style="display: none"/>
                            
                            <button type="submit" class="btn btn-primary" style="margin-top: 10px;">Đăng</button>
                        </c1:form>
                        
                            <c:forEach var="it" items="${allnx}">
                                Nhận xét của <b>${it.getTenTK()}:</b> ${it.nhanXet}
                                <br>
                            </c:forEach>
                    </div>
                </div>
            </div>

                    <%@include file="footer.jsp" %>
        </div>




    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <%@include file="../js/detail.jsp" %>
</script>
</html>
