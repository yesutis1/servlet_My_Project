<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	    <c:if test="${not empty requestScope.message }">
	        <div>${requestScope.message }</div>
	    </c:if>
	    <c:if test="${not empty ID }">
	        <a href="${pageContext.request.contextPath}/home.do">로그인 화면으로 돌아가기</a>
	    </c:if>
	    <c:if test="${empty ID }">
	        <a href="${pageContext.request.contextPath}/user/register_form.do">회원 가입 화면으로 돌아가기</a>
	    </c:if>
	</section>
</body>
</html>