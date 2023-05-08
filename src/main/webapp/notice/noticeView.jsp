<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- js -->
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/header.js"></script>
<script src="${contextPath}/js/animation.js"></script>
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

	<div>
		<form name="frmArticle" action="${contextPath}/board/updateArticle.do" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td width="20%" align="center" bgcolor="#ff9933">글번호</td>
				<td><input type="text" name="articleNo" value="${article.articleNo}" disabled></td>
				<input type="hidden" name="articleNo" value="${article.articleNo}">
			</tr>
			<tr>
				<td width="20%" align="center" bgcolor="#ff9933">작성자이름</td>
				<td><input type="text" name="id" value="${article.name}" disabled></td>
			</tr>
			<tr>
				<td width="20%" align="center" bgcolor="#ff9933">제목</td>
				<td><input type="text" id="id_title" value="${article.title}" name="title" disabled></td>
			</tr>
			<tr>
				<td width="20%" align="center" bgcolor="#ff9933">내용</td>
				<td><textarea rows="10" cols="50" id="id_content" name="content" disabled>${article.content}</textarea></td>
			</tr>
			<c:if test="${not empty article.imageFileName}">
				<tr>
					<td width="150" align="center" bgcolor="#ff9933" rowspan="2">이미지</td>
					<td>
						<input type="hidden" name="originalFileName" value="${article.imageFileName}">
						<img id="preview" src="${contextPath}/download.do?imageFileName=${article.imageFileName}&articleNo=${article.articleNo}">
					</td>
				</tr>
				<tr>
					<td><input type="file" id="id_imgFile" name="imageFileName" onchange="readImage(this)" disabled></td>
				</tr>
			</c:if>
			<tr>
				<td width="150" align="center" bgcolor="#ff9933">등록일자</td>
				<td><input type="text" value='<fmt:formatDate value="${article.writeDate}"/>' disabled></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#ff9933">조회수</td>
				<td><input type="text"  value="${article.views}" name="views" disabled></td>
			</tr>
			
		</table>
	</form>
	</div>
<!-- -------------------------------------------------------------------------- -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>