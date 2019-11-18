<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%
	String bNum = (String)request.getParameter("boardNum");
    int boardNum = Integer.parseInt(bNum);
    int pageNum = boardNum/10 +1;
   	int num = 1;
	System.out.println(boardNum);
	System.out.println(pageNum);
	
	String pages = (String)request.getParameter("pages");
	System.out.println("pages = "+pages);
	num = Integer.parseInt(pages);
	System.out.println("pages = "+pages+", num = "+num);
	
	int startBoard = (num-1)*10;
	int endBoard = num*10-1;
%>
<c:set var="num" value="<%=num %>"/>
<c:set var="pageNum" value="<%=pageNum %>"/>
<c:set var="startBoard" value="<%=startBoard %>" />
<c:set var="endBoard" value="<%=endBoard %>" />

<style>
    body div.list table, th, td {
        border: 1px solid green;
    }
    th {
        background-color: green;
        color: white;
    }
</style>

<t:genericpage>
    <jsp:attribute name="head">
        <title>list.jsp</title>
    </jsp:attribute>
    <jsp:attribute name="header">
        <!-- 머릿말 추가 -->
    </jsp:attribute>
    <jsp:attribute name="footer">
        <!-- 꼬릿말 추가 -->
    </jsp:attribute>
    
    <jsp:body>
		<h1>게시글 리스트</h1>
		<table style="text-align: center;">
		    <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>날짜</th>
		        <th>조회수</th>
		    </tr>
		    <c:forEach items="${articleList}" var="article" varStatus="status" begin="${startBoard}" end="${endBoard}">
		        <tr>
		            <td>${status.count}</td>
		            <td><a href="content.do?idx=${article.idx }">${article.title}</a></td>
		            <td>${article.writer}</td>
		            <td>${article.regdate}</td>
		            <td>${article.hit_count}</td>
		        </tr>
		    </c:forEach>
		</table>

		<c:if test="${num > 1}">
            <a href="${pageContext.request.contextPath}/board/list.do?pages=1">[처음]</a>
            <a href="${pageContext.request.contextPath}/board/list.do?pages=${num-1}">[이전]</a>
        </c:if>
		<c:if test="${num < pageNum}">
	        <a href="${pageContext.request.contextPath}/board/list.do?pages=${num+1}">[다음]</a>
	        <a href="${pageContext.request.contextPath}/board/list.do?pages=${pageNum }">[마지막]</a>
	    </c:if><br>
		<a href="write.do">글쓰기</a>
    </jsp:body>
</t:genericpage>



