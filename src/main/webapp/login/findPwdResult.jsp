
<%@page import="login.MemberVO"%>
<%@page import="login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

MemberDAO memberDAO = new MemberDAO();
MemberVO memberVO = new MemberVO();
memberVO.setName(name);
memberVO.setEmail(email);
memberVO.setPhone1(phone);

String member_mid = memberDAO.findPwd(memberVO);
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠프몰 아이디 확인 창</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css">
<link rel="stylesheet" href="${contextPath}/css/find.css">

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


	<div class="container">
		<section class="find">
			<div class="find_inner">
				<h2>FIND</h2>
				<form name="idsearch" method="post">
					<%
					if (member_mid != null) {
					%>

					<div class="container">
						<div class="found-success">
							<h4>회원님의 비밀번호는</h4>
							<div class="found-id"><%=member_mid%></div>
							<h4>입니다</h4>
						</div>
						<div class="found-login">
							<input type="button" id="btnLogin" value="로그인" onclick="location.href='${contextPath}/login/login.jsp'" />
						</div>
					</div>
					<%
					} else {
					%>
					<div class="container">
						<div class="found-fail">
							<h4>등록된 정보가 없습니다</h4>
						</div>
						<div class="found-login">
							<input type="button" id="btnback" value="다시 찾기"
								onClick="history.back()" /> 
							<input type="button" id="btnjoin"
							value="회원가입" onclick="location.href='${contextPath}/signup/register.jsp'"/>
						</div>
					</div>
					<%
					}
					%>
				</form>
			</div>
		</section>
	</div>


	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>