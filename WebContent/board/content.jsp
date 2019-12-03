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
	<%
		String idx = request.getParameter("idx");
		session.setAttribute("a", idx);
	%>
	
	<!-- nav -->
	<c:import url="/common/top_import.jsp"></c:import>
	
	<section>
		<h1>게시글 조회</h1>
		<c:forEach items="${articleList}" var="article">
			<table class="lookContent table content">
				<tr>
					<th>번호</th>
					<td>${article.idx}</td>
					<th>카테고리</th>
					<td>${article.category}</td>
					<th>작성자</th>
					<td>${article.writer}</td>
					<th>날짜</th>
					<td>${article.regdate}</td>
					<th>조회수</th>
					<td>${article.hit_count}</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="8">${article.title}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
					<td colspan="8">${article.content}</td>
				</tr>
				<tr>
					<td colspan="2">첨부파일 :</td>
					<c:if test="${article.fileName.equals('null')}">
						<td colspan="8">없음</td>
					</c:if>
					<c:if test="${!article.fileName.equals('null')}">
						<td colspan="8"><a href="${pageContext.request.contextPath}/downloadAction?file=${article.fileRealName}">${article.fileName}</a></td>
						<tr>
							<td colspan="2">이미지</td>
							<td colspan="8">
							<img src="${pageContext.request.contextPath}/upload/${article.fileName}"></td>
						</tr>
					</c:if>
				</tr>
				<c:if test="${not empty ID }">
					<tr class="contentDeleteButton">
						<td colspan="10">
							<a class="btn btn-outline-success btn-sm" onclick="modifyContentAction()">게시글 수정</a>
							<a href="delete.do?idx=${article.idx}" class="btn btn-outline-danger btn-sm">게시글 삭제</a>
						</td>
					</tr>
				</c:if>
			</table>
			<!-- 게시글 수정-->
		</c:forEach>
		<div id="modifyContent">
			<c:import url="modifyContent_import.jsp"></c:import>
		</div>
		
		<c:forEach  var="articleContent" items="${articleContent}" varStatus="status">
			<c:forEach var="articleList" items="${articleList}">
				<table class="commentList table table-sm">
					<tr>
						<th>번호 : ${status.count}</th>
						<th>작성자</th>
						<td>${articleContent.writer}</td>
						<th>날짜</th>
						<td>${articleContent.regdate}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">${articleContent.content}</td>
					</tr>
					<tr class ="commentDeleteButton">
						<td colspan="6">
							<a href="deleteComment.do?contentIdx=${articleList.idx}&commentIdx=${articleContent.idx}" class="btn btn-outline-danger btn-sm">댓글 삭제</a>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:forEach>
		
		<div class="writeComment">
			<c:if test="${not empty ID }">
				<form action="boardComment.do" method="post">
					<div>아이디 : ${ID }</div>
					<div> 내용 : </div>
					<textarea name="boardContent" cols="20" rows="5"
					style="width: 500px; height: 60px;"></textarea>
					<div class="commentButton">
						<input type="submit" class="btn btn-outline-success btn-sm">
					</div>
				</form>
			</c:if>
		</div>
		<div class="backButton">
			<a href="lists.do?page=0&category=all" class="btn btn-outline-primary">돌아가기</a>
		</div>

		

		
	</section>
	
		<!-- footer -->
	<c:import url="/common/bottom_import.jsp"></c:import>
	
	<script>
		function modifyContentAction(){
			var el = document.getElementById("modifyContent");
			el.classList.toggle("openModifyContent");
		}
	</script>
</body>
</html>
