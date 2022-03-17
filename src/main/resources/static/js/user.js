let index={
	init:function(){
		$("#btn-save").on("click", ()=>{
			this.save();
		});
		$("#btn-update").on("click", ()=>{
			this.update();
		});
		$("#btn-pwupdate").on("click", ()=>{
			this.pwupdate();
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
			mpassword: $("#mpassword").val()
		};

		$.ajax({
			type: "PUT",
			url: "/user/mpassword",
			data: JSON.stringify(data), 
			contentType:"application/json; charset=utf-8", 
			dataType: "json" 
		//회원 가입 수행
		}).done(function(resp){
			alert("비밀번호 수정이 완료되었습니다.");
			console.log(resp);
			location.href="/today";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
}

index.init();
