<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>
    table, th, td {
        border: 1px solid green;
    }
    th {
        background-color: green;
        color: white;
    }
</style>
</head>
<body>

	<a href="${pageContext.request.contextPath}">홈</a>
	<a href="${pageContext.request.contextPath}/user/dog.do">Dog</a>
	<a href="${pageContext.request.contextPath}/board/list.do">게시판_1</a>
	<a href="${pageContext.request.contextPath}/board/lists.do?page=0">게시판_2</a>
	
	
	<c:if test="${not empty ID }">
	    <a href="${pageContext.request.contextPath}/user/member_info.do">${ID }님</a>
	    <a href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
	</c:if>
	<c:if test="${empty ID }">
	<a href="${pageContext.request.contextPath}/user/login.do">로그인</a>
	    <a href="${pageContext.request.contextPath}/user/register_form.do">회원가입</a>
	</c:if>
	<div>머릿말</div>


<h1>게시글 리스트</h1>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>첨부파일</th>
        <th>조회수</th>
    </tr>
    <c:forEach items="${articleList}" var="article" varStatus="status">
        <tr>
            <td>${status.count+startNum*10}</td>
            <td><a href="content.do?idx=${article.idx }">${article.title}</a></td>
            <td>${article.writer}</td>
            <td>${article.regdate}</td>
            <c:if test="${article.fileName.equals('null')}">
            	<td>없음</td>
            </c:if>
            <c:if test="${!article.fileName.equals('null')}">
				<td><a href="${pageContext.request.contextPath}/downloadAction?file=${article.fileRealName}">${article.fileName}</a></td>            	
            </c:if>
            <td>${article.hit_count}</td>
        </tr>
    </c:forEach>
</table>
    	<a href="${pageContext.request.contextPath}/board/lists.do?page=0">[처음]</a>
    	<c:if test="${startNum == 0 }">
	     	<a href="${pageContext.request.contextPath}/board/lists.do?page=0">[이전]</a>    	
    	</c:if>
		<c:if test="${startNum != 0 }">
	     	<a href="${pageContext.request.contextPath}/board/lists.do?page=${startNum-1}">[이전]</a>    	
    	</c:if>
        
        <c:forEach items="${articleList }" varStatus="status" begin="1" end="${allPageNum }">
        	<a href="${pageContext.request.contextPath}/board/lists.do?page=${status.count-1}"> ${status.count} </a>
        </c:forEach>
        
    	<c:if test="${startNum == allPageNum-1 }">
	     	<a href="${pageContext.request.contextPath}/board/lists.do?page=${allPageNum-1}">[다음]</a>    	
    	</c:if> 
        <c:if test="${startNum != allPageNum-1 }">  	
	        <a href="${pageContext.request.contextPath}/board/lists.do?page=${startNum+1}">[다음]</a>
    	</c:if>
        <a href="${pageContext.request.contextPath}/board/lists.do?page=${allPageNum-1}">[마지막]</a>
		<br/><a href="write.do">글쓰기</a><br />


		<%
			//String directory = application.getRealPath("/upload/");
			//String files[] = new File(directory).list();
			//for(String file:files){
			//	out.write("<a href=\""+request.getContextPath() + "/downloadAction?file=" +
			//		java.net.URLEncoder.encode(file,"UTF-8") + "\">" + file + "</a><br>");
			//}
		%>
</body>
</html>