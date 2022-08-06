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
#studyGroupList>table {
	text-align: center;
}
</style>

<body>

	<jsp:include page="../common/header.jsp" />
	<br><br><br>

	<div class=" " id="" style="margin-top: 200px; margin-bottom: 200px;"
		align="center">
		<h1>스터디 그룹 리스트</h1>
		<div id="studyGroupList" class="container mt-3">
			<table id="" class="table table-dark table-hover">
				<thead>
					<tr>
						<th width="50px">번호</th>
						<th width="120px">분류</th>
						<th width="150px">이름</th>
						<th width="">목표</th>
						<th width="400px">지역</th>
						<th width="150px">생성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${studyGroupList}" var="studyGroup">
						<tr>
							<td id="sgNo">${studyGroup.sgNo}</td>
							<td>${studyGroup.sgCategory}</td>
							<td>${studyGroup.sgName}</td>
							<td>${studyGroup.sgGoal}</td>
							<td>${studyGroup.sgLocation}</td>
							<td>${studyGroup.sgEnrollDate}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<script>
			$(function() {
				$("#studyGroupList>table>tbody>tr>td")
						.click(
								function() {
									location.href = 'studyGroupDetail.sg?sgNo='
											+ $(this).parent()
													.children("#sgNo").text();
								})
			})
		</script>

		<form class="row g-3 justify-content-center"
			action="studyGroupSearch.sg" method="get">
			<div class="col-3" style="float: center;">
				<c:choose>
					<c:when test="${empty searchContent}">
						<input type="text" class="form-control" name="searchContent"
							id="searchContent" placeholder="검색할 내용을 입력해주세요">
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" name="searchContent"
							id="searchContent" placeholder="검색할 내용을 입력해주세요"
							value="${searchContent}">
					</c:otherwise>
				</c:choose>

			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-secondary mb-3">검색</button>
			</div>
		</form>


		<div id="pagingArea" class="">
			<ul class="pagination justify-content-center"
				style="margin-top: 10px;">
				<c:choose>
					<c:when test="${empty searchContent}">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="studyGroupList.sg?cpage=${pi.currentPage-1}">&laquo;</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">

							<li class="page-item"><a class="page-link"
								href="studyGroupList.sg?cpage=${p }">${p}</a></li>

						</c:forEach>


						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="studyGroupList.sg?cpage=${pi.currentPage+1}">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</c:when>


					<c:otherwise>
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="studyGroupSearch.sg/#">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="studyGroupSearch.sg?searchContent=${searchContent }&cpage=${pi.currentPage-1}">&laquo;</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">

							<li class="page-item"><a class="page-link"
								href="studyGroupSearch.sg?searchContent=${searchContent}&cpage=${p}">${p}</a></li>

						</c:forEach>


						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="studyGroupSearch.sg/#">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="studyGroupSearch.sg?searchContent=${searchContent }&cpage=${pi.currentPage+1}">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

	<div class="">
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>