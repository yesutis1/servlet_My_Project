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