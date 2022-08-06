<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>CHECKMATE</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<%-- <link href="resources/img/favicon.png" rel="icon"> --%>
<%-- <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon"> --%>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<%-- <link href="resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> --%>

<!-- Template Main CSS File -->
<%-- <link href="resources/css/style.css" rel="stylesheet"> --%>

<!-- =======================================================
  * Template Name: Hidayah - v4.7.0
  * Template URL: https://bootstrapmade.com/hidayah-free-simple-html-template-for-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<jsp:include page="../common/header.jsp" />

	<div style="margin-top: 200px; margin-bottom: 200px;">
		<div class="container mt-3" id="" align="center">
			<form id="enrollForm" method="post" action="messageInsert.msg"
				enctype="multipart/form-data">

				<input type="hidden" id="send" name="msgSend"
					value="${loginUser.userNick}">
				<table class="table table-dark" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2">메세지 전송</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th style="width: 250px"><label for="recv">받는사람</label></th>
							<td style="width: 500px"><input type="text"
								style="width: 700px" id="recv" name="msgRecv" required
								placeholder="닉네임을 입력해주세요." style="align:center;"></td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td align="center"><textarea id="content" style="width: 700px"
									class="form-control" rows="10" cols="55" name="msgContent" required></textarea></td>
						</tr>
						<tr>
							<th><label for="upfile">첨부파일</label></th>
							<td><input type="file" style="width: 700px" id="upfile"
								class="form-control-file border" name="upfile"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div align="center">
					<button type="submit" class="btn btn-secondary">보내기</button>
					<button type="reset" class="btn btn-danger" href="">취소</button>
				</div>
			</form>
		</div>
		<br> <br>

	</div>

	<jsp:include page="../common/footer.jsp" />


</body>