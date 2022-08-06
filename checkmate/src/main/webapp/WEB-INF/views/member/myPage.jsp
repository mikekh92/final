<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MYPAGE</title>
<meta content="" name="description">
<meta content="" name="keywords">
<jsp:include page="../common/header.jsp" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<style>
div {
	
}

.wrap {
	width: 1400px;
	height: 1500px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

.header {
	height: 15%;
}

.content {
	height: 70%;
}

.content>div {
	float: left;
}

.header>div, .content>div {
	float: left;
	height: 100%;
}

.content_1 {
	width: 28%;
}

.content_2 {
	width: 72%;
	display: inline-block;
}

.content_2_1 {
	height: 10%;
}

.header_1 {
	width: 20%;
}

.header_2 {
	width: 80%;
}

#navi {
	list-style-type: none;
}

#navi a {
	color: grey;
	text-decoration: none;
	font-size: 23px;
	font-weight: bold;
	display: flex;
	height: 100%;
	line-height: 55px;
	width: 50%;
	margin: 0 auto;
}

#navi a:hover {
	font-size: 24px;
	color: black;
}

.inline-block {
	float: left;
	margin-left: 50px;
	margin-top: 50px;
}

hr {
	border: 0;
	width: 100%;
	height: 2px;
	background: darkgray;
}

.image-upload>input {
	display: none;
}

