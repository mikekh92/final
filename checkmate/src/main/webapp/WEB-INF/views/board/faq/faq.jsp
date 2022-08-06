<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/sharingInformation.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<div class="back-image">
		<br> <br> <br>
		<div class="item">
			<div class="row justify-content-center">
				<div class="col-12">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link"
							style="color: #747980;" href="noticeList.no">공지사항</a></li>
						<li class="nav-item"><a class="nav-link active" href="">FAQ</a></li>
					</ul>
					<table class="table table-light table-hover table-responsive"
						id="nolist">
						<thead class="thead-light">
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="text-dark">
							<c:forEach var="f" items="${list}">
								<tr>
									<td id="faqNo1">${f.faqNo}</td>
									<td>${f.faqTitle}</td>
									<td>${f.userNick}</td>
									<td>${f.view}</td>
									<td>${f.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<script>
						$(function() {
							$("#nolist>tbody>tr")
									.click(
											function() {
												location.href = 'faqDetail.no?faqNo='
														+ $(this)
																.children(
																		"#faqNo1")
																.text();
											})
						})
					</script>
				</div>
			</div>
<!-- 			<form class="row g-3 justify-content-center" action="jobSearch.si" method="get"> -->
<!-- 				<div class="col-3" style="float: center;"> -->
<!-- 					<input type="text" class="form-control" id="searchContent" name="searchContent" -->
<!-- 						placeholder="검색할 내용을 입력 해주세요."> -->
<!-- 				</div> -->
<!-- 				<div class="col-auto"> -->
<!-- 					<button type="submit" class="btn btn-secondary mb-3">검색</button> -->
<!-- 				</div> -->
<!-- 			</form> -->

			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item"><a class="page-link text-dark"
								href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link text-dark"
								href="faqList.no?cpage=${pi.currentPage-1 }"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</c:otherwise>
					</c:choose>
					</a>
					</li>

					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<li class="page-item"><a class="page-link text-dark"
							href="faqList.no?cpage=${p }">${p }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item"><a class="page-link text-dark"
								href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link text-dark"
								href="faqList.no?cpage=${pi.currentPage+1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>

						</c:otherwise>


					</c:choose>
				</ul>
			</nav>
			
			<c:if test="${ loginUser.userNick=='관리자'}">
				<div class="btn-group">
					<a href="faqEnrollForm.no" class="btn btn-secondary">글쓰기</a>
				</div>
			</c:if>
		</div>
	</div>

	<script>
		$(function() {
			$("#siList>tbody>tr").click(
					function() {
						location.href = 'detail.si?informationNo='
								+ $(this).children("#informationNo").text();
					})

		})
	</script>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>