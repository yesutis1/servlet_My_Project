<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.regex.Pattern"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="./static/css/top.css">
<link rel="stylesheet" href="./static/css/index.css">
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="./static/bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
	<c:import url="/common/top_import.jsp"></c:import>
	<section>
		<h1>로그인</h1>
        <c:if test="${not empty requestScope.message}">
            <div>${requestScope.message }</div>
        </c:if>
        <c:if test="${not empty ID }">
        <!-- el 표현언어는 scope를 가까운것부터 확인하여 jsp로는 sessionScope.ID 라고 해야함-->
            로그인 되었습니다.
        </c:if>
        <c:if test="${empty ID }">
            <form action="${pageContext.request.contextPath}/user/login.do" method="post">
                <table>
                	<tr>
                		<td>아이디</td>
                		<td><input type="text" name="id" /></td>
                	</tr>
                	<tr>
                		<td>비밀번호</td>
                		<td><input type="password" name="pass" /></td>
                	</tr>
                	<tr>
                		<td colspan="2"><input type="submit" value="로그인" /></td>
                	</tr>
                </table>
            </form>
        </c:if>
    </section>
</body>
</html>
