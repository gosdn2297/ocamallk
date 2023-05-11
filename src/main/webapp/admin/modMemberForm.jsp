<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정창</title>
</head>
<body>
	<form action="${contextPath}/member/modMember.do?email=${memFindInfo.email}" method="post">
		<h2 align="center">회원 정보 수정창</h2>
		<table align="center">
			<tr>
				<td width="200"><p align="right">이메일</p></td>
				<td width="400"><input type="email" name="이메일" value="${memFindInfo.email}" disabled></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</p></td>
				<td width="400"><input type="password" name="pwd" value="${memFindInfo.pwd}" disabled></td>
			</tr>
			<tr>
				<td width="200"><p align="right">우편번호</p></td>
				<td width="400"><input type="text" name="postcode" value="${memFindInfo.postcode}"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">주소</p></td>
				<td width="400"><input type="text" name="address" value="${memFindInfo.address}"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">상세주소</p></td>
				<td width="400"><input type="text" name="detailaddress" value="${memFindInfo.detailaddress}"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">핸드폰번호</p></td>
				<td width="400"><input type="text" name="phone" value="${memFindInfo.phone}"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이름</p></td>
				<td width="400"><input type="text" name="name" value="${memFindInfo.name}"></td>
			</tr>
			<tr>
				<td width="200">&nbsp;</td>
				<td width="400">
				<input type="submit" value="수정하기">
				<input type="reset" value="다시입력">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>