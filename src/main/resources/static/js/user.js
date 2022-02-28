let index={
	init:function(){
		$("#btn-save").on("click", ()=>{
			this.save();
		});

	},
	save:function(){
		let data={
			memail: $("#memail").val(),
			mpassword: $("#mpassword").val(),
			mnickname: $("#memail").val(),
			mphone:$("#mphone").val()	,
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
	}
}

index.init();
