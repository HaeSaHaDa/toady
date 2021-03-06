<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<%@ include file="../layout/head_tags.jsp"%>

<!-- 별점라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>마이페이지</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');
 @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

.ticket {
        width: 400px;
        height: 240px;
        border: 1px solid #cccc;
        border-radius: 30px 30px;
        margin-top: 5px;
        background-color: white;
        margin-left: 100px;
      }
      .first {
        display: flex;
        line-height: 2;
        margin-top: 10px;
        margin-bottom: 10px;
      }
      .first p:first-child {
        margin-right: 100px;
        margin-left: 30px;
      }
      .first p:nth-child(2) {
        margin-right: 20px;
      }
      .second {

        margin-left: 30px;
        line-height: 8px;
      }
      .gogym p{
        color: rgb(39, 129, 107);
        text-decoration: none;
        text-shadow: 0 0 24px;
      }
      .last {
        display: flex;
      }
      @import url(https://fonts.googleapis.com/css?family=BenchNine:700);
	
	.goback{
		background-color: #50586C;
        border: none;
        color: #ffffff;
        cursor: pointer;
        display: inline-block;
        font-family: "BenchNine", Arial, sans-serif;
        font-size: 1em;
        font-size: 10px;
        outline: none;
        padding: 12px 30px 10px;
        position: relative;
        text-transform: uppercase;
        margin-left: 25px;
        margin-bottom: 30px;
	}
		
      .goRivew{
        background-color: #c47135;
        border: none;
        color: #ffffff;
        cursor: pointer;
        display: inline-block;
        font-family: "BenchNine", Arial, sans-serif;
        font-size: 1em;
        font-size: 10px;
        outline: none;
        padding: 12px 30px 10px;
        position: relative;
        text-transform: uppercase;
        margin-left: 50px;
        margin-bottom: 30px;
      }
      .goRivew:before,
      .goRivew:after {
        border-color: transparent;
        -webkit-transition: all 0.25s;
        transition: all 0.25s;
        border-style: solid;
        border-width: 0;
        content: "";
        height: 24px;
        position: absolute;
        width: 24px;
      }
      .goRivew:before {
        border-color: #c47135;
        border-right-width: 2px;
        border-top-width: 2px;
        right: -5px;
        top: -5px;
      }
      .goRivew:after {
        border-bottom-width: 2px;
        border-color: #c47135;
        border-left-width: 2px;
        bottom: -5px;
        left: -5px;
      }
      .goRivew:hover,
      .goRivew.hover {
        background-color: #c47135;
      }
      .goRivew:hover:before,
      .goRivew.hover:before,
      .goRivew:hover:after,
      .goRivew.hover:after {
        height: 100%;
        width: 100%;
      }
.cross {
    padding: 10px;
    color: #d6312d;
    cursor: pointer;
    font-size: 23px
}

.cross i {
    margin-top: -5px;
    cursor: pointer
}

.comment-box {
    padding: 5px
}

.comment-area textarea {
    resize: none;
    border: 1px solid #ff0000
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #ffffff;
    outline: 0;
    box-shadow: 0 0 0 1px rgb(255, 0, 0) !important
}

.send {
    color: #fff;
    background-color: #ff0000;
    border-color: #ff0000
}

.send:hover {
    color: #fff;
    background-color: #f50202;
    border-color: #f50202
}

.rating {
    display: inline-flex;
    margin-top: -10px;
    flex-direction: row-reverse
}

.rating>input {
    display: none
}

.rating>label {
    position: relative;
    width: 28px;
    font-size: 35px;
    color: #ff0000;
    cursor: pointer
}

.rating>label::before {
    content: "\2605";
    position: absolute;
    opacity: 0
}

.rating>label:hover:before,
.rating>label:hover~label:before {
    opacity: 1 !important
}

 .rating>input:checked~label:before {
    opacity: 1
}

.comment-box .rating:hover>input:checked~label:before {
    opacity: 0.4
}



<!--페이지버튼-->
.pagination-outer{ text-align: center; }
.pagination{
    font-family: 'Ubuntu', sans-serif;
    display: inline-flex;
    position: relative;
}
.pagination li a.page-link{
    color: #fff;
    background-color: #333;
    font-size: 20px;
    font-weight: 500;
    line-height: 39px;
    height: 40px;
    width: 40px;
    padding: 0;
    margin: 0 5px;
    border: none;
    border-radius: 7px;
    overflow: hidden;
    position: relative;
    z-index: 1;
    transition: all 0.3s ease 0s;
}
.pagination li a.page-link:hover,
.pagination li a.page-link:focus,
.pagination li.active a.page-link:hover,
.pagination li.active a.page-link{
    color: #fff;
    background: #2ecc71;
}
.pagination li a.page-link:before,
.pagination li a.page-link:after{
    content: '';
    background: #555;
    height: 100%;
    width: 7px;
    border-radius: 10px 0 0 10px;
    opacity: 1;
    position: absolute;
    left: 0;
    top: 0;
    z-index: -1;
    transition: all 0.4s ease 0s;
}
.pagination li a.page-link:after{
    border-radius: 0 10px 10px 0;
    left: auto;
    right: 0;
    top: auto;
    bottom: 0;
}
.pagination li a.page-link:hover:before,
.pagination li a.page-link:focus:before,
.pagination li.active a.page-link:before{
    background-color: #27ae60;
    border-radius: 10px 10px 0 0;
    width: 100%;
    height: 7px;
}
.pagination li a.page-link:hover:after,
.pagination li a.page-link:focus:after,
.pagination li.active a.page-link:after{
    background-color: #27ae60;
    border-radius: 0 0 10px 10px;
    width: 100%;
    height: 7px;
}
@media only screen and (max-width: 480px){
    .pagination{
        font-size: 0;
        border: none;
        display: inline-block;
    }
    .pagination li{
        display: inline-block;
        vertical-align: top;
        margin: 0 0 10px;
    }
}


<!---->
div.stars {
    width: 270px;
    display: inline-block;
}

.mt-200 {
    margin-top: 30px;
}

input.star {
    display: none;
}

label.star {
    float: right;
    padding: 10px;
    font-size: 36px;
    color: #4A148C;
    transition: all .2s;
}

input.star:checked~label.star:before {
    content: '\f005';
    color: #FD4;
    transition: all .25s;
}

input.star-5:checked~label.star:before {
    color: #FE7;
    text-shadow: 0 0 20px #952;
}

input.star-1:checked~label.star:before {
    color: #F62;
}

label.star:hover {
    transform: rotate(-15deg) scale(1.3);
}

label.star:before {
    content: '\f006';
    font-family: FontAwesome;
}
</style>

</head>


<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="fa fa-close"></i>
		</div>

		<nav class="canvas-menu mobile-menu">

			<!-- 메뉴 바  -->
			<%@ include file="../layout/menu_bar.jsp"%>

		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<c:choose>
				<c:when test="${empty principal}">
					<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
					</span>
					<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
					</a>
					</span>


				</c:when>
				<c:otherwise>
					<form:form action="${pageContext.request.contextPath}/user/memberInf">
						<button style="background-color: transparent; border: 0; outline: 0">
							<i class="fa fa-user-secret">UserInfo</i>
						</button>
					</form:form>
					<form:form action="/logout">
						<button style="background-color: transparent; border: 0; outline: 0" url="">
							<i class="fa fa-sign-out">Log Out</i>
						</button>
					</form:form>

					<a class="nav-link">${principal.user.memail}</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo" style="margin-top: -60px">
						<a href="${pageContext.request.contextPath}/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">

						<!-- 메뉴 바  -->
						<%@ include file="../layout/menu_bar.jsp"%>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">

						<div class="to-social" style="margin-left: -20px">
							<c:choose>
								<c:when test="${empty principal}">
									<span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
									</span>
									<span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
									</a>
									</span>

								</c:when>
								<c:otherwise>
									<table>
										<tr>
											<td>
											<form:form action="${pageContext.request.contextPath}/user/memberInf">
											<span class="userinfo" style="color: white; margin-right: 20px"> 
														<button style="background-color: transparent; border: 0; outline: 0;">
															<i class="fa fa-user-secret">UserInfo</i>
														</button>
													</span>
													</form:form>
											</td>

											<td><span class="logout" style="color: white; "> <form:form action="/logout">
														<button style="background-color: transparent; border: 0; outline: 0" url="">
															<i class="fa fa-sign-out">Log Out</i>
														</button>
													</form:form>
											</span></td>
										</tr>
									</table>
									<a class="nav-link">${principal.user.memail}</a>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="canvas-open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header End -->



	<!-- ChoseUs Section End -->

	<!--마이페이지 내용물 시작-->
	<section class="classes-section spad">
		<div class="container" style="padding-bottom: 300px; margin-top: 200px;">
			<div class="row" style="margin-top: 100px;">
				<!-- 사이드바 -->
				<div class="col-3">
					<%@ include file="../layout/user_owner_menu.jsp"%>
				</div>
				<!-- 사이드바 끝 -->
				<!-- 내용물 -->
				<div class="col-9">
					<!-- 내용물 넣을 것 이 div안에 넣으시면 됩니다. -->
					<div class="container ticket-area" style="margin: 0 auto">
						<h3 style="color: white;" class="mb-3">구매한 이용권</h3>
						<c:forEach items="${myTicket}" var="myticket" varStatus="status">
							<div class="ticket">
								<div class="first">
									<input type="hidden" id="payid" value="${myticket.payid}">
									<p class="mr-3 ml-3">
										<fmt:formatDate value="${myticket.orderdate}" pattern="yyyy/MM/dd" />
									</p>
									<p class="mr-3" style="margin-left: 150px;">주문번호</p>
									<p>${myticket.ordernum}</p>
								</div>
								<div class="second">
									<a href="${pageContext.request.contextPath}/common/gymdetail/${myticket.gnum}" class="gogym">
										<p title="헬스장 정보보기">${myticket.gname}</p>
									</a>
									<p>${myticket.tname}<span>${myticket.tdate}개월</span>
									</p>
									<p>
										시작날짜<span><fmt:formatDate value="${myticket.startdate}" pattern="yyyy/MM/dd" /></span>
									</p>
									<div class="last">
									<input type="hidden" class="payid" name="payid" value="${myticket.payid}">
									<input type="hidden" class="ordernum" name="ordernum" value="${myticket.ordernum}">
									<input type="hidden" class="tknum" name="tknum" value="${myticket.tknum}">
										<p>${myticket.cost}원</p>
										<button type="button" class="goRivew" data-toggle="modal" data-target="#form${status.index}">리뷰작성</button>
										<button class="goback">환불하기</button>
									</div>
								</div>
								<div class="modal fade" id="form${status.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="text-right cross">
												<i class="fa fa-times mr-2"></i>
											</div>
											<div class="card-body text-center">
												<img src=" https://i.imgur.com/d2dKtI7.png" height="100" width="100">
												<div class="comment-box text-center">
													<h4>${myticket.gname}의리뷰를남겨주세요!</h4>
													<input type="hidden" id="tknum" value="${myticket.tknum}">
													<div class="container d-flex justify-content-center mt-200">
    												<div class="row">
        											<div class="col-md-12">
            										<div class="stars">
               											<form action="">
                    										 <input class="star star-5" id="star-5${status.index}" value="5" type="radio" name="star" /> 
                     										<label class="star star-5" for="star-5${status.index}"></label> 
                     										<input class="star star-4" id="star-4${status.index}" value="4" type="radio" name="star" /> 
                     										<label class="star star-4" for="star-4${status.index}"></label> 
                     										<input class="star star-3" id="star-3${status.index}" value="3" type="radio" name="star" /> 
                     										<label class="star star-3" for="star-3${status.index}"></label> 
                     										<input class="star star-2" id="star-2${status.index}" value="2" type="radio" name="star" /> 
                     										<label class="star star-2" for="star-2${status.index}"></label> 
                     										<input class="star star-1" id="star-1${status.index}" value="1" type="radio" name="star" /> 
                     										<label class="star star-1" for="star-1${status.index}"></label> 
                     									</form>
           											 </div>
        											</div>
    												</div>
												</div>
													<div class="comment-area">
														<textarea class="form-control" placeholder="what is your view?" rows="4"></textarea>
													</div>
													<div class="text-center mt-4">
														<input type="hidden" id="gnum" value="${myticket.gnum}">
														<button class="btn btn-success send px-5">
															리뷰 작성 <i class="fa fa-long-arrow-right ml-1"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="container">
					<nav class="pagination-outer mb-2" aria-label="Page navigation">
							<ul class="pagination justify-content-center text-center">
									<c:if test="${pageMaker.pre}">
										<li class="page-item"><a aria-label="Previous" class="page-link"
											href="${pageContext.request.contextPath}/user/myTicket/${pageMaker.makeQuery(pageMaker.startPage - 1) }"> <span aria-hidden="true">«</a></span></li>
									</c:if>

								<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
								<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/myTicket/${gym.gnum}${pageMaker.makeQuery(idx)}">${idx}</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a aria-label="Next" class="page-link" href="${pageContext.request.contextPath}/user/myTicket/${gym.gnum}${pageMaker.makeQuery(pageMaker.endPage + 1)}">
											<span aria-hidden="true">»</span>
										</a></li>
										</c:if>
										</ul>
									</nav>
									</div>
					

				</div>
			</div>
		</div>
	</section>
	<!-- 내용물 끝 -->
	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Login model Begin -->
	<%@ include file="../layout/login_model.jsp"%>
	<!-- Login model end -->

	<!-- Js Plugins -->
	<%@ include file="../layout/foot_tags.jsp"%>



</body>

<script>
	$(document).ready(function() {

		checkList();

		$("goRivew").mouseleave(function() {
			$(this).removeClass("hover");
		});

		$(".fa").on("click", function() {
			$('.modal').modal('hide');

		});
		$(".stars").on("change", function() {
			var tmp_value = $('input:radio[name=star]:checked').val();
			console.log(tmp_value);
		});

		$(".send").on("click", function() {
			console.log(this);

			let parent = $(this).parent("div").parent("div");
			let parent2 = parent.parent("div").parent("div");
			let parent3 = parent2.parent("div").parent("div");
			let lastParent = parent3.parent("div");

			let ordernum = Number(lastParent.find("p").eq(2).text());
			let bcontent = parent.find("textarea").val();
			let grstar = $('input:radio[name=star]:checked').val();
			let gnum = Number($(this).parent("div").find("input").val());
			let tknum = Number(parent.parent("div").find("input").val());
			
			console.log(bcontent);
			
			let form = {
				bcontent : bcontent,
				grstar : grstar,
				gnum : gnum,
				ordernum : ordernum,
				tknum : tknum
			}

			console.log(tknum + "..." + ordernum);

			$.ajax({
				type : "POST",
				url : "/insertReview",
				cache : false,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(form),
				success : function(result) {

					if (result == "SUCCESS") {
						closeModal();
						console.log("작성완료");
					} else {
						alert("이미 작성했습니다");
						closeModal();
					}

				},
				error : function(e) {
					console.log(e);
				}
			})

		});
		
		$(".goback").on("click",function(){
	    	  console.log("환불신청버튼누름");
	    	  
	    	  let payid = $(this).parent("div").find(".payid").val();
	    	  console.log("페이아이디......."+payid);
	    	  let ordernum = $(this).parent("div").find(".ordernum").val();
	    	  let tknum = $(this).parent("div").find(".tknum").val();
	    	  
	    	  console.log("페이아이디.."+payid);
	    	  
	    	  let data = {
	    			  payid : payid,
	    			  ordernum : ordernum,
					  tknum : tknum
			  }
	    	   
	    	  console.log(payid+"..."+ordernum);
	    	  
	    	  $.ajax({
		           type : "POST",
		           url : "/insertBack",	               
		           cache : false,
		          	contentType:'application/json; charset=utf-8',
		           data: JSON.stringify(data), 
		           success: function (result) { 	   
                    
		        	   if(result=="ok"){                     
		        		   alert("환불신청완료");
		        	   }else{
		        		   alert("이미 신청하셨습니다.");
		        	   }               
		                                   
		           },
		           error: function (e) {
		               console.log(e);
		               console.log("실패");
		           }
		       })    	  

	});

	})
	function closeModal() {
		$('.modal').modal('hide');
	}

	function checkList() {
		let checkText = $(".ticket p").text();

		if (checkText == "") {
			noTicket();
		}

	}

	function noTicket() {

		let htmls = "";
		htmls += '<h5 class = "mt-5" style="color: white;">구매한 이용권이 없습니다.</h5>';

		$(".ticket-area").append(htmls);
	}
</script>

</html>
