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
<title>회원 정보 출력창</title>
<c:choose>
	<c:when test="${msg== 'addMember' }">
		<script>
			window.onload=function () {
				alert ("회원을 등록했습니다.")
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
	<h2 align="center">회원 정보</h2>
	<table align="center" border="1" width="700">
		<tr align="center" bgcolor="lightgreen">
			<th>이메일</th>
			<th>비밀번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>핸드폰번호</th>
			<th>이름</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<c:choose>
		<c:when test="${empty memberList}">
			<tr>
				<td colspan="9" align="center">등록된 회원이 없습니다.</td>
			</tr>
		</c:when>
		<c:when test="${!empty memberList}">
			<c:forEach var="mem" items="${memberList}">
				<tr align="center">
					<td>${mem.email}</td>
					<td>${mem.pwd}</td>
					<td>${mem.postcode}</td>
					<td>${mem.address}</td>
					<td>${mem.detailaddress}</td>
					<td>${mem.phone}</td>
					<td>${mem.name}</td>
					<td><a href="${contextPath}/member/modMemberForm.do?email=${mem.email}">수정</a></td>
					<td><a href="${contextPath}/member/delMember.do?email=${mem.email}">삭제</a></td>
				</tr>
			</c:forEach>		
		</c:when>
	</c:choose>
	</table>
</body>
</html>