<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
	<c:import url="/common/top_import.jsp"></c:import>
	<section>
		<h1>회원가입</h1>
	    <form action="${pageContext.request.contextPath}/user/register.do"
	            method="post">
	        <table>
	            <tr>
	                <td>아이디</td>
	                <td><input type="text" name="id" id="pass_id"/><span id="demo"></span></td>
	            </tr>
	            <tr>
	                <td>비밀번호</td>
	                <td><input type="password" name="pass"/></td>
	            </tr>
	            <tr>
	                <td>이름</td>
	                <td><input type="text" name="name" /></td>
	            </tr>
	            <tr>
	                <td>생년월일</td>
	                <td><input type="text" name="birthday" /></td>
	            </tr>
	            <tr>
	                <td>전화번호</td>
	                <td><input type="text" name="phone" /></td>
	            </tr>
	            <tr>
	                <td>이메일</td>
	                <td><input type="text" name="email" /></td>
	            </tr>
	            <tr>
	                <td colspan=2><input type="submit" value="가입" /></td>
	            </tr>
	        </table>
	    </form>
	</section>
</body>
    <script>
    	var inputObj = document.getElementById("pass_id");
    	inputObj.addEventListener("keyup", function(){chkId(inputObj)});
    	
    	function chkId(obj) {
    	  var xhttp = new XMLHttpRequest();
    	  var text = "사용할 수 없는 아이디입니다.";
    	  xhttp.onreadystatechange = function() {
    	    if (this.readyState == 4 && this.status == 200) {
    	      obj = JSON.parse(this.responseText);
    	      if(obj.result) {
    	    	  text = "사용할 수 있는 아이디입니다.";
    	      }
    	      document.getElementById("demo").innerHTML = text;
    	    }
    	  };
    	  xhttp.open("post", "/My_Project/api/chk_user.api", true);
    	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	  console.log(obj.value);
    	  xhttp.send("newId="+obj.value);
    	}
    </script>
</html>