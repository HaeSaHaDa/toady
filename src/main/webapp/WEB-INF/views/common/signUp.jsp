<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 불러오는 부분 -->
<%@ include file="../layout/header.jsp"%>
        <script>
            function checkAll() {
                if (!checkUserId(form.id.value)) {
                    return false;
                } else if (!checkPassword(form.id.value, form.password1.value, form.password2.value)) {
                    return false;
                } else if (!checkMail(form.mail.value)) {
                    return false;
                } else if (!checkName(form.nickname.value)) {
                    return false;
                } else if (!checkFavorite()) {
                    return false;
                } 
                return true;
            }
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
                    form
                        .id
                        .focus();
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
                    form
                        .password1
                        .focus();
                    return false;
                }
                //비밀번호와 비밀번호 확인이 맞지 않다면..
                if (password1 != password2) {
                    alert("두 비밀번호가 맞지 않습니다.");
                    form.password1.value = "";
                    form.password2.value = "";
                    form
                        .password2
                        .focus();
                    return false;
                }

                //아이디와 비밀번호가 같을 때..
                if (id == password1) {
                    alert("아이디와 비밀번호는 같을 수 없습니다!");
                    form.password1.value = "";
                    form.password2.value = "";
                    form
                        .password2
                        .focus();
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
                    form
                        .mail
                        .focus();
                    return false;
                }
                return true; //확인이 완료되었을 때
            }


                
        </script>
<div class="container">
	<form>
		<div class="form-group">
			<label for="mid">Username:</label> 
			<input type="text" class="form-control" placeholder="Enter password" id="mid" name="id">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> 
			<input type="password" class="form-control" placeholder="Enter password" id="mpassword" name="password1">
		</div>
		<div class="form-group">
			<label for="password">Password:</label> 
			<input type="password" class="form-control" placeholder="Enter password" id="mpassword" name="password2">
		</div>
		<div class="form-group">
			<label for="memail">Emial:</label> 
			<input type="email" class="form-control" placeholder="Enter Email" id="memail" name="email">
		</div>
		<div class="form-group">
			<label for="mnickname">닉네임:</label> 
			<input type="text" class="form-control" placeholder="Enter nickname" id="mnickname" name="nickname">
		</div>
		<div class="form-group">
			<label for="mphone">전화번호:</label> 
			<input type="text" class="form-control" placeholder="Enter phoneNumber" id="mphone" name="phone">
		</div>
		<div class="form-group">
			<label for="mbirth">생년월일:</label> 
			<input type="text" class="form-control" placeholder="Enter birthday" id="mbirth" name="birth">
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입하기</button>

</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>
