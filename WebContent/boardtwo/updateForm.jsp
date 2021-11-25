<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<section>
<b>글쓰기</b>
<article>
	<!-- onsubmit 은 submit을 눌렀을때 실행됨, onsubmit 결과가 false이면 제출되지 않음! -->
	<form method="post" name="writeForm" action="${pageContext.request.contextPath}/board/updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
		<table border="1">
			<tr>
				<td align="center"><b>이름</b></td>
				<td>${article.writer }
					<input type="hidden" name="num" value=${article.num }>
					<input type="hidden" name="writer" value=${article.writer }>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value=${article.email }></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="subject" value="${article.subject}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="14" cols="50">${article.content }</textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="window.location='${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum }'">
					<!--<input type="button" value="목록" onclick="document.location.href='list.jsp'">  -->
				</td>
			</tr>
		</table>
	</form>
	</article>
	</section>
</body>
</html>