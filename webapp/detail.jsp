<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String modify_mode = request.getParameter("mode");
	if(modify_mode != null){
%>
	<script>
		alert("게시글 수정에 실패했습니다.");
	</script>
<%
	}
%>

<h1>상세보기 페이지</h1>
<hr>
<form action="modify" method="post">
	<input type="text" name="bno" id="bno" value="${board.bno }" readonly><br>
	<input type="text" name="title" value="${board.title }"><br>
	<textarea name="content" >${board.content }</textarea><br>
	<input type="text" name="writer" value="${board.writer }" readonly><br>
	<input type="text" name="regdate" value="${board.regdate }" readonly><br>
	<input type="text" name="moddate" value="${board.moddate }" readonly><br>
	<input type="submit" value="수정">&nbsp;&nbsp;
	<input type="button" value="삭제" onclick="delBoard()">
</form>
<hr>
<h3>댓글 작성하기</h3>
<input type="text" name="comment">
<input type="button" value="댓글 등록" onclic="regReply()">

<hr>
<h3>댓글 목록</h3>
<table>
	<tbody id="tbody">
	<c:forEach var ="reply" items="${replyList }" varStatus="status">
		<tr>
			<td>${status.count }</td>
			<td>${reply.coment }</td>
			<td>${reply.writer }</td>
			<td>${reply.regdate }</td>
			<td><a href="deleteRReplu?rno=${reply.rno }&bno=${reply.bno}">X</td>	
		</tr>
	</c:forEach>
	</tbody>
</table>
<script>
	const txt_bno = document.querySelector("input[name='bno']");
	const txt_writer = document.querySelector("input[name='writer'])"
	const txt_comment = document.querySelector("input[name='writer'])"
	const tbody = document.querySelector("#tbody");
	
	function delBoard(){
		
	}
	
</script>
</body>
</html>