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

			<div id="aside">
				<h2 class="aside-tit">MY PAGE</h2>
				<div class="lnb-wrap">
					<div class="lnb-bx">
						<h2 class="txt txt1">SHOPPING INFO</h2>
						<div class="lnb">
							<ul>
								<li class="first"><a
									href="/shop/mypage.html?mypage_type=myorder">주문내역</a></li>
								<li><a href="/shop/mypage.html?mypage_type=mycoupon">쿠폰내역</a></li>
								<li><a href="/shop/mypage.html?mypage_type=myreserve">적립금내역</a></li>
								<li><a href="/shop/mypage.html?mypage_type=myemoney">예치금내역</a></li>
								<li><a href="/shop/mypage.html?mypage_type=myattpoint">출석체크
										적립금내역</a></li>
								<li><a href="/shop/todaygoods.html">오늘본상품</a></li>
								<li><a href="/shop/mypage.html?mypage_type=mywishlist">상품
										보관함</a></li>
								<li><a
									href="/shop/mypage.html?mypage_type=myreceivepresent">선물함</a></li>
							</ul>
						</div>
					</div>
					<div class="lnb-bx">
						<h2 class="txt txt2">SHOPPING QUESTION</h2>
						<div class="lnb">
							<ul>
								<li class="first"><a
									href="/shop/mypage.html?mypage_type=myarticle">내 게시글 보기</a></li>
								<li><a href="/shop/mypage.html?mypage_type=myemail">E-mail
										문의</a></li>
								<li><a href="/shop/mypage.html?mypage_type=mym2mboard">1:1게시판</a></li>
							</ul>
						</div>
					</div>
					<div class="lnb-bx">
						<h2 class="txt txt3">CUSTOMER INFO</h2>
						<div class="lnb">
							<ul>
								<li class="first"><a href="/shop/idinfo.html">회원정보변경</a></li>
								<li><a href="javascript:userexit();">회원정보탈퇴신청</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div id="content">
				<div id="mypage">
					<div class="page-body">
						<!-- 회원 정보 -->
						<div class="info">
							<div class="user">
								<div class="user-img"></div>
								<div class="user-info">
									<p>
										강현우[gosdn1124]님 <a href="/shop/idinfo.html"
											class="CSSbuttonWhite CSSbuttonMin">수정</a>
									</p>
									<div class="box">
										<dl>
											<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
											<dd></dd>
										</dl>
										<dl>
											<dt>이 메 일</dt>
											<dd>gosdn1124@naver.com</dd>
										</dl>
										<dl>
											<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
											<dd></dd>
										</dl>
									</div>
								</div>
							</div>
							<dl class="order">
								<dt class="tot">총 주문금액 :</dt>
								<dd class="tot">
									<strong>0</strong>원
								</dd>
								<dt>적 립 금</dt>
								<dd>
									<a href="/shop/mypage.html?mypage_type=myreserve"><strong>1,000</strong>원</a>
								</dd>
								<dt>예 치 금</dt>
								<dd>
									<a href="/shop/mypage.html?mypage_type=myemoney"><strong>0</strong>원</a>
								</dd>
								<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt>
								<dd>
									<a href="/shop/mypage.html?mypage_type=mycoupon"><strong>0</strong>개</a>
								</dd>
							</dl>
						</div>
						<!-- //회원 정보 -->

						<!-- 회원 그룹 정보 -->
						<div class="grp">
							<p>
								강현우님은 [일반회원]회원입니다.<br />
							</p>
						</div>
						<!-- //회원 그룹 정보 -->

						<!-- 최근 주문 정보 -->
						<div class="hd">
							<h3>최근 주문 정보</h3>
							<a class="view fe" href="/shop/mypage.html?mypage_type=myorder">+
								MORE</a>
						</div>
						<div class="tbl">
							<table summary="주문일자, 상품명, 결제금액, 주문상세">
								<caption>최근 주문 정보 목록</caption>
								<colgroup>
									<col width="150">
									<col width="*">
									<col width="140">
									<col width="140">
								</colgroup>
								<thead>
									<tr>
										<th><div class="tb-center">DATE</div></th>
										<th><div class="tb-center">PRODUCT</div></th>
										<th><div class="tb-center">COST</div></th>
										<th><div class="tb-center">DETAIL</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //최근 주문 정보 -->

						<!-- 최근 등록 게시글 -->
						<div class="hd">
							<h3>최근 등록 게시글</h3>
							<a class="view fe" href="/shop/mypage.html?mypage_type=myarticle">+
								MORE</a>
						</div>
						<div class="tbl">
							<table summary="등록일자, 제목, 게시판">
								<caption>최근 등록 게시물 목록</caption>
								<colgroup>
									<col width="150">
									<col width="*">
									<col width="200">
								</colgroup>
								<thead>
									<tr>
										<th><div class="tb-center">DATE</div></th>
										<th><div class="tb-center">SUBJECT</div></th>
										<th><div class="tb-center">BOARD</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="3"><div class="tb-center">작성된 게시글이
												없습니다.</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //최근 등록 게시글 -->

						<!-- 관심 상품 정보 -->
						<div class="hd">
							<h3>관심 상품 정보</h3>
							<a class="view fe"
								href="/shop/mypage.html?mypage_type=mywishlist">+ MORE</a>
						</div>
						<div class="lst">
							<div class="goodsListWrap grid4">
								<ul class="">
								</ul>
							</div>
						</div>
						<!-- //관심 상품 정보 -->

					</div>
					<!-- .page-body -->
				</div>
				<!-- #mypage -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
	<hr />

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
</body>
</html>