<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
ul{
   list-style:none;
   width: 100%;
   text-align: left;
 }
</style>
</head>
<body style="padding-top: 3rem;">
	<jsp:include page="../../common/header.jsp" />

	<!-- Page content-->
	<div class="container mt-5" align="center">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1">${f.faqTitle}</h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2"
							style="word-break: break-all;">Writer : ${f.userNick} | Views
							: ${f.view} | Date : ${f.date}</div>
						
						<!-- Post categories-->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a> -->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
					</header>
					<!-- Post content-->
					<section class="mb-5" style="padding: 10px;">
						<p class="fs-5 mb-4">${f.faqContent}</p>
					</section>
					
					<c:if test="${loginUser.userNick eq '관리자'}">
					<div class="btn-group">
						<a class="btn btn-secondary" onclick="postFormSubmit(1)">글수정</a> <a
							class="btn btn-secondary" onclick="postFormSubmit(2)">글삭제</a>
					</div>
					</c:if>
				</article>
				<form id="postForm" method="post">
					<input type="hidden" name="faqNo"
						value="${f.faqNo}"> 
				</form>

				<script>
					function postFormSubmit(num) {
						if (num == 1) {
							$("#postForm").attr("action", "faqupdateForm.no")
									.submit();
						} else {
							if (confirm("정말 삭제하시겠습니까??") == true) {
								$("#postForm").attr("action", "faqdelete.no")
										.submit();
							} else {
								return false;
							}
						}
					}
				</script>


				
			</div>
			
			




			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="card mb-4">
					<div class="card-header">Search</div>
					<div class="card-body">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Enter search term..."
								aria-label="Enter search term..."
								aria-describedby="button-search" />
							<button class="btn btn-primary" id="button-search" type="button">Go!</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
<br><br><br><br><br><br>
<jsp:include page="../../common/footer.jsp" />
</body>
</html>