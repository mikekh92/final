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
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="list.si">정보공유</a></li>
						<li class="nav-item"><a class="nav-link" href="jobList.si"
							style="color: #747980;">취업정보공유</a></li>
					</ul>
					<table class="table table-light table-hover table-responsive"
						id="siList">
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
							<c:forEach var="b" items="${list}">
								<tr>
									<td id="informationNo">${b.informationNo}</td>
									<td>${b.informationTitle}</td>
									<td>${b.userNick}</td>
									<td>${b.informationView}</td>
									<td>${b.informationDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<script>
						$(function() {
							$("#siList>tbody>tr")
									.click(
											function() {
												location.href = 'detail.si?informationNo='
														+ $(this)
																.children(
																		"#informationNo")
																.text();
											})

						})
					</script>
				</div>
			</div>
			<form class="row g-3 justify-content-center" action="search.si"
				method="get">
				<div class="col-3" style="float: center;">
					<c:choose>
						<c:when test="${empty searchContent}">
							<input type="text" class="form-control" id="searchContent"
								name="searchContent" placeholder="검색할 내용을 입력 해주세요.">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" id="searchContent"
								name="searchContent" placeholder="검색할 내용을 입력 해주세요."
								value="${searchContent }">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-secondary mb-3">검색</button>
				</div>
			</form>

			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${empty searchContent}">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item"><a class="page-link text-dark"
										href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark"
										href="list.si?cpage=${pi.currentPage-1 }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</c:otherwise>
							</c:choose>
							</a>
							</li>

							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item"><a class="page-link text-dark"
									href="list.si?cpage=${p }">${p }</a></li>
							</c:forEach>

							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item"><a class="page-link text-dark"
										href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark"
										href="list.si?cpage=${pi.currentPage+1 }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>

						<c:otherwise>
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item"><a class="page-link text-dark"
										href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark"
										href="siSearchList.si?searchContent=${searchContent }&cpage=${pi.currentPage-1 }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</c:otherwise>
							</c:choose>
							</a>
							</li>

							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item"><a class="page-link text-dark"
									href="siSearchList.si?searchContent=${searchContent }&cpage=${p }">${p }</a></li>
							</c:forEach>

							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item"><a class="page-link text-dark"
										href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark"
										href="siSearchList.si?searchContent=${searchContent }&cpage=${pi.currentPage+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>

								</c:otherwise>
							</c:choose>
						</c:otherwise>

					</c:choose>

				</ul>
			</nav>

			<c:if test="${ not empty loginUser }">
				<div class="btn-group">
					<a href="enrollForm.si" class="btn btn-secondary">글쓰기</a>
				</div>
			</c:if>
		</div>
	</div>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>