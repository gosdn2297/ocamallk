<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠프몰관리자</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css">
<link rel="stylesheet" href="${contextPath}/css/login.css">

<!-- js -->
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/header.js"></script>
<script src="${contextPath}/js/animation.js"></script>
<script src="${contextPath}/js/login.js"></script>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
<c:choose>
	<c:when test="${msg== 'addProduct' }">
		<script>
			window.onload=function () {
				alert ("상품을 등록했습니다.")
			}
		</script>
	</c:when>
	<c:when test="${msg== 'modified' }">
		<script>
			window.onload=function () {
				alert ("회원 정보를 수정했습니다.")
			}
		</script>
	</c:when>
	<c:when test="${msg== 'deleted' }">
		<script>
			window.onload=function () {
				alert ("회원정보를 삭제했습니다.")
			}
		</script>
	</c:when>
</c:choose>
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
	<h2 align="center">회원 정보</h2>
	<table align="center" border="1" width="700">
		<tr align="center" bgcolor="lightgreen">
			<th>카테고리</th>
			<th>브랜드</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>이미지</th>
			<th>등록일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<c:choose>
		<c:when test="${empty productList}">
			<tr>
				<td colspan="9" align="center">등록된 회원이 없습니다.</td>
			</tr>
		</c:when>
		<c:when test="${!empty productList}">
			<c:forEach var="prod" items="${productList}">
				<tr align="center">
					<td>${prod.category}</td>
					<td>${prod.brand}</td>
					<td>${prod.goods}</td>
					<td>${prod.price}</td>
					<td>${prod.imageFileName}</td>
					<td>${prod.regDate}</td>
					<td><a href="${contextPath}/member/modMemberForm.do?email=${mem.email}">수정</a></td>
					<td><a href="${contextPath}/member/delMember.do?email=${mem.email}">삭제</a></td>
				</tr>
			</c:forEach>		
		</c:when>
	</c:choose>
	</table>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>