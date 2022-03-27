<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<form name="form">
		<div class="form-group">
			<label for="mid">Username:</label> 
			<input type="text" class="form-control" placeholder="Enter password" id="mid" maxlength="50px" name="userId">
			<input type="button" onclick="id_check(event)" value="중복확인">
			<span id="id_check_alert" style="color: red;"> 중복확인 안됨</span>
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" id="mpassword" name="password1">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" name="password2">
		</div>
		<div class="form-group">
			<label for="memail">Emial:</label> <input type="email" class="form-control" placeholder="Enter Email" id="memail" name="mail">

		</div>
		<div class="form-group">
			<label for="mnickname">닉네임:</label> <input type="text" class="form-control" placeholder="Enter nickname" id="mnickname" name="nickname">

		</div>
		<div class="form-group">
			<label for="mphone">전화번호:</label> <input type="text" class="form-control" placeholder="Enter phoneNumber" id="mphone" name="phone">

		</div>
		<div class="form-group">
			<label for="mbirth">생년월일:</label> <input type="text" class="form-control" placeholder="Enter birthday" id="mbirth" name="birth">
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입하기</button>
</div>
<script>
//중복 회원 가입 
			//회원 중복 체크
			let check = false;
			async function id_check(e){
			e.preventDefault();
			console.log(1);
				var mid = $('#mid').val();
				/* alert(problem_id); */

				if (mid == "") {
					return false;
				}

				await
				$.ajax({
					url : "idcheck.do",
					type : "POST",
					data : {
					"mid" : mid
					},
						success : function(data) {
						// 있는 문제
							if (data.flag) {
								alert("이미 등록된 ID입니다.");
								$("#id_check_alert").html("이미 등록된 ID입니다.");
								$("#id_check_alert").css("color", "red");
								mid.value = "";
								check = false;
								console.log(2);
								console.log(check);
								
							}
						// 없는 문제
							else {
								alert("등록 가능한 ID입니다.");
								$("#id_check_alert").html("중복확인 완료");
								$("#id_check_alert").css("color", "#7BC379");
								check = true;
								console.log(3);
								console.log(check);
								
							}	
							console.log(4);
							console.log(check);
							console.log("checkDuplicating success!");
						},
						error : function() { /* 404, 415, 400등 이런 에러 발생 시 실행 */
						console.log("checkDuplicating error!");
						console.log(5);
						console.log(check);
	
						}
				});
					console.log(6);
					console.log(check);
				
			}
			console.log(7);
			console.log(check);
			
			
			
</script>
<script src="/js/user.js"></script>
	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->
