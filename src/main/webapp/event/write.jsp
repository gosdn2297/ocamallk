<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
  <link rel="stylesheet" href="${contextPath}/css/write.css">

  <!-- js -->
  <script src="${contextPath}/js/jquery-3.6.4.min.js"></script>
  <script src="${contextPath}/js/header.js"></script>
  <script src="${contextPath}/js/animation.js"></script>
  
  <script>
	function readImage(input) {
        if(input.files && input.files[0]){
           let reader = new FileReader();
           reader.onload = function (event) {
              $('#preview').attr('src', event.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
     }
     // 다른 액션을 submit
     function toList(obj) {
        obj.action = "${contextPath}/events/event.do";
        obj.submit();
     }
  </script>
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
    <section class="write">
        <div class="write_inner">
            <h2>WRITE</h2>
            <form action="${contextPath}/events/addArticle.do" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>글쓰기 폼</legend>
                    <input type="text" name="title" placeholder="제목을 작성해주세요" class="input_title">
                    <textarea name="content" id="editor" placeholder="본문을 작성해주세요" class="input_content"></textarea>
                    <p>
                      <input type="file" name="imageFileName" onchange="readImage(this)" >
                      <img src="#" id="preview" width="200" height="200" class="preview_img">
                    </p>
                    <div class="btn_area">
                        <a href="javascript:history.back();" class="btn btn_list">목록보기</a>
                        <button type="submit" class="btn btn_write"><a>작성하기</a></button>
                    </div>
                </fieldset>
            </form>
        </div>
    </section>
  </div>
  <jsp:include page="../common/footer.jsp"></jsp:include>

</body>

</html>