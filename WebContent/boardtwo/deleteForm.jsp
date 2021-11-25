<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function deleteSave(){
	if (document.delForm.pass.value==""){
		alert("비밀번호를 입력하세요!");
		document.delForm.pass.focus();
		return false;
	}
}
</script>
</head>
<body>
	<section>
		<form method="post" name="delForm" action="${pageContext.request.contextPath}/board/deletePro.do?pageNum=${pageNum}" onsubmit="return deleteSave()">
			<table>
				<tr>
					<th><b>비밀번호를 입력해주세요</b></th>
				</tr>
				<tr>
					<td>비밀번호
						<input type="password" name="pass">
						<input type="hidden" name="num" value="${num}">
					</td>
				</tr>
				<tr>
					<td>
						<input type ="submit" value="글삭제">
						<input type ="button" value="글목록" onclick="window.location='${pageContext.request.contextPath}/board/list.do?pageNum=${pageNum }'">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>