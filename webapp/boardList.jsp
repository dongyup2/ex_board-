<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>List page</h1>
<hr>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>수정일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list }">
			<tr>	
				<td>${board.bno }</td>
				<td><a href="detail?bno=${board.bno }">${board.title }(${board.replyCnt })</a></td>
				<td>${board.writer }</td>
				<td>
					<fmt:formatDate value="${board.regdate }" pattern="yyyy/MM/dd" />
				</td>
				<td>${board.moddate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>