<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_info.jsp</title>
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
	<!-- nav -->
	<c:import url="/common/top_import.jsp"></c:import>
	<section>
		<h1>회원정보</h1>
	        <form action="${pageContext.request.contextPath}/user/update.do" method="post">
	            <input type="hidden" name="id" value="${sessionScope.member.id}"/>
	            <table>
	                <tr><th colspan=3>회원정보</th></tr>
	                <tr><td>아이디</td><td>${sessionScope.member.id}</td></tr>
	                <tr><td>비밀번호</td><td><input type="password" name="pass" id="pass"><span id="demo"></span></td></tr>
	                <tr><td>이름</td><td><input type="text" name="name" value="${sessionScope.member.name}"></td></tr>
	                <tr><td>생년월일</td><td><input type="text" name="name" value="${sessionScope.member.birthday}"></td></tr>
	                <tr><td>전화번호</td><td><input type="text" name="phone" value="${sessionScope.member.phone}"></td></tr>
	                <tr><td>이메일</td><td><input type="text" name="email" value="${sessionScope.member.email} "></tr>
	                <tr><td>가입날짜</td><td>${sessionScope.member.reg_date}</td></tr>
	                <tr><td>수정날짜</td><td>${sessionScope.member.mod_date}</td></tr>
	                <tr><td colspan=3><input type="submit" value="수정" class="btn btn-outline-success btn-sm"></td></tr>
	            </table>
	        </form>
	        <a href="${pageContext.request.contextPath}/user/delete.do?=${ID}" class="btn btn-outline-danger btn-sm">회원탈퇴</a>
	</section>
	
	<!-- footer -->
	<c:import url="/common/bottom_import.jsp"></c:import>
</body>
       <script>
       	var inputObj = document.getElementById("pass");
       	inputObj.addEventListener("keyup", function(){chkId(inputObj)});
       	
       	function chkId(obj) {
       	  var xhttp = new XMLHttpRequest();
       	  var text = "비밀번호 확인완료";
       	  xhttp.onreadystatechange = function() {
       	    if (this.readyState == 4 && this.status == 200) {
       	      obj = JSON.parse(this.responseText);
       	      if(obj.result) {
       	    	  text = "비밀번호가 다릅니다";
       	      }
       	      document.getElementById("demo").innerHTML = text;
       	    }
       	  };
       	  xhttp.open("post", "/My_Project/api/chk_user_pass.api", true);
       	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
       	  console.log(obj.value);
       	  xhttp.send("pass="+obj.value);
       	}
       </script>
</html>