<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="articleList" value="${articleMap.articleList}" />
<c:set var="totArticles" value="${articleMap.totArticles}" />
<c:set var="section" value="${articleMap.section}" />
<c:set var="pageNum" value="${articleMap.pageNum}" />
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="${contextPath}/css/reset.css">
  <link rel="stylesheet" href="${contextPath}/css/header.css">
  <link rel="stylesheet" href="${contextPath}/css/footer.css">
  <link rel="stylesheet" href="${contextPath}/css/qna.css">

  <!-- js -->
  <script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
  <script src="${contextPath}/js/header.js"></script>
  <script src="${contextPath}/js/animation.js"></script>
</head>

<body>
  <div class="arrow">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill arrow-up" viewBox="0 0 16 16">
      <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
    </svg>
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill arrow-down" viewBox="0 0 16 16">
      <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
    </svg>
  </div>

 <jsp:include page="../common/header.jsp"></jsp:include>


  <div class="container">
    <section class="qna">
      <div class="qna_inner">
        <h2>Q&A</h2>

        <form action="">
          <fieldset>
            <legend>검색 폼</legend>
            <label>
              <input type="radio" name="search_radio">작성자
            </label>
            <label>
              <input type="radio" name="search_radio">제목
            </label>
            <label>
              <input type="radio" name="search_radio">내용
            </label>
            <div class="search_bar">
              <input type="search">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
              </svg>
            </div>
          </fieldset>
        </form>
        <table>
          <caption>게시판 목록</caption>
          <colgroup>
            <col width="70">
            <col width="auto">
            <col width="100">
            <col width="140">
            <col width="55">
          </colgroup>

          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">조회수</th>
            </tr>
          </thead>
          <tbody>
          <c:choose>
          	<c:when test="${empty articleList}">
          	<tr>
	          	<td colspan="5">등록된 공지사항이 없습니다.</td>
          	</tr>
          	</c:when>
          	<c:when test="${not empty articleList}">
          		<c:forEach var="article" items="${articleList}" varStatus="articleNum" >
          			<tr>
          				<td>
          					${article.articleNo}
          				</td>
          				<td class="left">
	          				<a href="${contextPath}/qnalist/qnaView.do?articleNo=${article.articleNo}">
	          					${article.title}
							</a>
          				</td>
          				<td>
          					${article.name}
          				</td>
          				<td>
          					${article.writeDate}
          				</td>
          				<td>
          					${article.views}
          				</td>
          			</tr>
          		</c:forEach>
          	</c:when>
          </c:choose>
          </tbody>
        </table>

        <div class="paging">
		<c:if test="${totArticles != 0}">
			<c:choose>
				<c:when test="${totArticles > 100}">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page == 1}">
							<a  href="${contextPath}/qnalist/qna.do?section=${section-1}&pageNum=${(section-1)*10+1}"> prev </a>
						</c:if>
						<a class="paging_list" href="${contextPath}/qnalist/qna.do?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
						<c:if test="${page == 10}">
							<a href="${contextPath}/qnalist/qna.do?section=${section+1}&pageNum=${section*10+1}"> next </a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totArticles <= 100}">
					<c:if test="${(totArticles mod 10) == 0}">
						<c:set var="totArticles" value="${totArticles-1}"/>
					</c:if>
					<c:forEach var="page" begin="1" end="${totArticles/10+1}" step="1">
						<c:choose>
							<c:when test="${page == pageNum}">
								<a class="selPage"
									href="${contextPath}/qnalist/qna.do?section=${section}&pageNum=${page}">${page}</a>
							</c:when>
							<c:otherwise>
								<a class="noLine"
									href="${contextPath}/qnalist/qna.do?section=${section}&pageNum=${page}">${page}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
          <a href="${contextPath}/qna/write.jsp" class="btn_black">글쓰기</a>
	</div>
      </div>
    </section>
  </div>

  <jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>