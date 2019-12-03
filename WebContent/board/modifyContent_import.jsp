<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<c:if test="${empty ID }">
	<div>로그인후 이용 가능합니다.</div>
</c:if>
<c:if test="${not empty ID }">
	<c:forEach items="${articleList}" var="article">
		<form action="modify.do" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${article.idx }">
			번호: ${article.idx }<br/>
			카테고리 : <select name="category" value="${article.category }">
				<option value="일반">일반</option>
				<option value="가입인사">가입인사</option>
				<option value="공지사항">공지사항</option>
			</select><br />
			<input type="hidden" value="${article.writer }">
			작성자: ${article.writer }<br/>
		    제목: <input type="text" name="title" value="${article.title }"/><br />
		    <!-- 작성자: <input type="text" name="writer"/><br /> -->
		    내용: <textarea name="content" cols="30" rows="10">${article.content }</textarea><br />
		    <div class="file">
			    <label >Choose file </label>
			    <input type="file" name="file">
			</div>
		    <input type="submit" class="btn btn-outline-success"/>
		</form>
	</c:forEach>
</c:if>

<script>
    function formCheck() {
        var title, writer, regdate, content, myForm;
        myForm = document.forms[0];
        title = myForm.title.value;
        writer = myForm.writer.value;
        regdate = myForm.regdate.value;
        content = myForm.content.value;
        
        if(title == null || title == ""){
            alert("제목을 입력하세요");
            myForm.title.focus();
            return false;
        }
        if(writer == null || writer == ""){
            alert("제목을 입력하세요");
            myForm.writer.focus();
            return false;
        }
        if(regdate == null || regdate == ""){
            alert("제목을 입력하세요");
            myForm.regdate.focus();
            return false;
        }
        if(content == null || content == ""){
            alert("제목을 입력하세요");
            myForm.content.focus();
            return false;
        }
    }
</script>