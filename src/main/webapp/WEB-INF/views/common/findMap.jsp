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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css" type="text/css">
<script type="text/javascript"   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe8a7303194945138622f04ab6f2e5b3&libraries=services"></script>


<%@ include file="../layout/head_tags.jsp"%>
<style type="text/css">
.btn{
    color: #fff;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0.25em, transparent 0.25em) center/1em 1.2em;
    font-family: 'Nunito', sans-serif;
    font-size: 20px;
    font-weight: 700;
    text-transform: capitalize;
    letter-spacing: 1px;
    border-radius: 20px/50px;
    border: 2px solid #fdeeac;
    transition: all 0.5s ease 0s;
}
.btn:hover,
.btn:focus{
    color: #113341;
    background: radial-gradient(circle, #fdeeac 0.25em, transparent 0.25em) center/0.1em 0.1em;
    box-shadow: 4px 4px rgba(253,238,172,0.2);
}
@media only screen and (max-width: 767px){
    .btn{ margin-bottom: 20px; }
}

.customoverlay {
position:relative;
bottom:85px;
border-radius:6px;
border: 1px solid #ccc;
border-bottom:2px solid #ddd;
float:left;
}
.customoverlay:nth-of-type(n) {
border:0; 
box-shadow:0px 1px 2px #888;
}
.customoverlay a {
display:block;
text-decoration:none;
color:#000;
text-align:center;
border-radius:6px;
font-size:14px;
font-weight:bold;
overflow:hidden;
background: #d95050;
background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
}
.customoverlay .title {
display:block;
text-align:center;
background:#fff;
margin-right:35px;
padding:10px 15px;
font-size:14px;
font-weight:bold;
}
.customoverlay:after {
content:'';position:absolute;
margin-left:-12px;left:50%;
bottom:-12px;width:22px;
height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}


</style>

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
               <input style="width: 10%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="hidden" readonly="readonly">
               <input style="width: 10%; display: inline;" placeholder="우편번호" name="addr2" id="addr2" type="hidden" readonly="readonly">
                
    			<div class="row mb-4">
        		<div class="col-sm-3">
            		<a class="btn btn-lg" href="#" onclick="execPostCode();">
               		<span>위치검색하기</span>
           			 </a>
       			 </div>
    			</div>

               <div class="container">
                  <div class="row">
                     <!-- 실제 지도맵 들어가는 자리입니다. -->
                     <div id="map1" style="width: 100%; height: 600px;">
                     
                     
                     </div>                     

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>                     
<script>   
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
mapOption = {
    center : new kakao.maps.LatLng(37.478864,
          126.8787819), // 위도 경도 순으로 입력하세요.
    level : 3
 // 지도의 확대 레벨
 };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = '${pageContext.request.contextPath}/img/마커배경-removebg-preview.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(80, 69), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(39, 70)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.


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
                           
                            
                         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                                markerPosition =coords; // 마커가 표시될 위치입니다

                            // 마커를 생성합니다
                            var marker = new kakao.maps.Marker({
                              position: coords,
                              image: markerImage // 마커이미지 설정 
                            });

                            // 마커가 지도 위에 표시되도록 설정합니다
                            marker.setMap(map);  

                            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            var content = '<div class="customoverlay">' +
                                '  <a href="${pageContext.request.contextPath}/common/gymdetail/'+item.gnum+'">' +
                                '    <span class="title">'+item.gname+'</span>' +
                                '  </a>' +
                                '</div>';

                            // 커스텀 오버레이가 표시될 위치입니다 
                            var position = coords;  

                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay({
                                map: map,
                                position: coords,
                                content: content,
                                yAnchor: 1 
                            });
                            
                            
                            
                           /* 
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
					*/
   						
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
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);
				
				
				
				// 주소로 좌표를 검색합니다
				geocoder1.addressSearch(fullRoadAddr, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 console.log("되따!!");
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				      
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				        
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
				                           
				                            
				                         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				                                markerPosition =coords; // 마커가 표시될 위치입니다

				                            // 마커를 생성합니다
				                            var marker = new kakao.maps.Marker({
				                              position: coords,
				                              image: markerImage // 마커이미지 설정 
				                            });

				                            // 마커가 지도 위에 표시되도록 설정합니다
				                            marker.setMap(map);  

				                            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				                            var content = '<div class="customoverlay">' +
				                                '  <a href="${pageContext.request.contextPath}/common/gymdetail/'+item.gnum+'">' +
				                                '    <span class="title">'+item.gname+'</span>' +
				                                '  </a>' +
				                                '</div>';

				                            // 커스텀 오버레이가 표시될 위치입니다 
				                            var position = coords;  

				                            // 커스텀 오버레이를 생성합니다
				                            var customOverlay = new kakao.maps.CustomOverlay({
				                                map: map,
				                                position: coords,
				                                content: content,
				                                yAnchor: 1 
				                            });
				                            
				                            
				                            
				                           /* 
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
									*/
				   						
				                        }
				                    });
				                }); //each end  
				            },error : function(e) {
								console.log(e);
							}
				        })
				    } 
				});		
				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
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


	<!-- Footer Section Begin -->
	<%@ include file="../layout/footer.jsp"%>
	<!-- Footer Section End -->



      <!-- Login model Begin -->
      <%@ include file="../layout/login_model.jsp"%>
      <!-- Login model end -->

      <!-- Js Plugins -->
      <%@ include file="../layout/foot_tags.jsp"%>
</body>

</html>