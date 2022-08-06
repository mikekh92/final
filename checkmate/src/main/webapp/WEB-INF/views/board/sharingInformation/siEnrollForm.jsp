<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link href="resources/css/sharingInformation.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="resources/naver-smarteditor2/demo/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body style="padding-top: 7rem;">
	<main role="main" class="container back-image">
		<form name="form" method="POST" action="insert.si"
			enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<input type="hidden" name="informationCategory" value="정보공유">
			<input class="form-control col-3 text-center" type="text"
				value="정보공유 게시판" aria-label="readonly input example" readonly>
			<div class="pt-1"></div>
			<input type="text" name="informationTitle" placeholder="제목을 입력하세요"
				style="border-radius: 5px; width: 100%; padding: 5px;">
			<div class="pt-1">
				<textarea class="form-control" name="informationContent"
					id="informationContent" rows="20" cols="10"
					placeholder="내용을 입력해주세요" style="width: 100%;"></textarea>
			</div>
			<div class="mb-3">
				<input class="form-control" type="file" name="upfile" multiple>
			</div>
			<div class="pt-1 text-right float-right">
				<button class="btn btn btn-success float-right" type="submit" onclick="save();"
					style="width: 10%; padding: 5px;">등록</button>
				<button class="btn btn btn-success float-right" type="reset"
					style="width: 10%; padding: 5px;">취소</button>
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
	
		function save(){
			oEditors.getById["informationContent"].exec("UPDATE_CONTENTS_FIELD", []);  
			var content = document.getElementById("smartEditor").value;
			alert(document.getElementById("informationContent").value); 
			return; 
		}
	</script>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>