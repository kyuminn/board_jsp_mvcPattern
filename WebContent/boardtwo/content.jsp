<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	table {
	width:500px;
	}
</style>
</head>
<body>
	<form>
		<table border="1">
			<tr>
				<th>글번호</th>
				<td>${article.num }</td>
				<th>조회수</th>
				<td>${article.readcount }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${article.writer }</td>
				<th>작성일</th>
				<td>${article.regdate }</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">${article.subject }</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3"><pre>${article.content }</pre></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="글수정" onclick="document.location.href=
					'${pageContext.request.contextPath}/board/updateForm.do?num=${article.num }&pageNum=${pageNum }'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글삭제" onclick="document.location.href=
					'${pageContext.request.contextPath}/board/deleteForm.do?num=${article.num }&pageNum=${pageNum }'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!--  수정 1 -->
					<!-- 답글달때는 parameter로 값 넘겨줌 -->
					<input type="button" value="답글" onclick="document.location.href='${pageContext.request.contextPath}/board/writeForm.do?num=${article.num }&ref=${article.ref }&step=${article.step }&depth=${article.depth}'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글목록" onclick="document.location.href=
					'${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum }'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>