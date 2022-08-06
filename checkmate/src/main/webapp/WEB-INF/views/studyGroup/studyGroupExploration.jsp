<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디그룹 둘러보기</title>
<style>
#explorationContainer {
	width: 50%;
	margin: 0 auto;
}
</style>
</head>
<body>

	<div id="explorationContainer">
		<h1><mark>한 자리 남았어요☝️</mark></h1>
		<br>
		<div class="row row-cols-1 row-cols-md-3">
		   
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
				<input type="hidden" name="sgNo" id="sgNo" value="${oneStudyGroupList[0].sgNo }">
					<div class="card-header bg-transparent border-primary">${oneStudyGroupList[0].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${oneStudyGroupList[0].sgContent}</h5>
						<p class="card-text">${fn:substring(oneStudyGroupList[0].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
			
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">${oneStudyGroupList[1].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${oneStudyGroupList[1].sgContent}</h5>
						<p class="card-text">${fn:substring(oneStudyGroupList[1].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
					<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
			
			
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">${oneStudyGroupList[2].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${oneStudyGroupList[2].sgContent}</h5>
						<p class="card-text">${fn:substring(oneStudyGroupList[2].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
		</div>
		<br><br>
		<h1><mark>최신 스터디그룹⏱</mark></h1>
		<br>
		<div class="row row-cols-1 row-cols-md-3">
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">${studyGroupList[1].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${studyGroupList[1].sgContent}</h5>
						<p class="card-text">${fn:substring(studyGroupList[1].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
					<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
			
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">${studyGroupList[1].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${studyGroupList[1].sgContent}</h5>
						<p class="card-text">${fn:substring(studyGroupList[1].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
					<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
			
			<form action="studyGroupDetail.sg">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">${studyGroupList[1].sgName}</div>
					<div class="card-body">
						<h5 class="card-title">${studyGroupList[1].sgContent}</h5>
						<p class="card-text">${fn:substring(studyGroupList[1].sgLocation, 0, 6)}</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
					<button type="submit" class="btn btn-primary">상세보기</button>
					</div>
				</div>
			</div>
			</form>
		</div>
		
	</div>


</body>
</html>