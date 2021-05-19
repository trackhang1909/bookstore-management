<div class="row d-flex" style="flex-wrap: wrap;">
    <c:forEach var="books" items="${listBook}">
        <div class="col-sm-6 col-lg-4 col-xl-4">
            <a class=" text-truncate" data-toggle="tooltip" title="${books.tenSach}" data-placement ="bottom" href="${pageContext.request.contextPath}/book/detail.htm?id=${books.maSach}">
                <div class="card mb-3 shadow bg-light">
                    <img class="rounded mx-auto d-block mt-3" style="height: 13rem; width: 11rem;" src="${pageContext.request.contextPath}/resources/images/${books.hinh1}" class="card-img-top" alt="">
                    <div class="card-block d-flex justify-content-center mt-2 mx-3">
                        <p class="text-truncate">${books.tenSach}</p>   
                        </a>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">
                            <div class="text-center">
                                ${books.gia} VND
                            </div>
                        </small>
                    </div>
                </div>
        </div>
    </c:forEach>
</div>


