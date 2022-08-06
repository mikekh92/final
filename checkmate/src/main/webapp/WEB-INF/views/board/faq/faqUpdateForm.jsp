<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<link href="resources/css/sharingInformation.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="resources/naver-smarteditor2/demo/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body style="padding-top: 7rem;">
	<jsp:include page="../../common/header.jsp" />
	<main role="main" class="container back-image">
		<!-- 		<form name="form" method="POST" action="/bulletin_wr01"> -->
		<form name="form" method="POST" action="faqupdate.no"
			enctype="multipart/form-data">
			<input type="hidden" name="faqNo" value="${f.faqNo }">
			<input class="form-control col-4 text-center float-left" type="text"
				value="작성자" readonly> <input
				class="form-control col-4 text-center float-left" type="text"
				value="등록일" readonly> <input
				class="form-control col-4 text-center" type="text" value="조회수"
				readonly> 
				<input class="form-control col-4 text-center float-left" type="text" value="${f.userNick}" aria-label="input example" readonly> 
				<input class="form-control col-4 text-center float-left" type="text" value="${f.date}" aria-label="input example" readonly>
				<input class="form-control col-4 text-center" type="text"
				value="${f.view}" readonly>
			<div class="pt-1"></div>
			<input type="text" name="faqTitle" placeholder="제목을 입력하세요."
				value="${f.faqTitle}"
				style="border-radius: 5px; width: 100%; padding: 5px;"> <br>

			<div class="pt-1">
				<textarea class="form-control" name="faqContent"
					id="informationContent" rows="20" cols="10"
					placeholder="내용을 입력해주세요" style="width: 100%;">${f.faqContent}</textarea>

				<%-- 				<textarea id="summernote" name="informationContent">${b.informationContent}</textarea> --%>
			</div>
			


			

			<div class="btn-group">
				<button type="submit" onclick="save();" class="btn btn-secondary">수정하기</button>
				<button type="button" class="btn btn-secondary"
					onclick="javascript:history.go(-1);">이전으로</button>
			</div>
		</form>
	</main>
	<script>
		var oEditors = [];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "informationContent",
					sSkinURI : "resources/naver-smarteditor2/demo/SmartEditor2Skin.html",
					fCreator : "createSEditor2"
				});

		function save() {
			oEditors.getById["informationContent"].exec(
					"UPDATE_CONTENTS_FIELD", []);
			var content = document.getElementById("smartEditor").value;
			alert(document.getElementById("informationContent").value);
			return;
		}
	</script>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>