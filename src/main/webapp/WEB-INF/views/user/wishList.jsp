<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%><head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>오늘의 짐</title>
<!-- ajax -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link  rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

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
    <style>
      .shopping-cart {
        padding-top: 80px;
        padding-bottom: 60px;
      }

      .cart-table {
        margin-bottom: 40px;
      }

      .cart-table table {
     	margin-top:80px;
        width: 100%;
        min-width: 480px;
        border: 1px solid #ebebeb;
        background-color:#f8f4ec;
      }

      .cart-table table tr th {
        font-size: 16px;
        color:  #252525;
        font-weight: 700;
        border-bottom: 1px solid #ebebeb;
        text-align: center;
        padding: 18px 15px 25px;
        text-transform: uppercase;
      }

      .cart-table table tr th.p-name {
        text-align: left;
      }

      .cart-table table tr td {
        text-align: center;
        padding-bottom: 34px;
      }

      .cart-table table tr td.first-row {
        padding-top: 30px;
      }

      .cart-table table tr td.cart-pic {
        width: 21%;
      }

      .cart-table table tr td.cart-title {
        text-align: center;
      }

      .cart-table table tr td.cart-title h5 {
        color: #252525;
      }

      .cart-table table tr td.p-price {
        width: 16%;
      }

      .cart-table table tr td.p-price,
      .cart-table table tr td.total-price {
        color: #e7ab3c;
        font-size: 16px;
        font-weight: 700;
      }

      .cart-table table tr td.qua-col {
        width: 16%;
      }

      .cart-table table tr td.qua-col .quantity {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
      }

      .cart-table table tr td.qua-col .pro-qty {
        width: 123px;
        height: 46px;
        border: 2px solid #ebebeb;
        padding: 0 15px;
        float: left;
      }

      .cart-table table tr td.qua-col .pro-qty .qtybtn {
        font-size: 24px;
        color: #b2b2b2;
        float: left;
        line-height: 38px;
        cursor: pointer;
        width: 18px;
      }

      .cart-table table tr td.qua-col .pro-qty .qtybtn.dec {
        font-size: 30px;
      }

      .cart-table table tr td.qua-col .pro-qty input {
        text-align: center;
        width: 52px;
        font-size: 14px;
        font-weight: 700;
        border: none;
        color: #4c4c4c;
        line-height: 40px;
        float: left;
      }

      .cart-table table tr td.total-price {
        width: 12%;
      }

    
      .cart-buttons {
        margin-bottom: 34px;
      }

      .cart-buttons .continue-shop .delete-wishall {
        color: #b2b2b2;
        border: 2px solid #ebebeb;
        background: #ffffff;
        margin-right: 8px;
        padding: 12px 20px 12px 20px;
        margin-bottom: 10px;
      }

      .cart-buttons .up-cart {
        color: #252525;
        background: #f3f3f3;
        border: 2px solid #ebebeb;
        padding: 12px 20px 12px 20px;
      }

      .proceed-checkout ul {
        border: 2px solid #ebebeb;
        background: #f3f3f3;
        padding-left: 25px;
        padding-right: 25px;
        padding-top: 16px;
        padding-bottom: 20px;
      }

      .proceed-checkout ul li {
        list-style: none;
        font-size: 16px;
        font-weight: 700;
        color: #252525;
        text-transform: uppercase;
        overflow: hidden;
      }

      .proceed-checkout ul li.cart-total {
        padding-top: 10px;
      }

      .proceed-checkout ul li.cart-total span {
        color: #e7ab3c;
      }

      .proceed-checkout ul li span {
        float: right;
      }

      .proceed-checkout .proceed-btn {
        font-size: 14px;
        font-weight: 700;
        color: #ffffff;
        background: #252525;
        text-transform: uppercase;
        padding: 15px 25px 14px 25px;
        display: block;
        text-align: center;

      }
      .cart-img{
          width: 170px;
          height: 170px;
      }
   .delete-ticket{
   	cursor: pointer;
   	
   }
      
    </style>

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
				<li><a href="/wishlist">찜</a></li>
				<li><a href="./services.html">지도</a></li>
				<li><a href="/common/gymlist">시설찾기</a></li>


			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="canvas-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
		</div>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo">
						<a href="/today"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="500">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li class="active"><a href="/today">Home</a></li>
							<li><a href="mypage">mypage</a></li>
							<li><a href="/wishlist">찜</a></li>
							<li><a href="./services.html">지도</a></li>
							<li><a href="/common/gymlist">시설찾기</a></li>

						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="top-option">
						<div class="to-search search-switch">
							<i class="fa fa-search"></i>
						</div>
						<div class="to-social">
							<c:choose>
								<c:when test="${empty principal}">
									<ul class="navbar-nav">
										<a href="${pageContext.request.contextPath}/common/login">로그인</a>
										<a href="${pageContext.request.contextPath}/common/signup">회원가입</a>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link" href="#">글쓰기</a></li>
										<li class="nav-item"><a class="nav-link" href="#">회원정보</a></li>
										<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
										<li class="nav-item"><a class="nav-link">${principal.username}님 환영합니다.</a></li>
									</ul>
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

	<!-- Classes Section Begin -->
	<section class="classes-section spad">
		<!-- 찜시작 -->
		    <section class="shopping-cart spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="cart-table">
              <table>
                <thead>
                  <tr>
                    <th>Image</th>
                    <th class="p-name">헬스장</th>
                    <th>이용권</th>
                    <th>가격</th>
                    <th>기간(개월)</th>
                    <th>합계</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tbody> 
                <c:forEach items="${wishList}" var="wish">   
                <div id="wishtable">            
                    <tr id="select">
                    <input type="hidden" id="wishnum" name="wishnum"  value="${wish.wishnum}">
                    <td class="cart-pic first-row">
                    <!-- 여기는 나중에 이미지이름넣기 -->
                      <img class="cart-img" src="img/hero/hero-2.jpg" alt="" />
                    </td>
                    <td class="cart-title first-row">
                      <h5>${wish.gname}</h5>
                    </td>
                    <td class="cart-title first-row"><h5>${wish.tname}</h5></td>
                    <td class="p-price first-row">${wish.tcost}</td>
                    <td class="qua-col first-row">
                        <div class="quantity">
                            <div class="pro-qty">
                                <span class="dec qtybtn">-</span>
                                <input type="text" id="wdate" name="wdate"  value="${wish.wdate}">
                                <span class="inc qtybtn">+</span>
                            </div>
                        </div>
                    </td>
                    </td>
                    <td class="total-price first-row">${wish.tcost}</td>
                    <th><span  class="delete-ticket">X</span></th>
                  </tr>
                  </div> 
              </c:forEach> 
                </tbody>
              </table>
            </div>
            <div class="row">
              <div class="col-lg-4">
                <div class="cart-buttons">
                  <a href="/deletewishall" class="primary-btn .continue-shop">찜 비우기</a>
                  <a href="#" class="primary-btn continue-shop">더 둘러보기</a>
                </div>
              
              </div>
              <div class="col-lg-4 offset-lg-4">
                <div class="proceed-checkout">
                  <ul>
                    <li class="cart-total">Total <span>${wishPrice}</span></li>
                  </ul>
                  <a href="/user/checkoutpage" class="proceed-btn">결제하기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Shopping Cart Section End -->
		<!-- 찜끝 -->
	</section>
	<!-- ChoseUs Section End -->





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
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua endisse ultrices gravida lorem.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a
								href="#"><i class="fa  fa-envelope-o"></i></a>
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
								<a href="#">Physical fitness may help prevent depression, anxiety</a>
							</h6>
							<ul>
								<li>3 min read</li>
								<li>20 Comment</li>
							</ul>
						</div>
						<div class="fw-recent">
							<h6>
								<a href="#">Fitness: The best exercise to lose belly fat and tone up...</a>
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
							All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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

