	<!-- Login model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<div class="container" style="width: 50%">
				<form:form action="/common/loginProc" method="post">
					<div class="form-group">
						<label for="mid" style="color: white">Username:</label> <input type="text" name="mid" class="form-control" placeholder="Enter Username" id="mid">
					</div>
					<div class="form-group">
						<label for="mpassword" style="color: white">Password:</label> <input type="password" name="mpassword" class="form-control" placeholder="Enter password" id="mpassword">
					</div>

					<button id="btn-login" class="btn btn-dark" style="color: white">Log-In</button>
					<a href="/oauth2/authorization/kakao"> <img height="38px" src="/img/kakao_login_button3.png" /></a> <a href="/oauth2/authorization/google"><img height="38px"
						src="/img/google_login_button2.png"></a> <a href="/oauth2/authorization/naver"><img height="38px" src="/img/naver_login_button.png"></a>
				</form:form>

			</div>
		</div>
	</div>
	<!-- Login model end -->
