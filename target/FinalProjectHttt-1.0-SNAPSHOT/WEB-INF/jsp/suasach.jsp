<%-- 
    Document   : themsach
    Created on : Apr 19, 2020, 3:29:13 PM
    Author     : Trac Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c1" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <title>Chỉnh sửa sách</title>

        <style>
            .error {
                color: red;
            }
            #p1 {
                word-break: break-all;
                overflow: hidden;
                text-overflow: ellipsis;
                line-height: 25px;
                -webkit-line-clamp: 3;
                height: 75px;
                display: -webkit-box;
                -webkit-box-orient: vertical;
            }
        </style>

    </head>
    <body>

        <div style="padding: 30px 100px 100px 100px">
            <div class="error">${msg}</div>
            <c1:form method="post" commandName="sach" action="suasach.htm" enctype="multipart/form-data">

                <div class="form-group">
                    <label class="font-weight-bold">Mã sách</label>
                    <c1:input path="maSach" cssClass="form-control" readonly="true"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Tên sách</label>
                    <c1:input path="tenSach" cssClass="form-control"/>
                    <c1:errors path="tenSach" cssClass="error"/>
                    <div class="error">${msg2}</div>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold" style="padding-right: 40px">Loại sách</label>
                    <c1:select path="maLoaiSach">
                        <c:forEach var="it" items="${dsloaisach}">
                            <c1:option value="${it.maLoaiSach}" label="${it.tenLoaiSach}"/>
                        </c:forEach>
                    </c1:select>   
                    <c1:errors path="maLoaiSach" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold" style="padding-right: 57px">Tác giả</label>
                    <c1:select path="maTacGia">
                        <c:forEach var="it" items="${dstacgia}">
                            <c1:option value="${it.maTacGia}" label="${it.tenTacGia}"/>
                        </c:forEach>
                    </c1:select>   
                    <c1:errors path="maTacGia" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Giá</label>
                    <c1:input path="gia" cssClass="form-control"/>
                    <c1:errors path="gia" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold" style="padding-right: 10px">Nhà xuất bản</label>
                    <c1:select path="maNXB">
                        <c:forEach var="it" items="${dsnxb}">
                            <c1:option value="${it.maNXB}" label="${it.tenNXB}"/>
                        </c:forEach>
                    </c1:select>   
                    <c1:errors path="maNXB" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Năm xuất bản</label>
                    <c1:input path="namXB" cssClass="form-control"/>
                    <c1:errors path="namXB" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Trọng lượng</label>
                    <c1:input path="trongLuong" cssClass="form-control"/>
                    <c1:errors path="trongLuong" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Số trang</label>
                    <c1:input path="soTrang" cssClass="form-control"/>
                    <c1:errors path="soTrang" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Kích thước</label>
                    <c1:input path="kichThuoc" cssClass="form-control"/>
                    <c1:errors path="kichThuoc" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Số lượng</label>
                    <c1:input path="soLuong" cssClass="form-control"/>
                    <c1:errors path="soLuong" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Hình thức</label>
                    <c1:input path="hinhThuc" cssClass="form-control"/>
                    <c1:errors path="hinhThuc" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold" style="padding-right: 24px">Nhà cung cấp</label>
                    <c1:select path="maNCC">
                        <c:forEach var="it" items="${dsncc}">
                            <c1:option value="${it.maNCC}" label="${it.tenNCC}"/>
                        </c:forEach>
                    </c1:select>   
                    <c1:errors path="maNCC" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold" style="padding-right: 10px">Tình trạng sách</label>
                    <c1:select path="maTTS">
                        <c:forEach var="it" items="${dstts}">
                            <c1:option value="${it.maTTS}" label="${it.tinhTrang}"/>
                        </c:forEach>
                    </c1:select>   
                    <c1:errors path="maTTS" cssClass="error"/>
                </div>
                <hr>
                <div class="form-group">
                    <label class="font-weight-bold">Hình 1</label>
                    <c1:input path="hinh1" cssClass="form-control" cssStyle="display: none"/>
                    <input type="file" name="file"/>
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Hình 2</label>
                    <c1:input path="hinh2" cssClass="form-control" cssStyle="display: none"/>
                    <input type="file" name="file"/>
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Hình 3</label>
                    <c1:input path="hinh3" cssClass="form-control" cssStyle="display: none"/>
                    <input type="file" name="file"/>
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Mô tả sách</label>
                    <c1:textarea path="moTa" rows="7" cols="172" cssClass="form-control"/>
                    <c1:errors path="moTa" cssClass="error"/>
                </div>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Lưu
                </button>
                <a class="btn btn-secondary" role="button" href="dssach.htm" style="position: absolute; right: 100px">Trở về</a>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                Bạn chắc chắn muốn lưu thay đổi ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-primary">Đồng ý</button>
                            </div>
                        </div>
                    </div>
                </div> 

                <%-- <button type="submit" class="btn btn-primary">Lưu</button> --%>
            </c1:form>
        </div>

    </body>
</html>
