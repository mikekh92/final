<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>CHECKMATE</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">


<!-- Template Main CSS File -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Hidayah - v4.7.0
  * Template URL: https://bootstrapmade.com/hidayah-free-simple-html-template-for-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<jsp:include page="common/header.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div id="heroCarousel" data-bs-interval="5000"
			class="carousel slide carousel-fade" data-bs-ride="carousel">

			<!-- <ol class="carousel-indicators" id="hero-carousel-indicators"></ol> -->

			<div class="carousel-inner" role="listbox">

				<!-- Slide 1 -->
				<div class="carousel-item active"
					style="background-image: url(resources/img/slide/slide-1.jpg)">
					<div class="carousel-container">
						<div class="container">
							<h2 class="animated fadeInDown">
								Welcome to <span>CHECKMATE</span>
							</h2>
							<form action="mainSearch.co" method="get">
								<div class="input-group mb-3 input-group-lg">
									<!-- <span class="input-group-text">Large</span> -->
									<input type="text" class="form-control" id="searchContent"
										name="searchContent" placeholder="검색할 내용을 입력해주세요">
									<button type="submit"
										class="btn-get-started animated fadeInUp scrollto"
										style="border: none;">Search</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container-fluid">

				<div class="row justify-content-center">
					<div
						class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
					</div>

					<div
						class="col-xl-5 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
						<h3>새로운 스터디그룹 웹사이트</h3>
						<p>CHECK + MATE = CHECKMATE!</p>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-laptop"></i>
							</div>
							<h4 class="title">
								<a href="">스터디그룹 전용 웹사이트</a>
							</h4>
							<p class="description">오직 스터디그룹을 위한 공간</p>
						</div>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-info-circle"></i>
							</div>
							<h4 class="title">
								<a href="">정보제공</a>
							</h4>
							<p class="description">지도, 시험정보, 취업정보</p>
						</div>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-atom"></i>
							</div>
							<h4 class="title">
								<a href="">실시간 스터디 웹사이트</a>
							</h4>
							<p class="description">시간과 공간에 제약이 없는 실시간 스터디 웹사이트</p>
						</div>

					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->

		<section id="services" class="services">
			<div class="container-fluid">
			<jsp:include page="studyGroup/studyGroupExploration.jsp"></jsp:include>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<jsp:include page="common/footer.jsp" />




	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/vendor/purecounter/purecounter.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="resources/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>

	<c:choose>
		<c:when test="${not empty loginUser }">
			<script>
		  (function location(){
		  	navigator.geolocation.getCurrentPosition(
		  	function(position) {
		  		var positionLat = position.coords.latitude;
		  		var positionLon = position.coords.longitude;
				    
		  		$.ajax({
		  			url : "location.lo",
		  			data : {
		  				locationLatitude : positionLat,
		  				locationLongitude : positionLon,
		  				userNo : ${loginUser.userNo}
		  			},
		  			success : function(result){
						
		  			},
		  			error : function(){
		  				console.log("통신실패");
		  			}
		  		})
		  	},
		  	);
		  })();
		  </script>
		</c:when>
	</c:choose>
</body>



</html>