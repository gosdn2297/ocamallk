<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="top_menu">
			<div class="top_menu_inner clearfix">
				<ul>
					<%
					if (session.getAttribute("log_id") == null) {
					%>
					<li><a href="${contextPath}/notice/qna.jsp">고객센터</a></li>
					<li><a href="${contextPath}/baskert/baskert.jsp">장바구니</a></li>
					<li><a href="${contextPath}/login/login.jsp">로그인</a></li>
					<%
					} else {
					%>
					<li><a href="${contextPath}/notice/qna.jsp">고객센터</a></li>
					<li><a href="${contextPath}/baskert/baskert.jsp">장바구니</a></li>
					<li><a href="#">마이페이지</a></li>
				    <li><a href="${contextPath}/login/logout.jsp" >로그아웃</li>
					
					<%
					}
					%>

				</ul>
			</div>
		</div>
		<div class="middle_menu">
			<div class="middle_menu_inner">
				<h1>
					<a href="${contextPath}/index/index.jsp">CAMPMALL</a>
				</h1>
				<ul>
					<li><a href="#"><strong>NOTICE</strong></a></li>
					<li><a href="#">EVENT</a></li>
					<li><a href="#">REVIEW</a></li>
					<li><a href="#">SEARCH</a></li>
				</ul>
			</div>
		</div>
		<div class="bottom_menu">
			<div class="bottom_menu_inner">
				<ul class="clearfix">
					<li><a href="#"> <strong>베스트</strong>
					</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">특가상품</a></li>
					<li><a href="#">추천상품</a></li>
				</ul>
			</div>
		</div>
		<div class="notice">
			<div class="notice_inner">
				<a href="#">공지사항입니다.</a>
			</div>
		</div>
	</header>
</body>
</html>