<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member RegForm</title>
</head>
<body>
<h1>Member RegForm</h1>
<hr>
<form name="frm_reg" action="Regist" method="POST">
    <input type="text" name="name" placeholder="Input name.."><br>
    <input type="text" name="id" placeholder="Input id..">
    <input type="button" id="btn_id" data-init="0" value="id중복확인" disabled><br>
    <div id="result"></div>
    <input type="password" name="pw"	 placeholder="Input pw.."><br>
    <input type="password" name="repw" placeholder="Input repw.."><br>
    <input type="text" name="tel" placeholder="Input tel..">
    <input type="button" id="btn_tel_check" value="전화번호 중복 확인" disabled><br>
    <div id="tel_result"></div>
    <input type="text" name="addr" placeholder="Input addr.."><br>
    <input type="submit" value="등록" onclick="return inputCheck()">&nbsp;&nbsp;
</form>

<script>
    const txt_id = document.querySelector("input[name='id']");
    const btn_idcheck = document.querySelector("#btn_id");
    const div_result = document.getElementById("result");
    btn_idcheck.addEventListener('click', idCheck);
    txt_id.addEventListener('keyup', checkReset);
    
    const txt_tel = document.querySelector("input[name='tel']");
    const btn_tel_check = document.querySelector("#btn_tel_check");
    btn_tel_check.addEventListener('click', telCheck);
    const div_tel_result = document.getElementById("tel_result");
    txt_tel.addEventListener('keyup', telCheckReset);
    
    const txt_pw = document.querySelector("input[name='pw']");
    const txt_repw = document.querySelector("input[name='repw']");
    txt_repw.addEventListener('change', checkSame);

    function checkSame() {
        if (txt_repw.value != txt_pw.value) {
            alert("패스워드와 일치하지 않습니다. 다시 입력하세요.");
            txt_repw.value = "";
            txt_repw.focus();
            return false;
        } else if (txt_repw.value.length == 0 && txt_pw.value.length == 0) {
            alert("패스워드를 입력하지 않았습니다. 확인하세요.");
            txt_pw.focus();
            return false;
        }
        return true;
    }

    function checkReset() {
        btn_idcheck.disabled = false;
        div_result.innerHTML = "아이디 중복확인을 해야합니다.";
    }

    function idCheck() {
        btn_idcheck.dataset.init = 1;
        const xhr = new XMLHttpRequest();
        xhr.onload = function () {
            let checkResult = this.responseText;
            if (checkResult === "1") {
                div_result.innerHTML = "<span style='color: red;'>이미 사용중인 아이디입니다.</span>";
                btn_idcheck.disabled = false;
            } else {
                div_result.innerHTML = "<span style='color: blue;'>사용 가능한 아이디입니다.</span>";
                btn_idcheck.disabled = true;
            }
        }
        xhr.open("POST", "idCheck", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("id=" + txt_id.value);
    }

    function telCheck() {
        const xhr = new XMLHttpRequest();
        xhr.onload = function () {
            let checkTelResult = this.responseText;
            if (checkTelResult === "1") {
                div_tel_result.innerHTML = "<span style='color: red;'>이미 사용중인 전화번호입니다.</span>";
            } else {
                div_tel_result.innerHTML = "<span style='color: blue;'>사용가능한 전화번호입니다.</span>";
            }
        }
        xhr.open("POST", "telCheck", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("tel=" + txt_tel.value);
    }
    
    function telCheckReset() {
        btn_tel_check.disabled = false;
        div_tel_result.innerHTML = "전화번호 중복확인을 해야합니다.";
    }

    function inputCheck() {
        if (frm_reg.name.value.length == 0) {
            alert("이름을 입력하세요.");
            frm_reg.name.focus();
            return false;
        }
        if (frm_reg.id.value.length == 0) {
            alert("아이디를 입력하세요.");
            frm_reg.id.focus();
            return false;
        }
        if (frm_reg.pw.value.length == 0) {
            alert("비밀번호를 입력하세요.");
            frm_reg.pw.focus();
            return false;
        }
        if (frm_reg.repw.value.length == 0) {
            alert("비밀번호 확인란을 입력하세요.");
            frm_reg.repw.focus();
            return false;
        }
        if (frm_reg.tel.value.length == 0) {
            alert("전화번호를 입력하세요.");
            frm_reg.tel.focus();
            return false;
        }
        if (btn_idcheck.disabled == false || btn_idcheck.getAttribute("data-init") == 0) {
            alert("아이디 중복확인을 하세요...");
            btn_idcheck.focus();
            return false;
        }
        if (!checkSame()) {
            return false;
        }
        return true;
    }
</script>
</body>
</html>
