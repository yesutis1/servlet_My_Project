<%@page import="java.sql.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
		<%
			String idx = request.getParameter("idx");
			session.setAttribute("a", idx);
		%>
<t:genericpage>
    <jsp:attribute name="head">
		<style>
			body div.container div#body table tr {
					border: 1px solid grey;
				}
		</style>
        <title>contnet.jsp</title>
    </jsp:attribute>
    <jsp:attribute name="header">
        <!-- 머릿말 추가 -->
    </jsp:attribute>
    <jsp:attribute name="footer">
        <!-- 꼬릿말 추가 -->
    </jsp:attribute>
    
    <jsp:body>
		<h1>게시글 조회</h1>
		<c:forEach items="${articleList}" var="article">
				<table>
					<tr>
				        <th>번호</th>
				        <td>${article.idx}</td>
				        <th>작성자</th>
				        <td>${article.writer}</td>
				        <th>날짜</th>
				        <td>${article.regdate}</td>
				        <th>조회수</th>
				        <td>${article.hit_count}</td>
				    </tr>
				    <tr>
				    	<th colspan="2">제목</th>
				        <td colspan="6">${article.title}</td>
				    </tr>
				    <tr>
				    	<th colspan="2">내용</th>
				        <td colspan="6">${article.content}</td>
				    </tr>
				    <tr>
				    	<td colspan="2">첨부파일 : </td>
				    	<c:if test="${article.fileName.equals('null')}">
            				<td colspan="6">없음</td>
			            </c:if>
			            <c:if test="${!article.fileName.equals('null')}">
							<td colspan="6"><a href="${pageContext.request.contextPath}/downloadAction?file=${article.fileRealName}">${article.fileName}</a></td>            	
			            	<tr>
			            		<td colspan="2">이미지</td>
				            	<td colspan="6"><img src="C:/Users/YONSAI/Desktop/My/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/My_Project/upload/${article.fileName}"></td>
			            	</tr>
			            </c:if>
				    </tr>
				</table>
				<c:if test="${not empty ID }">
					<a href="delete.do?idx=${article.idx}">게시글 삭제</a><br/>
				</c:if>
				<c:forEach items="${articleContent}" var="article" varStatus="status">
					<table>
						<tr>- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</tr>
						<tr>
							<th>번호 : ${status.count}</th>
					        <th>작성자</th>
					        <td>${article.writer}</td>
					        <th>날짜</th>
					        <td>${article.regdate}</td>
					    </tr>
					    <tr>
					    	<th colspan="2">내용</th>
					        <td colspan="6">${article.content}</td>
					    </tr>
					</table>
					<a href="deleteContent.do?idx=${article.idx}">댓글 삭제</a><br>
				</c:forEach>
				<div>- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</div>
				<c:if test="${not empty ID }">
	    			<form action="boardContent.do" method="post">
	    				번호 : <br>
						아이디 : ${ID }<br>
						내용 : <br>
						<textarea name="boardContent" cols="20" rows="5" style="width:500px; height:60px;"></textarea><br />
						<input type="submit" >
	    			</form>
				</c:if>
		</c:forEach>
			<a href="list.do">목록으로</a>
    </jsp:body>
    
</t:genericpage>

		
