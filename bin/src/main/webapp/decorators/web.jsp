<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css'/>" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
	
	
<link href="<c:url value='/template/web/css/personal-page.css'/>" rel="stylesheet" type="text/css">
	
	<!-- Bootstrap 5 -->
	<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
  rel="stylesheet"
/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
	<!-- Sweet alert -->	
	<script src="<c:url value="/template/admin/sweetalert/sweetalert2.min.js" />"></script>
	<link rel="stylesheet" href="<c:url value="/template/admin/sweetalert/sweetalert2.min.css" />">
	<!-- Thư viện CKEDITOR -->
	<script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
	
<style type="text/css">
body {
	background-color: #eee;
}
.fa-heart-o {
  color: red;
  cursor: pointer;
}

.fa-heart {
  color: red;
  cursor: pointer;
}

.tags {
  display: inline;
  position: relative;
}

.tags:hover:after {
  background: #333;
  background: rgba(0, 0, 0, .8);
  border-radius: 5px;
  bottom: -34px;
  color: #fff;
  content: attr(data-gloss);
  left: 20%;
  padding: 5px 15px;
  position: absolute;
  width: 180px;
  font-size: 12px;
  z-index: 98;
  display: flex;
  white-space: pre-line;
  margin-top: 3em
}
	



</style>
</head>
<body>
	<!-- Header/Navigation -->
	<%@include file="/common/web/header.jsp" %>
	
	<!-- Body -->
	<div style="margin-left: 30px;margin-right: 30px" class="container">
    	<dec:body/>
    </div>

	<!-- Footer -->
	<%@include file="/common/web/footer.jsp" %>

	
</body>
</html>