.image-upload img {
	width: 80px;
	cursor: pointer;
}
</style>
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="wrap">
		<div class="header">
			<div class="header_1"></div>
			<div class="header_2">
				<h1 align="center" style="font-size: 100px;">My Page</h1>
			</div>
		</div>
		<div class="content">
			<div class="content_1" style="background-color: #E0E0E0">
				<br> <br> <br>
				<ul id="navi">
					<li><a href="myPage.me">예약조회/취소</a></li>
					<c:if
						test="${not empty loginUser.userPw && not empty loginUser.userId}">
					<li><a type="button" data-bs-toggle="modal"
						data-bs-target="#myModal">정보수정</a></li>
					</c:if>	
					<c:if
						test="${not empty loginUser.userPw && not empty loginUser.userId}">
						<li><a type="button" data-bs-toggle="modal"
							data-bs-target="#myModal2">회원탈퇴</a></li>
					</c:if>
					<c:if
						test="${not empty loginUser.userPw && not empty loginUser.userId}">
						<li><a type="button" data-bs-toggle="modal"
							data-bs-target="#myModal3" onclick="return checkPWD();">비밀번호
								변경</a></li>
					</c:if>
					<li><a href="noticeList.no">고객센터</a></li>
					<li><a type="button" data-bs-toggle="modal"
						data-bs-target="#myModal4">나의 스터디그룹</a></li>
				</ul>
			</div>
			<div class="content_2">
				<div class="content_2_1">
					<span class="inline-block"><img
						src=".${request.getContextPath()}/${loginUser.userChangeProfile}"
						style="width: 100px; height: 80px;"></span><br>
					<h3>
						<span class="inline-block">${loginUser.userName}님 안녕하세요</span>
					</h3>
				</div>
				<br>
				<div class="content_2_2" style="margin-left: 100px;">
					<h2 class="inline-block" style="margin-right: 3px;">예약조회</h2>
					<span class="inline-block badge bg-secondary"
						style="margin-left: 3px;">${listCount}</span> <br>
				</div>
				<hr style="height: 3px; background-color: black;">
				<div class="innerOuter" style="padding: 5% 5%;">
					<div style="float: right;">
						<a class="btn btn-secondary" style="margin-right: 3px;"
							href="selectMyReservation.ro">예약조회</a> <a class="btn btn-dark"
							style="margin-left: 3px;" id="deleting">예약취소</a>
					</div>
					<table id="boardList" class="table table-hover"
						style="float: right;">
						<thead align="center">
							<tr>
								<th></th>
								<th>스터디센터</th>
								<th>예약일</th>
								<th>시작시간</th>
								<th>마치는시간</th>
								<th>방이름</th>
								<th>방크기(인원가능)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${myList}">
								<tr>
									<th><input type="checkbox" name="deletes"
										value="${r.reservationNo}"></th>
									<td>${r.roomCenterName}</td>
									<td>${r.reservationDate}</td>
									<td>${r.reservationStartTime}시</td>
									<td>${r.reservationUsedTime+r.reservationStartTime}시</td>
									<td>${r.roomName}</td>
									<td>${r.roomSize}명</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-dialog-centered">
					<!-- Modal content-->
					<div class="modal-content">
						<div align="right">
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-header">
							<h2 class="modal-title" align="center">정보수정</h2>
						</div>
						<form action="update.me" method="post"
							enctype="multipart/form-data">
							<div class="modal-body">
								<div id="image_container" align="center">
									<img id="userProfile"
										src=".${request.getContextPath()}/${loginUser.userChangeProfile}"
										style="width: 100px; height: 80px; margin: auto; display: block">
								</div>
								<div class="image-upload" align="center">
									<label for="userOriginProfile"> <img
										src="https://www.svgrepo.com/show/904/photo-camera.svg"
										style="width: 15px; height: 12px;" />
									</label> <input class="userOriginProfile" type="file" name="profile"
										id="userOriginProfile" onchange="setThumbnail(this);">
								</div>
								<div class="form-group">
										<label for="userId">* 아이디 : </label>
										<input type="text" class="form-control" id="userId"
											value="${loginUser.userId}" name="userId" readonly>
										<br>
									<label for="userName">* 이름 : </label> <input type="text"
										class="form-control" id="userName"
										value="${loginUser.userName}" name="userName" required
										readonly> <br> <label for="nickName">
										&nbsp; 닉네임 : </label> <input type="text" class="form-control"
										id="userNick" value="${loginUser.userNick}" name="userNick"
										placeholder="아이디">
									<button type="button" id="nickBtn" class="checkBtn">중복
										확인</button>
									<span class="nickCheck">3~10자를 사용하세요.</span> <br>
										<label for="email"> &nbsp; 이메일 : </label>
										<input type="text" class="form-control" id="userEmail"
											value="${loginUser.userEmail}" name="userEmail"
											placeholder="이메일">
										<button type="button" id="emailBtn" class="checkBtn">중복
											확인</button>
										<br>
										<label for="phone"> &nbsp; 전화번호(숫자만 입력)</label>
										<input type="text" class="form-control" id="userPhone"
											value="${loginUser.userPhone}" name="userPhone"
											placeholder="전화번호(숫자만 입력)">
										<br>

									<label for="address"> &nbsp; 주소 : </label> <input type="text"
										class="form-control" id="address_kakao"
										value="${addressKakao}" readonly placeholder="주소"> <br>

									<label for="address"> &nbsp; 상세주소 : </label> <input type="text"
										class="form-control" id="address_detail"
										value="${addressDetail}" placeholder="상세주소"> <br>
									<input type="hidden" name="userAddress" id="userAddress" />

								</div>
								<br>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary"
										id="updateConfirm">수정하기</button>
									<button type="button" class="btn btn-danger"
										data-bs-dismiss="modal">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div align="right">
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-header">
						<h2 class="modal-title" align="center">회원탈퇴</h2>
					</div>
					<form action="delete.me" method="post">
						<div class="modal-body">
							<div align="center">가입된 회원정보가 모두 삭제됩니다. 회원탈퇴를 원하신다면 비밀번호를
								입력해주세요.</div>
							<br> <label for="userPwd" class="mr-sm-2">비밀번호 : </label> <input
								type="password" class="form-control mb-2 mr-sm-2"
								placeholder="비밀번호를 입력해주세요." id="userPw" name="userPw"> <br>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-success">탈퇴하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal3" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div align="right">
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-header">
						<h2 class="modal-title" align="center">비밀번호 변경</h2>
					</div>
					<form action="updatePwd.me" method="post">
						<div class="modal-body" align="center">
							<table>
								<tr>
									<td>현재 비밀번호</td>
									<td><input type="password" id="nowPw" name="nowPw"
										required></td>
								</tr>
								<tr>
									<td>변경할 비밀번호</td>
									<td><input type="password" name="userPw" id="pwd1"
										required></td>
								</tr>
								<tr>
									<td class="pwdCheck1">8~16자 영문,숫자,특수문자를 사용하세요.</td>
								</tr>
								<tr>
									<td>변경할 비밀번호 확인</td>
									<td><input type="password" id="pwd2" required></td>
								</tr>
							</table>
							<br>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-success"
								onclick="return validatePwd();">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<!-- 스터디그룹 조회 모달 -->
		<div class="modal" id="myModal4">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">${loginUser.userName}의스터디그룹</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" id="studyGroupList">
						<table id="" class="table table-dark table-hover"
							style="text-align: center;">
							<thead align="center">
								<tr>
									<th>스터디그룹명</th>
									<th>목표</th>
									<th>지역</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty myStudyGroupList }">
										<tr>
											<td>속한 스터디 그룹이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="myStudyGroupList" items="${myStudyGroupList }">
											<tr>
												<td><input type="hidden"
													value="${myStudyGroupList.sgNo}" id="sgNo">${myStudyGroupList.sgName }</td>
												<td>${myStudyGroupList.sgGoal }</td>
												<td>${fn:substring(myStudyGroupList.sgLocation, 0, 6)}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>

				<script
					src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					window.onload = function() {
						document
								.getElementById("address_kakao")
								.addEventListener(
										"click",
										function() { //주소입력칸을 클릭하면
											//카카오 지도 발생
											new daum.Postcode(
													{
														oncomplete : function(
																data) { //선택시 입력값 세팅
															document
																	.getElementById("address_kakao").value = data.address; // 주소 넣기
															document
																	.querySelector(
																			"input[id=address_detail]")
																	.focus(); //상세입력 포커싱
														}
													}).open();
										});
					}
					//비밀번호 파트
					$("#pwd1")
							.on(
									'keyup',
									function() {
										var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
										var pw1 = $("#pwd1").val();

										if (pw1 == "") {
											$(".pwdCheck1").text(
													"8~16자 영문,숫자,특수문자를 사용하세요.");
											$(".pwdCheck1").css("color",
													"black");
										} else if (reg.test(pw1)) {
											$(".pwdCheck1").text(
													"사용 가능한 비밀번호입니다.");
											$(".pwdCheck1").css("color",
													"green");
										} else {
											$(".pwdCheck1")
													.text(
															"사용 불가능한 비밀번호 입니다. 8~16자 영문,숫자,특수문자를 사용하세요.");
											$(".pwdCheck1").css("color", "red");
										}
									});

					function validatePwd() {

						if ($("#pwd1").val() != $("#pwd2").val()) { // 변경할 비밀번호와 비밀번화 확인 value값이 같지 않으면 전송하지마

							alert("변경할 비밀번호와 변경할 비밀번호확인과 같지 않습니다.")

							return false;
						}

						if ($("#nowPw").val() == $("#pwd1").val()) { // 변경할 비밀번호와 비밀번화 확인 value값이 같지 않으면 전송하지마

							alert("현재 비밀번호와 변경 비밀번호가 같습니다.")

							return false;
						}
					};
					//닉네임파트
					$("#userNick").on(
							'keyup',
							function() {
								console.log("실행");
								var $userNick = $("#userNick").val();
								if ($userNick == "") {
									$(".nickCheck").text("3~10자를 사용하세요.");
									$(".nickCheck").css("color", "black");
								} else if ($userNick.length >= 3
										&& $userNick.length <= 10) {
									$(".nickCheck").text(
											"사용 가능한 닉네임입니다. 중복 확인을 해주세요.");
									$(".nickCheck").css("color", "green");
								} else {
									$(".nickCheck").text("사용 불가능한 닉네임입니다.");
									$(".nickCheck").css("color", "red");
								}
							});

					$("#nickBtn").click(function() {

						$.ajax({
							url : "nickCheck.me",
							data : {
								userNick : $("#userNick").val()
							},
							success : function(result) {
								console.log(result)
								if (result == "N") {
									alert("사용 불가능한 닉네임입니다. 다시 입력해 주세요");
									$("#userNick").val('');
									$("#userNick").focus();
									$(".nickCheck").text("3~10자를 사용하세요.");
									$(".nickCheck").css("color", "black");
								} else {
									alert("사용 가능한 닉네임입니다.");
									$("#userNick").attr("readonly", "true");
								}
							},
							error : function(result) {
								console.log(result)
								console.log("오류");
							}
						})

					});

					//프로필 파트
					function setThumbnail(inputFile) {

						if (inputFile.files.length == 1) {

							var reader = new FileReader();
							reader.readAsDataURL(event.target.files[0]);

							reader.onload = function(event) {
								$("#userProfile").attr("src",
										event.target.result);
							};
						} else {
							$("#userProfile").attr("src", null);
						}

					};
					$("#updateConfirm").click(function() {

						if ($("#address_detail").val().length < 1) {
							alert("주소를 다시 확인해주세요.");
							return false;

						} else {

							var address = $('#userAddress').val();
							address += $('#address_kakao').val();
							address += ", " + $('#address_detail').val();
							$('#userAddress').val(address);
							return true;
						}
					})
					$(function() {
						$("#deleting").click(function() {

							var temp = $("input[name=deletes]:checked");

							var values = [];
							for (var i = 0; i < temp.length; i++) {
								values.push(temp[i].value);
							}

							$.ajax({
								url : "deleting.ro",
								traditional : true,
								data : {
									values : values
								},
								success : function(result) {
									alert("예약취소성공");
									window.location.replace = ("myPage.me");
								},
								error : function() {
									alertify.alert("예약취소실패");
								},
							})
						})
					})
					//이메일파트
					$("#emailBtn").click(function() {

						$.ajax({
							url : "emailCheck.me",
							data : {
								userEmail : $("#userEmail").val()
							},
							success : function(result) {
								console.log(result)
								if (result == "N") {
									alert("사용중인 이메일입니다. 다시 입력해 주세요");
									$("#userEmail").val('');
									$("#userEmail").focus();

								} else {
									alert("사용 가능한 이메일입니다.");
									$("#userEmail").attr("readonly", "true");
								}
							},
							error : function(result) {
								console.log(result)
								console.log("오류");
							}
						})

					});
					//구대영
					$(function() {
						$("#studyGroupList>table>tbody>tr>td").click(
								function() {
									location.href = 'studyGroupDetail.sg?sgNo='
											+ $(this).parent().children()
													.children("#sgNo").val();
								})
					})
				</script>
</body>
</html>