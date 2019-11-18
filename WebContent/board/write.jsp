<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<script src="${pageContext.request.contextPath}/static/js/write.js"></script>
<t:genericpage>
    <jsp:attribute name="head">
        <title>write.jsp</title>
    </jsp:attribute>
    <jsp:attribute name="header">
        <!-- 머릿말 추가 -->
    </jsp:attribute>
    <jsp:attribute name="footer">
        <!-- 꼬릿말 추가 -->
    </jsp:attribute>
    
    <jsp:body>
    	<c:if test="${empty requestScope.message}">
            <div>${requestScope.message }</div>
            <a href="${pageContext.request.contextPath}/user/login.do">돌아가기</a>
        </c:if>
        <c:if test="${not empty ID }">
			<form action="insert.do" method="post" onsubmit="return formCheck();">
			    제목: <input type="text" name="title"/><br />
			    작성자: ${sessionScope.member.id}<br />
			<!-- 작성자: <input type="text" name="writer"/><br />  -->
			<!-- 날짜: <input type="text" name="regdate"/><br />  -->
			    내용: <br>
			    <textarea name="content" cols="30" rows="10"></textarea><br />
			    <input type="submit"/>
			</form>
		    <a href="list.do">돌아가기</a>
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
    </jsp:body>
</t:genericpage>
