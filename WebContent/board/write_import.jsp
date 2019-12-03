<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<c:if test="${empty ID }">
	<div>로그인후 이용 가능합니다.</div>
</c:if>
<c:if test="${not empty ID }">
	<form action="insert.do" method="post" onsubmit="return formCheck();"
		enctype="multipart/form-data">
		<div class="category">
			카테고리 : 
			<select name="category" class="custom-select custom-select-sm">
				<option value="일반">일반</option>
				<option value="가입인사">가입인사</option>
				<option value="공지사항">공지사항</option>
			</select>
		</div>
		<div class="title">
			제목 : <input type="text" name="title" />
		</div>
		<div class="writer">작성자 : ${sessionScope.member.id}</div>
		<!-- 작성자: <input type="text" name="writer"/><br />  -->
		<!-- 날짜: <input type="text" name="regdate"/><br />  -->
		<div class="text">
			<div>내용:</div>
			<textarea name="content" cols="75" rows="20"></textarea>
			<br />
		</div>
		
		<!-- bootstrap -->
		<div class="file">
		    <label >Choose file </label>
		    <input type="file" name="file">
		</div>
		<!-- bootstrap -->
		
		<div class="button">
			<!-- bootstrap -->
			<input type="submit" class="btn btn-success"/>
			<button type="button" id="writeCancelButton" class="btn btn-light">취소</button>
		</div>
	</form>
</c:if>
<script src="${pageContext.request.contextPath}/static/js/write.js"></script>
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
	        //if(writer == null || writer == ""){
	        //    alert("작성자를 입력하세요");
	        //    myForm.writer.focus();
	        //    return false;
	        //}
	        //if(regdate == null || regdate == ""){
	        //    alert("날짜를 입력하세요");
	        //   myForm.regdate.focus();
	        //    return false;
	        //}
	        if(content == null || content == ""){
	            alert("내용을 입력하세요");
	            myForm.content.focus();
	            return false;
	        }
	    }
	</script>