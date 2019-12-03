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
            <div>
                <input type="hidden" name="idx" value="${article.idx }">
                번호: ${article.idx }
            </div>
            <div class="category">
                카테고리 : <select name="category" value="${article.category }" class="custom-select">
                    <option value="일반">일반</option>
                    <option value="가입인사">가입인사</option>
                    <option value="공지사항">공지사항</option>
                </select>
            </div>
            <div>
                <input type="hidden" value="${article.writer }">
                작성자: ${article.writer }<br/>
            </div>
            <div class="title">
                제목: <input type="text" name="title" value="${article.title }"/><br />
                <!-- 작성자: <input type="text" name="writer"/><br /> -->
            </div>
            <div class="text">
                <div>내용: </div>
                <textarea name="content" cols="30" rows="10">${article.contentModify }</textarea><br />
            </div>
		    <div class="file">
			    <label >Choose file </label>
			    <input type="file" name="file"  alt="${pageContext.request.contextPath}/upload/${article.fileName}">
			</div>
			<div class="button">
			    <input type="submit" class="btn btn-success"/>
			    <a class="btn btn-light" onclick="modifyContentAction()">취소</a>
			</div>
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