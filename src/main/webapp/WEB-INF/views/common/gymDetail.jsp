<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link	href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap"	rel="stylesheet">


<!-- Css Styles -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/flaticon.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/barfiller.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/magnific-popup.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/slicknav.min.css"	type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/style2.css" type="text/css">
<!-- 별점라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
      #gympage1 {
        margin-top: 50px;
        border-bottom: 1px solid #cccccc;
        padding-bottom: 50px;
      }
      .gym-img {
        width: 400px;
        height: 400px;
        border: 1px solid #cccc;

      }
      #gympage2 {
        margin-top: 50px;
        padding-bottom: 50px;
      }
      #gympage1 h1{
      	color: white;
      }
      #gympage1 h2{
      	color: white;
      }
      #gympage1 h3{
      	color: white;
      }
      #gympage1 p{
      	color:lime;
      }
      #gympage2 h2{
      	color:white;
      }
      select {
           width: 400px; /* 원하는 너비설정 */ 
           padding: .8em .5em; /* 여백으로 높이 설정 */ 
           font-family: inherit; /* 폰트 상속 */ 
           background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
           border: 1px solid #999; 
           border-radius: 0px; /* iOS 둥근모서리 제거 */ 
           -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
           -moz-appearance: none; appearance: none;
           color: white;
         }
        button{
            width: 400px;
        } 
      option{
      	color: black;
      }
 .nav-tabs {
  border-bottom: 1px solid #dee2e6; }
  .nav-tabs .nav-item {
    margin-bottom: -1px; }
  .nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: 0.25rem;
    border-top-right-radius: 0.25rem; }
    .nav-tabs .nav-link:hover, .nav-tabs .nav-link:focus {
      border-color: #e9ecef #e9ecef #dee2e6; }
    .nav-tabs .nav-link.disabled {
      color: #6c757d;
      background-color: transparent;
      border-color: transparent; }
  .nav-tabs .nav-link.active,
  .nav-tabs .nav-item.show .nav-link {
    color: #495057;
    background-color: #fff;
    border-color: #dee2e6 #dee2e6 #fff; }
  .nav-tabs .dropdown-menu {
    margin-top: -1px;
    border-top-left-radius: 0;
    border-top-right-radius: 0; }

.nav-pills .nav-link {
  border-radius: 0.25rem; }

.nav-pills .nav-link.active,
.nav-pills .show > .nav-link {
  color: #fff;
  background-color: #007bff; }

.nav-fill .nav-item {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  text-align: center; }

.nav-justified .nav-item {
  -ms-flex-preferred-size: 0;
  flex-basis: 0;
  -webkit-box-flex: 1;
  -ms-flex-positive: 1;
  flex-grow: 1;
  text-align: center; }

.tab-content > .tab-pane {
  display: none; }

.tab-content > .active {
  display: block; }
.card-img-top{
	width: 100px;
	height: 250px;
	
}
.card{
	margin: 10px;
}
    </style>


<title>시설상세</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
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
		<div class="canvas-search search-switch">
			<i class="fa fa-search"></i>
		</div>
		<nav class="canvas-menu mobile-menu">
			<ul>
				
							<li class="active"><a href="./index.html">Home</a></li>
							<li><a href="./services.html">mypage</a></li>
							<li><a href="./team.html">찜</a></li>
							<li><a href="./services.html">지도</a></li>
							<li><a href="./team.html">시설찾기</a></li>

						
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-youtube-play"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="500">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath}/today">Home</a></li>
							<li><a href="/user/myTicket">mypage</a></li>
							<li><a href="/user/wishlist">찜</a></li>
							<li><a href="./services.html">지도</a></li>
							<li><a href="/common/gymlist">시설찾기</a></li>
							<li><a href="./common/adminPage">AdminPage</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">
						<div class="to-search search-switch">
							<i class="fa fa-search"></i>
						</div>
						<div class="to-social">
							<a href="#">로그인</a> <a href="#">회원가입</a>

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

	
	<section class="classes-section spad">
	<!--시설 상세시작-->
    <div class="container" id="gympage1">
      <div class="row">
        <div class="col-md-5">
          <img class="gym-img" src="${pageContext.request.contextPath}/img/classes/class-3.jpg" alt="" />
        </div>
        <div class="col-md-7">
          <h1>${gym.gname}</h1>
          <br/>
          <h2>평점</h2>
          <br/>
          <h3>${gym.gadress}</h3>
          <br/>
          <h3>${gym.gphone}</h3>
          <br/>
          <select name="order" id="order">
          <c:forEach items="${ticketList}" var="ticket">
            <option value="${ticket.tknum}">${ticket.tname}</option>
          </c:forEach>
        </select><br>
          <br/>
          <button type="button" id="insertWish" class="btn btn-primary">찜하기</button>
        </div>
      </div>
    </div>
    <div class="container" id="gympage2">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-md-12 pills">
                        <div class="bd-example bd-example-tabs">
                          <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                            <li class="nav-item">
                              <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">헬스장 소개</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">트레이너 소개</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
                            </li>
                          </ul>

                          <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
                             <h2>소개</h2>
                             <p>${gym.ginform}</p>
                              <h2>편의시설</h2>
                              <p>${gym.gfacility}</p>
                              <p>${gym.gtime}</p>
                              <p>${gym.gsns}</p>
                            </div>                            

                            <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                             <div class="container row">
                              <div class="card" style="width:400px">
                                <img class="card-img-top" src="${pageContext.request.contextPath}/img/classes/class-details/trainer-profile.jpg" alt="Card image" style="width:100%">
                                <div class="card-body">
                                  <h4 class="card-title">Jane Doe</h4>
                                  <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                  
                                </div>
                              </div>
                              <div class="card" style="width:400px">
                                <img class="card-img-top" src="${pageContext.request.contextPath}/img/classes/class-details/trainer-profile.jpg" alt="Card image" style="width:100%">
                                <div class="card-body">
                                  <h4 class="card-title">Jane Doe</h4>
                                  <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                  
                                </div>
                              </div>
                             
                            </div>
                            </div>

                            <!-- 리뷰 -->
                           <div class="tab-pane border fade"  id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                       	 	<div class="d-flex justify-content-center">
    						<div class="content text-center">
       						 <div class="ratings">
       						 <!-- 평점 나타내는 곳 -->
       						  <span class="product-rating">${gymstar}</span><span>/5</span>
           					 <div class="stars">
           					 <!-- 여기가 평균 별 나타내는 곳 -->
           					 <c:forEach begin="1"  end="${gymstar2}">
           					  <i class="fa fa-star"></i> 
           					  </c:forEach>
           					  </div>
           					 <div class="rating-text"> <span>${totalReiew} reviews</span> </div>
       							 </div>
    							</div>    
							</div>
							<div class="review-list ml-3 mr-2 pt-2" style="background-color:#ebebeb"> 
        							<ul>
          					<li>
            				<div >
            				<c:forEach items="${gymReview}" var="review">              			
             			 <div class="right ml-3 mt-3 r-content">
                		<h4>  ${review.mnickname}  <span class="gig-rating text-body-2">
                    <svg  xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 1792 1792" width="15"  height="15" >
                      <path   fill="currentColor"  d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"
                      ></path>   </svg>${review.grstar}</span> </h4>                
                <div class="review-description">
                  <p>${review.bcontent}</p>
                </div>
                <span class="publish py-3 d-inline-block w-100"><fmt:formatDate value="${review.bdate}" pattern="yyyy/MM/dd"/></span>                
               <!-- 좋아요기능은 이곳에.. -->
              </div>
              </c:forEach>
            </div>
          </li>
        </ul>
      </div>
     
      <nav class="pagination-outer mb-2" aria-label="Page navigation">
     <ul class="pagination justify-content-center text-center">
      <c:if test="${pageMaker.pre}">
		<li class="page-item"><a aria-label="Previous" class="page-link" href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
		<span aria-hidden="true">«</a></span></li>
		</c:if>

		<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
		<c:forEach var="idx" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a aria-label="Next" class="page-link" href="${pageContext.request.contextPath}/common/gymdetail/${gym.gnum}${pageMaker.makeQuery(pageMaker.endPage + 1)}">
							<span aria-hidden="true">»</span> </a></li>
				</c:if>					
		</ul>
  		</nav>
  	
    			</div>
   				 <!-- 리뷰끝 -->
   				     </div>
   
                            </div>
                          </div>
                        </div>
    </div>
    <!--시설 상세 끝-->
	</section>

	





	<!-- Get In Touch Section Begin -->
	<div class="gettouch-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="gt-text">
						<i class="fa fa-map-marker"></i>
						<p>
							333 Middle Winchendon Rd, Rindge,<br /> NH 03461
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="gt-text">
						<i class="fa fa-mobile"></i>
						<ul>
							<li>125-711-811</li>
							<li>125-668-886</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="gt-text email">
						<i class="fa fa-envelope"></i>
						<p>Support.gymcenter@gmail.com</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Get In Touch Section End -->

	<!-- Footer Section Begin -->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="fs-about">
						<div class="fa-logo">
							<a href="#"><img src="img/logo.png" alt=""></a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua
							endisse ultrices gravida lorem.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa  fa-envelope-o"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>Useful links</h4>
						<ul>
							<li><a href="#">About</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Classes</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="fs-widget">
						<h4>Support</h4>
						<ul>
							<li><a href="#">Login</a></li>
							<li><a href="#">My account</a></li>
							<li><a href="#">Subscribe</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="fs-widget">
						<h4>Tips & Guides</h4>
						<div class="fw-recent">
							<h6>
								<a href="#">Physical fitness may help prevent depression,
									anxiety</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">Fitness: The best exercise to lose belly fat and
									tone up...</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="copyright-text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>		
</body>
<script>
$(document).ready(function(){	
	check();
	
	
	$("#insertWish").on("click",function(e){
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
		console.log("장바구니 추가 버튼 누르는 중..");
		
		let login = "${principal.username}";
		
		if(login == ""){
			if(confirm("로그인이 필요합니다.")){
				 location.href = "/common/login";				
			}
		}else{
			
			let ticketNumber =$("#order option:selected").val();
			console.log(ticketNumber);
			
			$.ajax({
	    		url : "/insertWish/"+ticketNumber,
	    		type : 'POST',
	    		beforeSend : function(xhr){
	    			  xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
	    		},
	    		cache : false,
	    		   success: function (result) {       
	    	           console.log(result);
	    			   
	    			   if(result=="ok"){    	                	 
	    				   alert("찜에 담았습니다.");
	    	                 }     
	    	              },
	    	              error: function (e) {
	    	                  console.log(e);
	    	              }         
	    	       
	    	       });			
			
		}		
		
	});	
	
})
function nolist(){
	
	let htmls ="";
	
	htmls += '<div class = "text-center pb-5">';
	htmls += '<h3 style="color:black;">아직 작성한 리뷰가 없습니다. 리뷰를 작성해주세요</h3>';
	htmls += '</div>'
	
	
	$(".review-list").append(htmls);
}

function check(){
	let checkNum = $(".review-description p").text();
	
	console.log(checkNum);
	
	if(checkNum == ""){
		nolist();
	}
}

</script>



</html>