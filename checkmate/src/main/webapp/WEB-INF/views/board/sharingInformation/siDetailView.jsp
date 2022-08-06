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
ul {
	list-style: none;
	width: 100%;
	text-align: left;
}
img {
	max-width: 100%;
	height: auto;
}
#reply {
	word-break: break-all;
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
						<h1 class="fw-bolder mb-1">${b.informationTitle}</h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2"
							style="word-break: break-all;">Writer : ${b.userNick} |
							Views : ${b.informationView} | Date : ${b.informationDate}</div>
						<div class="text-muted fst-italic mb-2"
							style="word-break: break-all;">
							첨부파일 : <a href="${b.informationChangeName }"
								download="${b.informationOriginName }">${b.informationOriginName }</a>
						</div>
						<!-- Post categories-->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a> -->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
					</header>
					<!-- Post content-->
					<section class="mb-5" style="padding: 10px;">
						<p class="fs-5 mb-4">${b.informationContent}</p>
					</section>

					<c:if test="${loginUser.userId eq b.userId}">
						<div class="btn-group">
							<a class="btn btn-secondary" onclick="postFormSubmit(1)">글수정</a>
							<a class="btn btn-secondary" onclick="postFormSubmit(2)">글삭제</a>
						</div>
					</c:if>
				</article>
				<form id="postForm" method="post">
					<input type="hidden" name="informationNo"
						value="${b.informationNo}"> <input type="hidden"
						name="filePath" value="${b.informationChangeName }">
				</form>

				<script>
					function postFormSubmit(num) {
						if (num == 1) {
							$("#postForm").attr("action", "updateForm.si")
									.submit();
						} else {
							if (confirm("정말 삭제하시겠습니까??") == true) {
								$("#postForm").attr("action", "delete.si")
										.submit();
							} else {
								return false;
							}
						}
					}
				</script>

				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- Comment form-->
							<form class="mb-4">
								<div class="input-group mb-3">
									<c:choose>
										<c:when test="${ not empty loginUser }">
											<input type="text" class="form-control" id="insertContent"
												placeholder="댓글을 입력 해주세요." aria-label="Recipient's username"
												aria-describedby="button-addon2">
											<button class="btn btn-outline-secondary" type="button"
												id="button-addon2" onclick="addReply()">등록</button>
										</c:when>
										<c:otherwise>
											<input type="text" class="form-control" id="insertContent"
												placeholder="로그인이 필요합니다." aria-label="Recipient's username"
												aria-describedby="button-addon2">
											<button class="btn btn-outline-secondary disabled"
												type="button" id="button-addon2" onclick="addReply()">등록</button>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
							<div id="reply"></div>
						</div>
					</div>
				</section>
			</div>
			<div class="modal fade" id="editModal" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">댓글 수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body"></div>
						<div class="input-group mb-3">
							<span class="input-group-text">닉네임 : </span> <input type="text"
								class="form-control" id="editCheckId"
								aria-describedby="basic-addon3">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">원본 댓글
								내용을 복사하여 붙여넣기 하세요.</label>
							<textarea class="form-control" id="editCheckContent"></textarea>
						</div>

						<div class="mb-3">
							<label for="message-text" class="col-form-label">수정할 댓글
								내용을 입력 하세요.</label>
							<textarea class="form-control" id="editContent"></textarea>
						</div>


						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="editReply(editCheckId,editCheckContent,editContent);">수정하기</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니요</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="removeModal" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">댓글 삭제</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body"></div>
						<div class="input-group mb-3">
							<span class="input-group-text">닉네임 : </span> <input type="text"
								class="form-control" id="removeCheckId"
								aria-describedby="basic-addon3">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">삭제할 댓글
								내용을 복사하여 붙여넣기 하세요.</label>
							<textarea class="form-control" id="removeCheckContent"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="deleteReply(removeCheckId,removeCheckContent);">삭제하기</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니요</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<form action="search.si" method="get">
					<div class="card mb-4">
						<div class="card-header">Search</div>
						<div class="card-body">
							<div class="input-group">
								<input class="form-control" type="text" id="searchContent"
									name="searchContent" placeholder="검색할 제목을 입력 해주세요."
									aria-describedby="button-search" />
								<button class="btn btn-primary" id="button-search" type="submit">검색</button>
							</div>
						</div>
					</div>
				</form>
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">가장 많이 본 게시글 TOP 5</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<ol class="" style="text-align: left;">
							<c:forEach var="bl" items="${boardList }">
								<li><a href="detail.si?informationNo=${bl.informationNo}">${bl.informationTitle }</a></li>
							</c:forEach>
						</ol>
					</div>
				</div>

				<div class="card mb-4">
					<div class="card-header">댓글이 가장 많은 게시글 TOP 5</div>
					<div class="card-body" style="padding-bottom: 0px;">
						<ol class="" style="text-align: left;">
							<c:forEach var="rl" items="${replyList }">
								<li><a href="detail.si?informationNo=${rl.informationNo}">${rl.informationTitle }</a></li>
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>

			<script>
		    	$(function(){
		    		selectReplyList();
		    	})
		    	
		    	function deleteReply(id, content){
		    		$.ajax({
		    			url : "rdelete.si",
		    			data : {
		    				replyWriter : id.value,
		    				replyContent : content.value,
		    			},
		    			success : function(result){
		    				selectReplyList();
		    			},
		    			error : function(){
		    				console.log("통신실패");
		    			}
		    		})
		    	}
		    	
		    	function editReply(id, content, editContent){
		    		$.ajax({
		    			url : "redit.si",
		    			data : {
		    				replyWriter : id.value,
		    				replyContent : content.value,
		    				editContent : editContent.value,
		    			},
		    			success : function(result){
		    				selectReplyList();
		    			},
		    			error : function(){
		    				console.log("통신실패");
		    			}
		    		})
		    	}
		    	
		    	function addReply(){
    		
	    		if($("#insertContent").val().trim().length != 0){
	    			$.ajax({
	        			url : "rinsert.si",
	        			data : {
	        				refBno : ${b.informationNo},
	        				replyContent : $("#insertContent").val(),
	        				replyWriter : '${loginUser.userId}'
	        			},
	        			success : function(result){
	        				if(result=="Y"){
	        				selectReplyList();
							$("#insertContent").val("");        				
	        				}
	        			},
	        			error : function(){
	        				console.log("통신 실패")
	        			}
	        		})
		    		}else{
		    			$("#insertContent").val("");
		    			alertify.alert("댓글을 입력해주세요.")
		    		}
		    	}
		    	
		    	
		    	function selectReplyList(){ //댓글 전부를 불러오는 처리 
		    		$.ajax({
		    			url : "rlist.si",
		    			data : {
		    				informationNo : ${b.informationNo}
		    			},
							success : function(result){
							
							var resultStr="";
							var edit_resultStr="";
							var final_resultStr="";
							var nickCheck="true";
							var lUser="${loginUser.userNick}";
							
							for(var i=0; i<result.length;i++){
							var x = result[i].replyWriter;
							
							if(lUser != result[i].replyWriter) {
								resultStr+= "<div class=\"d-flex\">" +
									"<div class=\"flex-shrink-0\">" + 
										"<img class=\"rounded-circle\" src=\"" + result[i].replyProfile + "\" alt=\"...\" style=\"height:50px; width:50px;\"/>" +
									"</div>" + 
									
									"<ul>" +
									"<li>" +
									
									"<div style=\"width:100%; height:30px;\">" +
										"<div class=\"fw-bold\" style=\"float:left\">" + result[i].replyWriter + "</div>" +
										"<div  style=\"font-size:2px; float:right; padding-right:20px;\">" +
										result[i].replyDate + "&nbsp;&nbsp;" +
										"</div>" +
									"</div>" +
									"</li>" +
									"<li>" +
										"<span id=\"content\"> " + result[i].replyContent + "</span>" +
									
										"</li>" +
										"</ul>" +
										
								"</div>" +
								"<br>"
							} else if(lUser == result[i].replyWriter) {
								resultStr+= "<div class=\"d-flex\">" +
								"<div class=\"flex-shrink-0\">" + 
									"<img class=\"rounded-circle\" src=\"" + result[i].replyProfile + "\" alt=\"...\" style=\"height:50px; width:50px;\"/>" +
								"</div>" + 
								
								"<ul>" +
								"<li>" +
								
								"<div style=\"width:100%; height:30px;\">" +
									"<div class=\"fw-bold\" style=\"float:left\">" + result[i].replyWriter + "</div>" +
									"<div id=\"replyCheck\" style=\"font-size:2px; float:right; padding-right:20px;\">" +
									result[i].replyDate + "&nbsp;&nbsp;" +
// 									"<img id=\"editCheck\" src=\"resources/img/board/reply_edit.png\" style=\"hieght:18px; width:18px;\">"  + 
									"<button type=\"button\" class=\"btn btn-secondary btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#editModal\">" +
									"수정" +
									"</button>"+
									"&nbsp;&nbsp;" +
// 									"<img id=\"removeCheck\" src=\"resources/img/board/reply_remove.png\" style=\"hieght:18px; width:18px;\">"  + 
									"<button type=\"button\" class=\"btn btn-secondary btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#removeModal\">" +
									"삭제" +
									"</button>"+
									"</div>" +
								"</div>" +
								"</li>" +
								"<li>" +
									"<span id=\"content\"> " + result[i].replyContent + "</span>" +
								
									"</li>" +
									"</ul>" +
									
							"</div>" +
							"<br>"
							}
						}
		    				$("#reply").html(resultStr);
		    				$("#rcount").text(result.length);
		    			},
		    			error : function(){
		    				console.log("통신실패");
		    			}
		    		})
		    	}
		    </script>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>

<jsp:include page="../../common/footer.jsp" />
</body>
</html>