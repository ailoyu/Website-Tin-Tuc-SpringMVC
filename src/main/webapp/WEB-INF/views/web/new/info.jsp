<%@page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags" %>

<c:url var="commentAPI" value="/api/comment"/>
<c:url var="newURL" value="/dang-nhap"/>
<c:url var="registerURL" value="/dang-ky"/>
<c:url var="info" value="/thong-tin-bai-viet"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

   

</head>
<body>
<div class="container">

    <h1 style="text-align: justify">
        <strong> ${model.title }</strong>
    </h1>
    <b>${model.shortDescription}</b> ${model.content}

</div>

<h2>Đề xuất giành cho bạn</h2><br><br><br>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="card-wrapper container-sm d-flex justify-content-around">
      <div class="card  " style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div><div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
        </div>
        <div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div>
</div>
    </div>
    <div class="carousel-item">
      <div class="card-wrapper container-sm d-flex justify-content-around">
      <div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div><div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
        </div>
        <div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div>
    </div>
    </div>
    <div class="carousel-item">
      <div class="card-wrapper container-sm d-flex justify-content-around">
      <div class="card " style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div>
        <div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
        </div>
        <div class="card" style="width: 18rem;">
  <img src="https://source.unsplash.com/collection/190727/1600x900" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    
  </div>
</div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<br><br><br>
    
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<button class="btn btn-primary" id="hiddenComments">Hiển thị tất cả bình luận</button>
<br><br><br>


<div hidden="true" id="comments">
<h1>Comment</h1>

<%
    if (SecurityUtils.getPrincipal() != null) {
%>
<img class="rounded-circle shadow-1-strong me-3"
     src="<%=SecurityUtils.getPrincipal().getAvatar()%>"
     alt="avatar" width="60" height="60" style="display: inline-block"/>
    <b><%=SecurityUtils.getPrincipal().getFullName()%></b><br><br>
<form method="post" id="formSubmit">
		<textarea class="form-control" rows="5" cols="140" placeholder="Enter your comment..."
                   name="content"></textarea>

    <input type="hidden"
           value="<%=SecurityUtils.getPrincipal().getId()%>"
           name="userId"> <input type="hidden" value="${model.id}"
                                  name="newId"> <br>
    <br> <input class="btn btn-primary" type="button" id="btnComment" value="Bình Luận">
</form>
<%
} else {
%>
<h5>Vui lòng đăng nhập để có thể bình luận!</h5>
<%
    }
%>




<section style="background-color: #ad655f;">
    <div class="container my-5 py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="card text-dark">
                    <h4 class="mb-0">Recent comments</h4>
                    <p class="fw-light mb-4 pb-2">Latest Comments section by
                        users</p>
                    <c:forEach var="item" items="${comment.listComment}">
                        <c:if test="${item.parentId == null}">
                            <div class="card-body p-4">
                                <div class="d-flex flex-start">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="${ item.avatar }"
                                         alt="avatar" width="60" height="60"/>
                                    <div>
                                        <b>${ item.fullName }</b>
                                        <h6 class="fw-bold mb-1"></h6>
                                        <div class="d-flex align-items-center mb-3">
                                            <p class="mb-0">
                                                <c:set var="today" value="${item.createdDate }"/>
                                                <span class="badge bg-success"><fmt:formatDate
                                                        pattern="dd-MM-yyyy HH:mm" value="${today}"/></span>
                                            </p>
                                            <a href="#!" class="link-muted"><i
                                                    class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
                                                                                               class="link-muted"><i
                                                class="fas fa-redo-alt ms-2"></i></a> <a
                                                href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
                                        </div>
                                        <p class="mb-0">${item.content }</p>
                                        <%
                                            if (SecurityUtils.getPrincipal() != null) {
                                        %>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="small mb-0" style="color: #aaa;">
                                                <button class="btn btn-link" id="replyBtn-${item.id}">Reply</button>
                                            </p>
                                            <br><br>
                                            <div class="d-flex flex-row">
                                                <i class="far fa-check-circle text-primary"></i>
                                            </div>

                                        </div>
                                        <form class="d-none" method="post" id="replyForm-${item.id}">
                                    <textarea class="form-control" rows="3" cols="50" placeholder="Enter your comment..."
                                              id="content1" name="content"></textarea>

                                            <input type="hidden"
                                                   value="<%=SecurityUtils.getPrincipal().getId()%>"
                                                   name="userId">
                                            <input type="hidden" value="${model.id}"
                                                   name="newId">
                                            <input type="hidden" value="${item.id}" name="parentId">
                                            <br>
                                            <br> <input class="btn btn-primary" type="button" id="btnComment-${item.id}" value="Bình Luận"><br><br><br>
                                        </form>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <myTags:folderGroups item="${item}"></myTags:folderGroups>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

</div>
<script type="text/javascript">

    $("#hiddenComments").click(function () {
        var commentStatus = $("#comments").attr("hidden")
        if(commentStatus == "hidden"){
            $("#comments").attr("hidden",false);
        } else {
            $("#comments").attr("hidden",true);
        }

    })

    $(function (){
        $("button[id*='replyBtn-']").click(function (){
            $("form[id*='replyForm-']:not(.d-none)").each(function (){
                let commentId = $(this).prop("id").split("-")[1]
                let formId = "replyForm-" + commentId
                console.log("formId: "+formId + " đang được ẩn!")
                $("#"+formId).addClass("d-none")
            })

            let commentId = $(this).prop("id").split("-")[1]
            let formId = "replyForm-" + commentId

            $("#"+formId).removeClass("d-none")
        })
    })

    $('#btnComment').click(function (e) {
        e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
        // cần truyền vào url: /api/new

        var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
        var data = {};

        // Chạy vòng lặp bỏ dữ liệu từ formData vào data
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        addNew(data);

    });

    $("input[id*='btnComment-']").click(function (e){
        e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
        // cần truyền vào url: /api/new
        let commentId = $(this).prop("id").split("-")[1]
        var formData = $('#replyForm-'+commentId).serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
        var data = {};

        // Chạy vòng lặp bỏ dữ liệu từ formData vào data
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        addNew(data);

    });

    function addNew(data) {
        $.ajax({
            url: '${commentAPI}', // gửi tới url api
            type: 'POST',
            contentType: 'application/json', // ép kiểu json từ client -> server
            data: JSON.stringify(data), // parse từ JavaScript Object -> JSON
            dataType: 'json', // nhận kiểu json từ server -> client
            success: function (result) {
                window.location.href = "${info}?id=${ model.id }";
            },
            error: function (error) {
                window.location.href = "${info}?id=${ model.id }";
            }
        });
    }

</script>

</body>
</html>