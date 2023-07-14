<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Fetch Test_Get</h1>
    <hr>    
    <div id="btn">
    	<button data-page="1">1page</button>
    	<button data-page="2">2page</button>
    </div>
    <hr>    
    <div id="demo"></div>
    <script>
        /* const btn = document.getElementById("btn");
         btn.addEventListener('click', f);
         */
        function f(){
            fetch('FetchServlet'
            	method: 'post',
            	body: JSON.stringify({
            		name: "yeri",
            		batch: 1
            	})
         })
            .then(resp =>
            	return resp.json();	
            })        // 응답을 텍스트로 변환
            .then(value => document.getElementById("demo").innerHTML = value.name;
            );
        }
   </script>
</body>
</html>