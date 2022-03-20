let index={
	init:function(){
		$("#btn-save").on("click", ()=>{
			if(check==true){
			if(this.checkAll()==true)
			 {this.save();}}
			else{ 
			 alert("아이디 중복체크를 해 주십시오.")
			 }
						
		});
		$("#btn-update").on("click", ()=>{
			this.update();
		});
		$("#btn-pwupdate").on("click", ()=>{
			if(this.checkPw()==true){
			this.pwupdate();};
			
		});		

	},
	save:function(){
			
		let data={
			mid: $("#mid").val(),
			memail: $("#memail").val(),
			mpassword: $("#mpassword").val(),
			mnickname: $("#mnickname").val(),
			mphone:$("#mphone").val(),
			mbirth:$("#mbirth").val()
		};

		$.ajax({
			type: "POST",
			url: "/common/signProc",
			data: JSON.stringify(data), 
			contentType:"application/json; charset=utf-8", 
			dataType: "json" 
		//회원 가입 수행
		}).done(function(resp){
			alert("회원가입이 완료되었습니다.");
			console.log(resp);
			location.href="/today";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	update:function(){
		let data={
			mnum: $("#mnum").val(),
			mid: $("#mid").val(),
			memail:$("#memail").val(),
			mnickname: $("#mnickname").val(),
			mphone: $("#mphone").val(),
			mbirth: $("#mbirth").val()		
		};

		$.ajax({
			type: "PUT",
			url: "/user",
			data: JSON.stringify(data), 
			contentType:"application/json; charset=utf-8", 
			dataType: "json" 
		//회원 수정 수행
		}).done(function(resp){
			alert("회원수정이 완료되었습니다.");
			console.log(resp);
			location.href="/today";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	pwupdate:function(){
		let data={
			mnum: $("#mnum").val(),
			mid:$("#mid").val(),			
			mpassword: $("#mpassword").val()
		};

		$.ajax({
			type: "PUT",
			url: "/user/password",
			data: JSON.stringify(data), 
			contentType:"application/json; charset=utf-8", 
			dataType: "json" 
		//회원 가입 수행
		}).done(function(resp){
			alert("비밀번호 수정이 완료되었습니다.");
			console.log(resp);
			location.href="/today";
		}).fail(function(error){
			alert($("#mid").val());		
			alert($("#mnum").val());
			alert($("#mpassword").val());
			alert(JSON.stringify(error));
		});
	},
	
	checkAll:function(){
		if (!checkUserId(form.userId.value)) {
			return false;
		} else if (!checkPassword(form.userId.value, form.password1.value, form.password2.value)) {
			return false;
		} else if (!checkMail(form.mail.value)) {
			return false;
		} else if (!checkName(form.nickname.value)) {
			return false;
		} 
			return true;
	

		function checkExistData(value, dataName) {
			if (value == "") {
				alert(dataName + " 입력해주세요!");
				return false;
			}
			return true;
		}
		function checkUserId(id) {
			//Id가 입력되었는지 확인하기
			if (!checkExistData(id, "아이디를")) 
				return false;
                
			var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
		
			if (!idRegExp.test(id)) {
				alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				form.userId.value = "";
				form.userId.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkPassword(id, password1, password2) {
			//비밀번호가 입력되었는지 확인하기
			if (!checkExistData(password1, "비밀번호를")) 
			return false;
                
			//비밀번호 확인이 입력되었는지 확인하기
			if (!checkExistData(password2, "비밀번호 확인을")) 
				return false;
			
			var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
			if (!password1RegExp.test(password1)) {
				alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				form.password1.value = "";
				form.password1.focus();
				return false;
			}
			//비밀번호와 비밀번호 확인이 맞지 않다면..
			if (password1 != password2) {
				alert("두 비밀번호가 맞지 않습니다.");
				form.password1.value = "";
				form.password2.value = "";
				form.password2.focus();
				return false;
			}

			//아이디와 비밀번호가 같을 때..
			if (id == password1) {
				alert("아이디와 비밀번호는 같을 수 없습니다!");
				form.password1.value = "";
				form.password2.value = "";
				form.password2.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkMail(mail) {
			//mail이 입력되었는지 확인하기
			if (!checkExistData(mail, "이메일을"))
				return false;

			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		
			if (!emailRegExp.test(mail)) {
				alert("이메일 형식이 올바르지 않습니다!");
				form.mail.value = "";
				form.mail.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkName(nickname) {
			if (!checkExistData(nickname, "이름을")) 
				return false;

			var nameRegExp = /^[가-힣]{2,4}$/;
		
			if (!nameRegExp.test(nickname)) {
				alert("이름이 올바르지 않습니다.");
				return false;
			}
			return true; //확인이 완료되었을 때
		}
		
		

	},
	
  	checkPw:function(){
		if (!checkPassword(form.userId.value, form.password1.value, form.password2.value)) {
			return false;
		}
			return true;

		function checkExistData(value, dataName) {
			if (value == "") {
				alert(dataName + " 입력해주세요!");
				return false;
			}
			return true;
		}
		function checkPassword(id, password1, password2) {
			//비밀번호가 입력되었는지 확인하기
			if (!checkExistData(password1, "비밀번호를")) 
			return false;
                
			//비밀번호 확인이 입력되었는지 확인하기
			if (!checkExistData(password2, "비밀번호 확인을")) 
				return false;
			
			var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
			if (!password1RegExp.test(password1)) {
				alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				form.password1.value = "";
				form.password1.focus();
				return false;
			}
			//비밀번호와 비밀번호 확인이 맞지 않다면..
			if (password1 != password2) {
				alert("두 비밀번호가 맞지 않습니다.");
				form.password1.value = "";
				form.password2.value = "";
				form.password2.focus();
				return false;
			}

			//아이디와 비밀번호가 같을 때..
			if (id == password1) {
				alert("아이디와 비밀번호는 같을 수 없습니다!");
				form.password1.value = "";
				form.password2.value = "";
				form.password2.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

	}

}

index.init();
