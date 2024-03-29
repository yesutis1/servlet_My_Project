<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
<%
	String bNum = (String)request.getParameter("boardNum");
    int boardNum = Integer.parseInt(bNum);
    int pageNum = boardNum/10 +1;
   	int num = 1;
	
	String pages = (String)request.getParameter("pages");
	num = Integer.parseInt(pages);
	System.out.println("pages = "+pages+", num = "+num);
	
	int startBoard = (num-1)*10;
	int endBoard = num*10-1;
%>
<c:set var="num" value="<%=num %>"/>
<c:set var="pageNum" value="<%=pageNum %>"/>
<c:set var="startBoard" value="<%=startBoard %>" />
<c:set var="endBoard" value="<%=endBoard %>" />



	<c:import url="/common/top_import.jsp"></c:import>
	<section>
		<h1>게시글 리스트</h1>
		<table class="table">
		    <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>날짜</th>
		        <th>첨부파일</th>
		        <th>조회수</th>
		    </tr>
		    <c:forEach items="${articleList}" var="article" varStatus="status" begin="${startBoard}" end="${endBoard}">
		        <tr>
		            <td>${status.count+startBoard}</td>
		            <td><a href="content.do?idx=${article.idx }">${article.title}</a></td>
		            <td>${article.writer}</td>
		            <td>${article.regdate}</td>
		            <td>${article.fileName}</td>
		            <td>${article.hit_count}</td>
		        </tr>
		    </c:forEach>
		</table>
		
            <a href="${pageContext.request.contextPath}/board/list.do?pages=1">[처음]</a>
		<c:if test="${num > 1}">
            <a href="${pageContext.request.contextPath}/board/list.do?pages=${num-1}">[이전]</a>
        </c:if>
        <c:if test="${num <= 1}">
            <a href="${pageContext.request.contextPath}/board/list.do?pages=1">[이전]</a>
        </c:if>
        
        <c:forEach items="${articleList }" varStatus="status" begin="1" end="${pageNum }">
        	<a href="${pageContext.request.contextPath}/board/list.do?pages=${status.count}">${status.count}</a>
        </c:forEach>
        
		<c:if test="${num < pageNum}">
	        <a href="${pageContext.request.contextPath}/board/list.do?pages=${num+1}">[다음]</a>
	    </c:if>
	    <c:if test="${num >= pageNum}">
	        <a href="${pageContext.request.contextPath}/board/list.do?pages=${pageNum}">[다음]</a>
	    </c:if>
        <a href="${pageContext.request.contextPath}/board/list.do?pages=${pageNum }">[마지막]</a>
        
	        <br>
		<!-- a href="write.do">글쓰기</a-->
	</section>
</body>
</html>
