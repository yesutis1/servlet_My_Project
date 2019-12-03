<%@page import="java.sql.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content.jsp</title>
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/boardCss/content.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
	<!-- nav -->
	<c:import url="/common/top_import.jsp"></c:import>
	
	<section>
		<h1>가입 회원 조회</h1>
		<c:forEach items="${articleList}" var="article">
			<table class="lookContent table content">
				<tr>
					<th>번호</th>
					<td>${article.idx}</td>
					<th>회원 ID</th>
					<td>${article.writer}</td>
					<th>이메일</th>
					<td>${article.regdate}</td>
					<th>가입날짜</th>
					<td>${article.hit_count}</td>
				</tr>
				<tr>
					<th colspan="2">번호</th>
					<td colspan="6">${article.title}</td>
				</tr>
				<tr>
					<th colspan="2">회원 ID</th>
					<td colspan="6">${article.content}</td>
				</tr>
				<tr>
					<th colspan="2">이메일</th>
					<td colspan="6">${article.content}</td>
				</tr>
				<tr>
					<th colspan="2">가입날짜</th>
					<td colspan="6">${article.content}</td>
				</tr>
			</table>
			
		</c:forEach>
	</section>
	
		<!-- footer -->
	<c:import url="/common/bottom_import.jsp"></c:import>
</body>
</html>