<script>


$(document).ready(function(){	
	//<div class="cart-table">	
	
	check();
	
	
    $(".dec").on("click",function(e){
        var thisRow = $(this).closest('tr');
        console.log(thisRow.find('td:eq(3)').text());

        console.log($(this).parent("div").find("input").val());
        let tdate = $(this).parent("div").find("input").val();
        if(tdate > 1){
	    $(this).parent("div").find("input").val(--tdate);

        let coast = thisRow.find('td:eq(3)').text();
        console.log(Number(tdate)*Number(coast));
        let total = Number(tdate)*Number(coast);
        thisRow.find('td:eq(5)').text(total);
   
    }

    });
    $(".inc").on("click",function(e){
     var thisRow = $(this).closest('tr');
    console.log(thisRow.find('td:eq(3)').text());

    console.log($(this).parent("div").find("input").val());
    let tdate = $(this).parent("div").find("input").val();
    $(this).parent("div").find("input").val(++tdate);
        
    let coast = thisRow.find('td:eq(3)').text();
    console.log(Number(tdate)*Number(coast));
    let total = Number(tdate)*Number(coast);
    thisRow.find('td:eq(5)').text(total);

    });

    $(".qtybtn").on("click",function(e){
       getTotal();
       
       var thisRow = $(this).closest('tr');
       //수량 업데이트 중
       var token = $("meta[name='_csrf']").attr("content");
       var header = $("meta[name='_csrf_header']").attr("content");
       
       let wishNum = thisRow.find('[name=wishnum]').val();
       let tval = thisRow.find('[name=wdate]').val();
       console.log(wishNum,tval);
       
       var form = {
    		 wishnum : wishNum,
    		 wdate : tval
       };
       
       console.log(JSON.stringify(form));
       
       $.ajax({
           type : "POST",
           url : "/updateWish",
           beforeSend : function(xhr){
 			  xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
 		},
           cache : false,
           contentType:'application/json; charset=utf-8',
            data: JSON.stringify(form), 
           success: function (result) {       
             if(result == "SUCCESS"){              
               console.log("업데이트 완료");                            
             }                       
           },
           error: function (e) {
               console.log(e);
           }
       }) 

    });
    /*<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>*/

    $(".delete-ticket").on("click",function(){
       console.log("삭제버튼 누르는 중");
       console.log(this);       
       let ticketnumber = $(this).parents("tr").find("input").val();
       console.log(ticketnumber+"찜번호");
       var trname = $(this).parents("div").find("#select");
       console.log(typeof ticketnumber);
       console.log($(this).parents("tr")+"............");
       var token = $("meta[name='_csrf']").attr("content");
       var header = $("meta[name='_csrf_header']").attr("content");

		console.log(token+","+header);
		let p = $(".cart-total span").text();
		console.log(p);
		
    	$.ajax({
    		url : "/deleteWish/"+ticketnumber,
    		type : 'DELETE',
    		beforeSend : function(xhr){
    			  xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
    		},
    		cache : false,
    		   success: function (result) {       
    	           console.log(result);
    			   
    			   if(result=="ok"){    	                	 
    				   $(trname).remove();  
    				   getTotal();    				  
    	                 }
    			   check();
    			  
    	              },
    	              error: function (e) {
    	                  console.log(e);
    	              }         
    	       
    	       }); 
    	
    	    
    	    });   
 
		    
     
});

function getTotal(){
	console.log("총 가격 넣는중");
    const total = $(".cart-total span").text();
    
     console.log("총가격은 >>"+total);
     

    let arr = $(".total-price").length;

    let arr2 = new Array(arr);
    

     let sum =0;
     
     
     for(let i =0; i<arr;i++){
          arr2[i]=Number($(".total-price").eq(i).text());
          console.log(i+"번째 텍스트"+arr2[i]);
           sum += arr2[i];
       }      

    
    console.log(sum);

    $(".cart-total span").text(sum);
}

function nolist(){
	
	let htmls ="";
	htmls += '<tr>';
	htmls += '<td colspan="7"></td>';
	htmls += '</tr>';
	htmls += '<tr>';
	htmls += '<td colspan="7"><h5>찜한 이용권이 없습니다.</h5></td>';
	htmls += '</tr>';
	htmls += '<tr>';
	htmls += '<td colspan="7"></td>';
	htmls += '</tr>';
	
	$(".cart-table tbody").append(htmls);
}

function check(){
	let checkNum = $(".cart-total span").text();
	
	if(checkNum == 0){
		nolist();
	}
}

</script>


</body>

</html>