<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="../static/css/top.css">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/boardCss/list2.css">
<link rel="stylesheet" href="../static/bootstrap/4.1.3/css/bootstrap.css">
</head>
<body>
	<!-- nav -->
	<c:import url="/common/top_import.jsp"></c:import>
	
	<section>
		<h1>게시글 리스트</h1>
		<div class="search">
			<form action="lists.do">
				<input type="hidden" value="0" name="page">
				<input type="hidden" value="${category }" name="category">
				<div>
					<input type="text" name="search" class="form-control" placeholder="글 제목 검색하기" value="${search }">
					<button type="submit" class="btn btn-outline-primary btn-sm">검색</button>
				</div>
			</form>
		</div>
		<!-- table bootstrap -->
		<table class="table list table-hover">
		    <tr>
		        <th class="listNum">번호</th>
		        <th class="listCategory">
			        <form action="${pageContext.request.contextPath}/board/lists.do?page=0" >
			        	<input type="hidden" value="0" name="page">
			        	<select name="category" onchange="this.form.submit()" class="custom-select">
			        		<option value="all">카테고리 선택</option>
			        		<option value="all" >모두</option>
			        		<option value="일반" >일반</option>
			        		<option value="가입인사" >가입인사</option>
			        		<option value="공지사항" >공지사항</option>
			        	</select>
		       		</form>
		        </th>
		        <th class="listTitle">제목</th>
		        <th class="listWriter">작성자</th>
		        <th class="listDate">날짜</th>
		        <th class="listFile">첨부파일</th>
		        <th class="listComment">댓글</th>
		        <th class="listCount">조회수</th>
		    </tr>
		    <c:forEach items="${articleList}" var="article" varStatus="status">
		        <tr>
		            <td class="listNum">${status.count+startNum*10}</td>
		            <td class="listCategory">${article.category}</td>
		            <td class="listTitle title"><a href="content.do?idx=${article.idx }">${article.title}</a></td>
		            <td class="listWriter">${article.writer}</td>
		            <td class="listDate">${article.regdate}</td>
		            <c:if test="${article.fileName.equals('null')}">
		            	<td class="listFile">없음</td>
		            </c:if>
		            <c:if test="${!article.fileName.equals('null')}">
						<td class="listFile"><a href="${pageContext.request.contextPath}/downloadAction?file=${article.fileRealName}">${article.fileName}</a></td>            	
		            </c:if>
		            <td class="listComment">${article.commentCount}</td>
		            <td class="listCount">${article.hit_count}</td>
		        </tr>
		    </c:forEach>
		</table>
			<div class="listButton">
		    	<a href="${pageContext.request.contextPath}/board/lists.do?page=0&category=${category}&search=${search }">[ 처음 ]</a>
		    	<c:if test="${startNum == 0 }">
			     	<a href="${pageContext.request.contextPath}/board/lists.do?page=0&category=${category}&search=${search }">[ 이전 ]</a>    	
		    	</c:if>
				<c:if test="${startNum != 0 }">
			     	<a href="${pageContext.request.contextPath}/board/lists.do?page=${startNum-1}&category=${category}&search=${search }">[ 이전 ]</a>    	
		    	</c:if>
		        
		        <c:forEach items="${articleList}" varStatus="status" begin="0" end="${allPageNum -1}">
		        	<a href="${pageContext.request.contextPath}/board/lists.do?page=${status.count-1}&category=${category}&search=${search }"> ${status.count}</a>
		        </c:forEach>
		        
		    	<c:if test="${startNum == allPageNum-1 }">
			     	<a href="${pageContext.request.contextPath}/board/lists.do?page=${allPageNum-1}&category=${category}&search=${search }">[ 다음 ]</a>    	
		    	</c:if> 
		        <c:if test="${startNum != allPageNum-1 }">  	
			        <a href="${pageContext.request.contextPath}/board/lists.do?page=${startNum+1}&category=${category}&search=${search }">[ 다음 ]</a>
		    	</c:if>
		        <a href="${pageContext.request.contextPath}/board/lists.do?page=${allPageNum-1}&category=${category}&search=${search }">[ 마지막 ]</a>
			</div>
		
        <div class="writeButton">
			<!--a href="write.do">글쓰기</a-->
			<button type="button" id="writeButton" class="btn btn-outline-primary btn-sm">글쓰기</button><br />
		</div>
		
		<div id="write">
			<c:import url="write_import.jsp"></c:import>
		</div>
		
		<!-- %
			//String directory = application.getRealPath("/upload/");
			//String files[] = new File(directory).list();
			//for(String file:files){
			//	out.write("<a href=\""+request.getContextPath() + "/downloadAction?file=" +
			//		java.net.URLEncoder.encode(file,"UTF-8") + "\">" + file + "</a><br>");
			//}
		%-->
	</section>
	
	<!-- footer -->
	<c:import url="/common/bottom_import.jsp"></c:import>
</body>
<script>
	var button = document.getElementById("writeButton");
	button.addEventListener("click", write);
	var button = document.getElementById("writeCancelButton");
	button.addEventListener("click", write);

	function write() {
		var el = document.getElementById("write");
		el.classList.toggle('block');
	}
</script>
</html>