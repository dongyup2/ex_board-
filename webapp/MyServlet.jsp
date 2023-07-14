<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button id="btn" onclick="f('aaaa')">run</button>
    <hr>
    <p id ="demo"></p>
    <script>
        const btn = document.getElementById("btn");
        btn.addEventListener('click', fetchFromServlet);
        
        function fetchFromServlet(str){
            fetch('servlet')
            .then(resp => resp.text())        // 응답을 텍스트로 변환
            .then(value => {
                document.getElementById("demo").innerHTML = value;
            });
        }
   </script>
</body>
</html>