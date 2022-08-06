<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디그룹 생성</title>
<style>
	#enrollContainer {
		width : 50%;
		margin: 0 auto;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<br><br><br><br><br>
	
	<form id="enrollContainer" action="insert.sg" method="post">
	<input type="hidden" name="sgOwnerNick" value="${loginUser.userNick}">
		<div class="input-group mb-3">
			<div class="form-floating">
				<input type="text" class="form-control" id="sgName" name="sgName" placeholder="스터디그룹 이름">
    			<label for="floatingInputGroup1">스터디그룹 이름</label>
  			</div>
  			<button class="btn btn-outline-secondary" type="button" id="nameCheck">중복확인</button>
		</div>
		<br>
		<div class="form-floating mb-3">
		  	<input type="text" class="form-control" name="sgGoal" placeholder="스터디그룹 목표">
		  	<label for="floatingInput">스터디그룹 목표</label>
			<div class="form-text">ex) 정보처리기사 실기 / 토익 800점</div>
		</div>
		<br>
		<div class="form-floating">
			<textarea class="form-control" placeholder="스터디그룹 설명" name="sgContent" style="height: 200px"></textarea>
			<label for="floatingTextarea2">스터디그룹 설명</label>
			<div class="form-text">ex) 주3회 출석 필수입니다 / 오프라인 만남은 OO에서</div>
		</div>
		<br>
		<div class="form-floating">
			<select class="form-select" name="sgMax" aria-label="Floating label select example">
				<option selected>선택</option>
		    	<option value="1">1</option>
			    <option value="2">2</option>
			    <option value="3">3</option>
			    <option value="4">4</option>
			    <option value="5">5</option>
			    <option value="6">6</option>
			    <option value="7">7</option>
			    <option value="8">8</option>
			    <option value="9">9</option>
			    <option value="10">10</option>
			</select>
			<label for="floatingSelect">스터디그룹 인원수</label>
		</div>
		<br>
		<div class="form-floating">
			<select class="form-select" name="sgCategory" aria-label="Floating label select example">
				<option selected>선택</option>
		    	<option value="자격증">자격증</option>
			    <option value="시험">시험</option>
			    <option value="취업">취업</option>
			</select>
			<label for="floatingSelect">스터디그룹 카테고리</label>
		</div>
		<br>
		<div class="form-floating">
			<select class="form-select" name="sgLocation" aria-label="Floating label select example">
				<option selected>선택</option>
		    	<option value="서울 서북권(마포/서대문/은평)">서울 서북권(마포/서대문/은평)</option>
			    <option value="서울 서남권(강서/관악/구로/금천/동작/양천/영등포)">서울 서남권(강서/관악/구로/금천/동작/양천/영등포)</option>
			    <option value="서울 도심권(용산/종로/중구)">서울 도심권(용산/종로/중구)</option>
			    <option value="서울 동북권(강북/광진/노원/도봉/동대문/성동/성북)">서울 동북권(강북/광진/노원/도봉/동대문/성동/성북)</option>
			    <option value="서울 동남권(강남/강동/서초/송파)">서울 동남권(강남/강동/서초/송파)</option>
			</select>
			<label for="floatingSelect">스터디그룹 지역</label>
		</div>	
		<br>
		<div class="d-grid gap-2">
			<button class="btn btn-primary" type="submit">스터디그룹 생성</button>
			<button class="btn btn-danger" type="reset">취소</button>
		</div>
	</form>
	
	<br><br>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		//스터디그룹 이름 중복확인
		$("#nameCheck").click(function(){
    		$.ajax({
	    		url : "nameCheck.sg",
	    		data : {
	    			sgName : $("#sgName").val()
	    		},
	    		success : function(result){
	    			console.log(result)
	    			if(result=="N"){
	    				alert("사용 불가능한 스터디그룹 이름입니다. 다시 입력해 주세요");
	    				$("#sgName").val('');
	    				$("#sgName").focus();
	    			}else{
	    				alert("사용 가능한 스터디그룹 이름입니다.");
	    			}
	    		},
	    		error : function(result){
	    			console.log(result)
	    			console.log("오류");
	    		}
    		})
   		 });
	</script>
	
</body>
</html>