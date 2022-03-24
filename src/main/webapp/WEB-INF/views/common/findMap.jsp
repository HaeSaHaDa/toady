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

<script type="text/javascript"   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe8a7303194945138622f04ab6f2e5b3&libraries=services"></script>


<%@ include file="../layout/head_tags.jsp"%>


<title>Insert title here</title>
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
               <span class="userinfo" style="color: white"> <a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
               </a>
               </span>
               <span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
               </a>
               </span>
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
               <div class="logo"  style="margin-top:-60px">
                  <a href="${pageContext.request.contextPath}/today">  <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
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

                  <div class="to-social">
                     <c:choose>
                        <c:when test="${empty principal}">
                           <span class="to-search search-switch"> <i class="fa fa-sign-in">Log In</i>
                           </span>
                           <span class="signUp" style="color: white; margin-right: 20px"> <a href="${pageContext.request.contextPath}/common/signup"> <i class="fa fa-user-plus">Sign Up</i>
                           </a>
                           </span>
                        </c:when>
                        <c:otherwise>
                           <span class="userinfo" style="color: white"> <a href="${pageContext.request.contextPath}/user/memberInfo"> <i class="fa fa-user-secret">UserInfo</i>
                           </a>
                           </span>
                           <span class="logout" style="color: white; margin-right: 20px"> <a href="/logout"> <i class="fa fa-sign-out">Log Out</i>
                           </a>
                           </span>
                           <a class="nav-link" style="color: white" >${principal.user.memail}</a>
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
   <!--  Section Begin -->
   <section class="classes-section spad">
      <div class="container" style="padding-bottom: 300px; margin-top: 50px;">
         <!--마이페이지 내용물 시작-->
   <!-- find map-->
   <section class="classes-section spad">
      <div class="container">
         <div class="row">

               
            <div class="col-12">
               <div class="text-center mb-5">
                  <h2 style="color: white;">지도에서 찾기</h2>
               </div>
               <div class="container">
                  <div class="row">
                     <!-- 실제 지도맵 들어가는 자리입니다. -->
                     <div id="map1" style="width: 100%; height: 600px;">
                     
                     
                     </div>                     

                     
<script>          
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
mapOption = {
    center : new kakao.maps.LatLng(37.478864,
          126.8787819), // 위도 경도 순으로 입력하세요.
    level : 3
 // 지도의 확대 레벨
 };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//주소-좌표 변환 객체를 생성합니다
var geocoder1 = new kakao.maps.services.Geocoder();  

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds(); 


    function getMapList() {
    	

        var url = "/getAddres";

        $.ajax({
            type: 'POST',
            url: "/getAddres",
            cache: false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
            dataType: 'json',// 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
            success: function (result) {
                console.log(result[0].gaddress + "...........");
                
                $(result).each(function (index,item) {
                    console.log(item.gaddress + "...........");
                    // 주소로 좌표를 검색합니다
                    geocoder1.addressSearch(item.gaddress, function (rs, status) {

                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {
                            console.log("되따!!");
                            var coords = new kakao.maps.LatLng(rs[0].y, rs[0].x);

                            console.log(coords + ".........")

                            marker = new kakao.maps.Marker({ position : coords });
   							marker.setMap(map);
                            
   						// LatLngBounds 객체에 좌표를 추가합니다
   						    bounds.extend(coords); 
   						
   						let htmls = '<div style="width:150px;text-align:center;padding:6px 0;">'+item.gname+'</div>';
   						
   						// 마커에 표시할 인포윈도우를 생성합니다 
                            var infowindow = new kakao.maps.InfoWindow(
                                  {
                                     content : htmls
                                  // 인포윈도우에 표시할 내용
                                  });

                            kakao.maps.event.addListener(marker,
                                  'mouseover', makeOverListener(map,
                                        marker, infowindow));
                            kakao.maps.event.addListener(marker,
                                  'mouseout',
                                  makeOutListener(infowindow));      
					
   						
                        }
                    });

                }); //each end    
            },error : function(e) {
				console.log(e);
			}

        })
     
       
    } 
 getMapList();
 function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
 
 function makeOverListener(map, marker,
			infowindow) {
		return function() {
			infowindow.open(map, marker);
		};
	}
	function makeOutListener(infowindow) {
		return function() {
			infowindow.close();
		};
	}
</script>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </section>
   <!-- find map end -->
















               <!-- 마이페이지 내용물 끝 -->

            </div>
         </section>
         <!-- Get In Touch Section Begin -->

         <!-- Footer Section Begin -->
         <section class="footer-section">
            <div class="container">
               <div class="row">
                  <div class="col-lg-4">
                     <div class="fs-about">
                        <div class="fa-logo">
                           <a href="#"><img src="/img/logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua endisse ultrices gravida lorem.</p>
                        <div class="fa-social">
                           <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
                           <a href="#"><i class="fa  fa-envelope-o"></i></a>
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
      </div>


      <!-- Login model Begin -->
      <%@ include file="../layout/login_model.jsp"%>
      <!-- Login model end -->

      <!-- Js Plugins -->
      <%@ include file="../layout/foot_tags.jsp"%>
</body>

</html>