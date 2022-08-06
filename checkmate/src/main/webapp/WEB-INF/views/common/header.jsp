<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>header</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${path}/resources/img/favicon.png" rel="icon">
<link href="${path}/resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${path}/resources/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${path}/resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${path}/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${path}/resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${path}/resources/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="${path}/resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- 부트스트랩 5.1.3 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Template Main CSS File -->
<link href="${path}/resources/css/style.css" rel="stylesheet">
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 얼럿 CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/845fa7ca1e.js"
	crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- 네이버 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>

<!-- =======================================================
  * Template Name: Hidayah - v4.7.0
  * Template URL: https://bootstrapmade.com/hidayah-free-simple-html-template-for-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>

	<header id="header" class="fixed-top header-inner-pages">
		<div
			class="container d-flex align-items-center justify-content-between">

			<h1 class="logo">
				<a href="./">CHECKMATE</a>
			</h1>

			<nav id="navbar" class="navbar">
				<ul>
					<li class="dropdown"><a href="#"><span>커뮤니티</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="list.si">정보공유 게시판</a></li>
							<li><a href="jobList.si">취업정보 게시판</a></li>
							<li><a href="locationMap.lo">내 주변 사용자 보기</a></li>
							<li><a href="calender.ca">캘린더</a>
						</ul></li>

					<c:choose>
						<c:when test="${ empty loginUser }">
							<li class="dropdown"><a href="#"><span>스터디그룹</span> <i
									class="bi bi-chevron-down"></i></a>
								<ul>
									<li><a href="studyGroupList.sg">스터디그룹 목록</a></li>
								</ul></li>
							<li><div style="padding: 0 70px;"></div></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="#"><span>스터디그룹</span> <i
									class="bi bi-chevron-down"></i></a>
								<ul>
									<li><a href="studyGroupList.sg">스터디그룹 목록</a></li>
									<li class="dropdown"><a href="studyGroupList.sg"><span>나의
												스터디</span> <i class="bi bi-chevron-right"></i></a>
										<ul>
											<c:forEach items="${myStudyGroupList}" var="studyGroup">
												<li><a
													href="studyGroupDetail.sg?sgNo=${studyGroup.sgNo }">${studyGroup.sgName}</a></li>
											</c:forEach>
										</ul></li>
									<li><a href="studyGroupEnrollForm.sg">스터디 생성 </a></li>
									<li><a href="reservation.ro">스터디 센터 예약</a></li>
								</ul></li>
							<li class="dropdown"><a href="#"><span>메세지</span> <i
									class="bi bi-chevron-down"></i></a>
								<ul>
									<li class="dropdown"><a href="messageList.msg"><span>메세지함</span> <i class="bi bi-chevron-right"></i></a>
										<ul>
											<li><a href="messageList.msg">수신함</a></li>
											<li><a href="messageSendList.msg">발신함</a></li>
										</ul></li>
									<li><a href="messageForm.msg">메세지 전송</a></li>
								</ul></li>
							<li><div style="padding: 0 70px;"></div></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${ empty loginUser }">
							<li><a class="nav-link scrollto" href="memberLoginForm.me">Login</a></li>
							<li><a class="nav-link scrollto" href="memberEnrollForm.me">Join</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="nav-link scrollto" href="#">${loginUser.userNick}</a></li>
							<li><a class="nav-link scrollto" href="myPage.me">마이페이지</a></li>
							<li><a class="nav-link scrollto" href="logout.me">LOGOUT</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
		</div>
	</header>



	<!-- 얼럿 -->
	<c:if test="${not empty alertMsg}">
		<script>
			alertify.alert("서비스 요청 성공 ", "${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>



	<!-- 부트스트랩 5.1.3 스크립트 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>

</html>