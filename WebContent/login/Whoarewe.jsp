<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Local Directory | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../css/flaticon.css" type="text/css">
<link rel="stylesheet" href="../css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<style>

body{
margin-top: 100px;}


.map_container h1{
color: #242424;
    font-size: 48px;
    font-weight: 700;
    margin-bottom:50px;
    text-align: center;
   

}
    
</style>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
<!--  -->

<div class="map_container">
<h1><i>TwoPLJ</i></h1>
<div id="map" style="width:80%;height:550px;margin: 0 auto;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cf0513baf09ef2b85fc585b362cbd76"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4987123, 127.0319017), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.4987123, 127.0319017); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
</script>

</div>
<!--  -->
	



	<!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="#" class="contact-form">
						<div class="row">
							<div class="col-lg-6">
								<input type="text" placeholder="Your Name">
							</div>
							<div class="col-lg-6">
								<input type="text" placeholder="Your E-mail">
							</div>
							<div class="col-lg-12 text-center">
								<input type="text" placeholder="Subject">
								<textarea placeholder="Message"></textarea>
								<button type="submit">Send Message</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="cs-info">
						<h2>Contact Info</h2>
						
						<p>일상의 소음을 피해 즐기는 달콤함 ,<br>'투박이정'이 꿈꾸는 달콤함을 누려보세요. </p>
						<span>Main Road , No 25/11</span>
						<ul>
							<li>서울특별시 강남구 역삼동 <strong>"투박이정" </Strong>4F</li>
							<li>+86 02-6255-8061</li>
							<li>contact@weareTWoPLJ.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="contact-add">
						<img src="img/contact-add.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>