<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Board Regist Form Page</h1>
<hr>
<form action="regist" method="post">
	<input type="text" name="title" placeholder="제목을 입력해주세요.."><br>
	<textarea name="content" placeholder="내용을 입력해주세요.."></textarea><br>
	<input type="text" name="writer" placeholder="작성자를 입력해주세요..."><br>
	<input type="submit" value="등록">&nbsp;&nbsp;
	<input type="reset" value="초기화">
</form>
</body>
</html>