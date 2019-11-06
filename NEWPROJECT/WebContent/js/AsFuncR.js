function valid_check()
 {
	if(document.frm2.userid.value=="")
	 {
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.frm2.userid.focus();
		return false;
	 }

	 if(document.frm2.userid.value.length<=3)
	 {
		 alert("아이디는 4자 이상입니다.");
		 document.frm2.userid.focus();
		 return false;
	 }


	 if(document.frm2.usernm.value=="")
	 {
		alert("이름를 입력하여 주시기 바랍니다.");
		document.frm2.usernm.focus();
		return false;
	 }

	 if(document.frm2.passwd1.value=="")
	 {
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.frm2.passwd1.focus();
		return false;
	 }

	 if(document.frm2.passwd1.value!=document.frm2.passwd2.value)
	 {
		 alert("비밀번가 일치하지 않습니다.");
		 document.frm2.passwd1.focus();
		 return false;
	 }

	 if(document.frm2.telno.value=="")
	 {
		 alert("핸드폰 번호를 입력해주세요.");
		 document.frm2.telno.focus();
		 return false;
	 }

	for(var i=0;i<document.frm2.telno.value.length;i++)
	 {

		 if(document.frm2.telno.value.charAt(i)<"0" || document.frm2.telno.value.charAt(i)>"9")
		 {
			 alert("핸드폰번호는 숫자만 가능");
			 document.frm2.telno.focus();
			 return false;
		 }

	 }
	document.frm2.submit();

 }

