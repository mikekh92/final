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
<style>
</style>
<body>

	<jsp:include page="../common/header.jsp" />


	<div style="margin-top: 200px; margin-bottom: 200px;">
		<div class="container mt-3" id="" align="center">
			<table class="table table-dark" style="text-align: center;">
				<thead>
					<tr>
						<th colspan="2">메세지 상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="width: 150px">보낸사람</th>
						<td style="width: 500px">${message.msgSend}</td>
					</tr>
					<tr>
						<th>받은시간</th>
						<td>${message.msgSendtime}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="width: 300px; height: 400px">${message.msgContent}</td>
					</tr>
					<c:if test="${not empty message.msgChangeName }">
						<tr>
							<th>첨부파일</th>
							<td><a href="${message.msgChangeName }"
								download="${message.msgOriginName }">${message.msgOriginName }</a></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<br>

			<form id="postForm" action="" method="post">
				<input type="hidden" id="reply" name="reply" value="${message.msgSend}">
			</form>

			<div class="">
				<button type="button" class="btn btn-secondary" onclick="reply();">답장</button>
				<button type="button" class="btn btn-secondary"
					onclick="deleteMsg();">삭제</button>
				<button type="button" class="btn btn-danger" onclick="reportMsg();">신고</button>
				<button type="button" class="btn btn-secondary"
					onclick="messageList();">목록</button>
			</div>
		</div>
	</div>

	<script>
		function reply(){
			$("#postForm").attr("action","messageReply.msg").submit();
		}
	
		function messageList() {
			location.href = "messageList.msg";
		}
	
		function deleteMsg(){
			if("${loginUser.userNick}" == "${message.msgRecv}"){
				if(confirm("삭제하시겠습니까?")){
					var messageNo = "${message.msgNo}";
					
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/messageDelete.msg",
						data : {
							messageNo
						},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("삭제가 완료되었습니다.");
								window.location = "${pageContext.request.contextPath}/messageList.msg";
							}
						},
						error : function() {
							alert("서버통신 오류");
						}
					});
				}
			}
		}
		
		function reportMsg(){
			if("${loginUser.userNick}" == "${message.msgRecv}"){
				if(confirm("신고하시겠습니까?"))
					var messageNo = "${message.msgNo}";
				
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/messageReport.msg",
					data : {
						messageNo
					},
					dataType : "json",
					success : function(data) {
						if (data > 0) {
							alert("신고가 완료되었습니다.");
							window.location = "${pageContext.request.contextPath}/messageList.msg";
						}
					},
					error : function() {
						alert("서버통신 오류");
					}
				});
			}
		}
	</script>

	<jsp:include page="../common/footer.jsp" />


</body>