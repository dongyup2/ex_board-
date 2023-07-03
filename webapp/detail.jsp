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
</body>
</html>