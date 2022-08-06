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
<title>스터디그룹 상세보기</title>
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
		<input type="hidden" id="sgNo" value="${studyGroup.sgNo}">

		<table id="applyList" class="table table-dark table-hover">
			<thead>
				<tr>
					<th colspan="4"><h4>지원자 확인하기</h4></th>
				</tr>
				<tr>
					<th width="120">지원자</th>
					<th width="500">지원동기</th>
					<th colspan="2">수락/거절</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studyGroupApplyList}" var="StudyGroupApply">
					<tr>
						<td id="sga"><input type="hidden" id="qwer" value="1234">${StudyGroupApply.sgApplyNick}</td>
						<c:choose>
							<c:when test="${fn:length(StudyGroupApply.sgApplyContent) gt 15}">
								<td><c:out
										value="${fn:substring(StudyGroupApply.sgApplyContent, 0, 30)}"></c:out>...</td>
							</c:when>
							<c:otherwise>
								<td>${StudyGroupApply.sgApplyContent}</td>
							</c:otherwise>
						</c:choose>
						<td width="70"><button type="button" name="accept1"
								class="btn btn-secondary">수락</button></td>
						<td width="70"><button type="button"
								class="btn btn-secondary" onclick="reject();">거절</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<script>
		function studyGroupList() {
			location.href = "studyGroupList.sg";
		}

		function apply() {
			$("#postForm").attr("action", "studyGroupApply.sga").submit();
		}
		
		$(function() {
			$("#applyList>tbody>tr>td>button[name=accept1]").click(
					function() {
						console.log($(this).parent().parent().children().children("#qwer").val());
					})
		})
		
		function accept(){
			var sgNo = ${studyGroup.sgNo}
			var sgaApplyNick = $(this).parent().parent().children().children("#qwer").val();
			

			if (cnt == 0) {
				alert("수락하실 멤버를 선택해주세요.");
			} else {
				if (confirm("선택하실 멤버를 수락하시겠습니까?")) {
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/acceptStudyGroup.sga",
						data : {
							sgaApplyNick, sgNo
						},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("수락완료");
								window.location = "${pageContext.request.contextPath}/studyGroupDetail.sg?sgNo=${studyGroup.sgNo}";
							}
						},
						error : function() {
							alert("서버통신 오류");
						}
					});
				}
			}
		}
		
		function reject(){
			var sgaCheck = document.getElementsByName('sgaCheck');
			
			var cnt = $("input[name='sgaCheck']:checked").length;
			var arr = new Array();
			
			for (var i = 0; i < sgaCheck.length; i++) {
				if (sgaCheck[i].checked == true) {
					arr[cnt] = sgaCheck[i].value;
					cnt++;
				}
			}

			if (cnt == 0) {
				alert("거절하실 멤버를 선택해주세요.");
			} else {
				if (confirm("선택하실 멤버를 거절하시겠습니까?")) {
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/rejectStudyGroup.sga",
						data : {
							arr
						},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("거절완료");
								window.location = "${pageContext.request.contextPath}/studyGroupDetail.sg?sgNo=${studyGroup.sgNo}";
							}
						},
						error : function() {
							alert("서버통신 오류");
						}
					});
				}
			}
		}
	</script>

	<div class="">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>