<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${contextPath}/css/login.css">

<!-- js -->
<script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/js/header.js"></script>
<script src="${contextPath}/js/animation.js"></script>
<script src="${contextPath}/js/login.js"></script>
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

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품등록</h1>
		</div>
	</div>
	<div>
		<form action="${contextPath}/product/addProduct.do" method="post">
			<table class="table table-bordered" style="width: 600px;">
				<caption>
					<b>상품등록</b>
				</caption>
				<tr>
					<td style="width: 150px; background-color: lightgreen;">카테고리</td>
					<td><select style="width: 200px;" name="category"
						class="form-control" required="required">
							<option value="베스트" selected="selected">베스트</option>
							<option value="신상품">신상품</option>
							<option value="추천상품">추천상품</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: lightgreen;">브랜드명</td>
					<td><input type="text" name="brand" class="form-control"
						style="width: 200px;" required="required"></td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: lightgreen;">상품명</td>
					<td><input type="text" name="goods" class="form-control"
						style="width: 300px;" required="required"></td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: lightgreen;">판매가</td>
					<td><input type="text" name="price" class="form-control"
						style="width: 200px;" required="required"></td>
				</tr>
				<tr>
					<td style="width: 150px; background-color: lightgreen;">이미지명</td>
					<td><input type="text" name="imageFileName" class="form-control"
						style="width: 300px;" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" id="btnadd"
							style="width: 100px;">상품저장</button>
						<button type="button" class="btn btn-info" style="width: 100px;"
							onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>