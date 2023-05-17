<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠프몰</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css">
<link rel="stylesheet" href="${contextPath}/css/noticeView.css">

<!-- js -->
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/header.js"></script>
<script src="${contextPath}/js/animation.js"></script>
<script type="text/javascript">
	function readImage(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();
			reader.onload = function(event) {
				$('#preview').attr('src', event.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}

	}
	function backtoList(obj) {
		obj.action = "${contextPath}/qnalist/qna.do";
		obj.submit();
	}
</script>
</head>

<body>
	<div class="arrow">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-caret-up-fill arrow-up"
			viewBox="0 0 16 16">
      <path
				d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
    </svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-caret-down-fill arrow-down"
			viewBox="0 0 16 16">
      <path
				d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
    </svg>
	</div>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- -------------------------------------------------------------------------- -->
	<div class="container">
	    <div class="write_inner">
	        <h2>Notice</h2>
	    </div>
	    <form action="${contextPath}/qnalist//qnaView.do" method="post" enctype="multipart/form-data">
	        <div class="view_area">
	            <p class="title">${article.title}</p>
	            <div class="data_area">
	                <p>
	                    <span class="joindate">작성날짜 : ${article.writeDate}</span>
	                </p>
	                <span class="name">작성자 : ${article.name}</span> <span class="views">조회수
	                    : ${article.views}</span>
	            </div>
	            <p class="content">
	                ${article.content}
	                <c:if test="${not empty article.imageFileName}">
	                    <br>
	                    <span class="img">
	                        <input type="hidden" name="originalFileName" value="${article.imageFileName}">
	                        <span style="display:block;">
	                            <img id="preview" src="${contextPath}/qnadownload.do?imageFileName=${article.imageFileName}&articleNo=${article.articleNo}">
	                        </span>
	                    </span>
	                </c:if>
	            </p>
	            <input class="button_list" type="button" value="리스트로 돌아가기"
	                   onclick="backtoList(this.form)">
	        </div>
	    </form>
	</div>

	<!-- -------------------------------------------------------------------------- -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>