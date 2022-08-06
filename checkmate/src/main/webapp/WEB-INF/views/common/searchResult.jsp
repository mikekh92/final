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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<style>
.detail {
	text-align: center;
}

.detail>table {
	text-align: center;
}
</style>
<body>

	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>

	<div style="margin-top: 200px; margin-bottom: 200px;"
		class="container mt-3 detail">
		<input type="hidden">

		<form action="mainSearch.co" method="get">
			<div class="input-group mb-3 input-group-lg">
				<!-- <span class="input-group-text">Large</span> -->
				<input type="text" class="form-control" id="searchContent"
					name="searchContent" placeholder="검색할 내용을 입력해주세요"
					value="${searchContent }">
				<button type="submit" class="btn btn-secondary"
					style="border: none;">Search</button>
			</div>
		</form>

		<table class="table table-dark" id="sgSearchList">
			<thead>
				<th colspan="5">스터디그룹 검색결과</th>
			</thead>
			<tbody>
				<tr>
					<td>분류</td>
					<td>이름</td>
					<td>목표</td>
					<td>지역</td>
					<td>생성일</td>
				</tr>
				<c:choose>
					<c:when test="${sgSearchCount == 0 }">
						<tr>
							<td colspan="5">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${sgSearchCount < 4 }">
						<c:forEach items="${sgSearchList}" var="studyGroup">
							<tr>
								<input type="hidden" id="sgNo" value="${studyGroup.sgNo}">
								<td>${studyGroup.sgCategory}</td>
								<td>${studyGroup.sgName}</td>
								<td>${studyGroup.sgGoal}</td>
								<td>${studyGroup.sgLocation}</td>
								<td>${studyGroup.sgEnrollDate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${sgSearchList}" var="studyGroup" end="2">
							<tr>
								<input type="hidden" id="sgNo" value="${studyGroup.sgNo}">
								<td>${studyGroup.sgCategory}</td>
								<td>${studyGroup.sgName}</td>
								<td>${studyGroup.sgGoal}</td>
								<td>${studyGroup.sgLocation}</td>
								<td>${studyGroup.sgEnrollDate}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot id="sgMore">
				<c:choose>
					<c:when test="${sgSearchCount < 4 }">

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">더보기</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tfoot>
		</table>

		<!-- 정보공유게시판 검색결과 -->
		<table class="table table-dark" id="siSearchList">
			<thead>
				<th colspan="2">정보공유게시판 검색결과</th>
			</thead>
			<tbody>
				<tr>
					<td>제목</td>
					<td>내용</td>
				</tr>
				<c:choose>
					<c:when test="${siSearchCount == 0 }">
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${siSearchCount < 4 }">
						<c:forEach items="${siSearchList}" var="siSearchList">
							<tr>
								<input type="hidden" id=informationNo
									value="${siSearchList.informationNo}">
								<td>${siSearchList.informationTitle}</td>
								<td>${siSearchList.informationContent}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${siSearchList}" var="siSearchList" end="2">
							<tr>
								<input type="hidden" id=informationNo
									value="${siSearchList.informationNo}">
								<td>${siSearchList.informationTitle}</td>
								<td>${siSearchList.informationContent}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot id="siMore">
				<c:choose>
					<c:when test="${siSearchCount < 4 }">

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">더보기</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tfoot>
		</table>


		<!-- 취업정보공유게시판 검색결과 -->
		<table class="table table-dark" id="jsiSearchList">
			<thead>
				<th colspan="2">취업정보공유게시판 검색결과</th>
			</thead>
			<tbody>
				<tr>
					<td>제목</td>
					<td>내용</td>
				</tr>
				<c:choose>
					<c:when test="${jsiSearchCount == 0 }">
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${jsiSearchCount < 4 }">
						<c:forEach items="${jsiSearchList}" var="jsiSearchList">
							<tr>
								<input type="hidden" id=informationNo
									value="${jsiSearchList.informationNo}">
								<td>${jsiSearchList.informationTitle}</td>
								<td>${jsiSearchList.informationContent}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${jsiSearchList}" var="jsiSearchList" end="2">
							<tr>
								<input type="hidden" id=informationNo
									value="${jsiSearchList.informationNo}">
								<td>${jsiSearchList.informationTitle}</td>
								<td>${jsiSearchList.informationContent}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot id="jsiMore">
				<c:choose>
					<c:when test="${jsiSearchCount < 4 }">

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">더보기</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tfoot>
		</table>


	</div>

	<script>
		//스터디그룹
		$(function() {
			if(${sgSearchCount == 0}){
				
			} else{
			$("#sgSearchList>tbody>tr>td").click(
					function() {
						location.href = 'studyGroupDetail.sg?sgNo='
								+ $(this).parent().children("#sgNo").val();
					})
			}
		})

		$(function() {
			$("#sgMore>tr>td")
					.click(
							function() {
								location.href = 'studyGroupSearch.sg?searchContent=${searchContent}';
							})
		})
		
		//정보공유
		$(function() {
			if(${siSearchCount == 0}){
				
			} else{
			$("#siSearchList>tbody>tr>td").click(
					function() {
						location.href = 'detail.si?informationNo='
								+ $(this).parent().children("#informationNo").val();
					})
			}
		})

		$(function() {
			$("#siMore>tr>td")
					.click(
							function() {
								location.href = 'siSearchList.si?searchContent=${searchContent}';
							})
		})
		
		//취업정보공유
		$(function() {
			if(${jsiSearchCount == 0}){
				
			} else{
			$("#jsiSearchList>tbody>tr>td").click(
					function() {
						location.href = 'jobDetail.si?informationNo='
								+ $(this).parent().children("#informationNo").val();
					})
			}
		})

		$(function() {
			$("#jsiMore>tr>td")
					.click(
							function() {
								location.href = 'jsiSearchList.si?searchContent=${searchContent}';
							})
		})
	</script>

	<div class="">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>