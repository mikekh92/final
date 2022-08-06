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
.msgList>table {
	text-align: center;
}

#content {
	width: 570px
}

#date {
	width: 170px;
}

#check {
	width: 50px;
}

#receiver {
	width: 200px;
}
</style>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class=" " id="" style="margin-top: 200px; margin-bottom: 200px;"
		align="center">
		<h1>${title}</h1>
		<div class="">

			<!-- 검색창 -->
			<!-- <form action="${pageContext.request.contextPath}/message/searchMessage.do"  onsubmit="return checkSearch();" class="input-group col-sm-5 offset-sm-3" method="post">
            <input type="hidden" name="type" value="${title}"/>
                <div class="input-group-prepend mr-2">
                    <select class="custom-select" name="keyword">
                        <option selected>검색 유형 선택</option>
                        <option value="id">아이디</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <input type="text" name="searchContent" class="form-control mr-2"
                    aria-label="Text input with dropdown button"/>
                <button type="submit" class="btn btn-secondary" >검색</button>
            </form> -->

			<div class="">
				<button type="button" class="btn btn-secondary"
					onclick="messageRecv();">수신함</button>
				<button type="button" class="btn btn-secondary"
					onclick="messageSend();">발신함</button>
			</div>
		</div>
		<div id="" class="container mt-3 msgList">
			<table id="messageList" class="table table-dark table-hover">
				<thead>
					<tr>
						<th id="check"><input type="checkbox" name="" id="checkAll"></th>
						<th id="receiver">받는사람</th>
						<th id="content">내용</th>
						<th id="date">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${messageList}" var="message">
						<tr>
							<th scope="row"><input id="msgno" name="msgCheck"
								class="deleteCheck" type="checkbox" value="${message.msgNo}"></th>
							<td>${message.msgRecv}</td>
							<c:choose>
								<c:when test="${fn:length(message.msgContent) gt 15}">
									<td><c:out
											value="${fn:substring(message.msgContent, 0, 30)}"></c:out>...</a></td>
								</c:when>
								<c:otherwise>
									<td>${message.msgContent}</a></td>
								</c:otherwise>
							</c:choose>
							<td>${message.msgSendtime}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="pagingArea" class="">
			<ul class="pagination justify-content-center"
				style="margin-top: 10px;">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="messageSendList.msg?cpage=${pi.currentPage-1}">&laquo;</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">

					<li class="page-item"><a class="page-link"
						href="messageSendList.msg?cpage=${p }">${p}</a></li>

				</c:forEach>


				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="messageSendList.msg?cpage=${pi.currentPage+1}">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="">
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		function messageRecv() {
			location.href = 'messageList.msg';
		}

		function messageSend() {
			location.href = 'messageSendList.msg';
		}

		$(function() {
			$("#messageList>tbody>tr>td").click(
					function() {
						location.href = 'messageSendDetail.msg?msgno='
								+ $(this).parent().children()
										.children("#msgno").val();
					})
		})

		$("#checkAll").click(
				function() {
					if ($("#checkAll").prop("checked")) {
						$("input[type=checkbox][name=msgCheck]").prop(
								"checked", true);
					} else {
						$("input[type=checkbox][name=msgCheck]").prop(
								"checked", false);
					}
				})

		$('input:checkbox')
				.click(
						function() {
							if ($("input[name='msgCheck']:checked").length == $("input[name='msgCheck']").length) {
								$("#checkAll").prop("checked", true);
							} else {
								$("#checkAll").prop("checked", false);
							}
						});
	</script>
</body>