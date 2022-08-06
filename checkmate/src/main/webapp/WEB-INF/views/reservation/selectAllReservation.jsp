<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
  <title>스터디 예약센터</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
  <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->

    <link href="resources/css/theme1.css" rel="stylesheet" />
	<jsp:include page="../common/header.jsp"/>
  </head>


  <body>
	<br><br><br><br>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      
      <section id="booking">
        <div class="bg-holder" style="background-image:url(resources/img/bg-masthead.jpg);background-position:center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row">
            <div class="col-12 py-8 text-white">
              <div class="d-flex flex-column flex-center">
                <h2 class="text-white fs-2 fs-md-3">체크메이트</h2>
                <br><br><br><br>
                <h1 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">스터디센터 예약</h1>
                <h2 class="text-white fs-2 fs-md-3">아침 9시부터 저녁 9시까지 운영/여러번 예약 가능/중복 예약 안됨</h2>
              </div>
              <form class="row gy-2 gx-md-2 gx-lg-4 flex-center my-6" action="insertReservation.ro" method="post" id="hidden">
              <div>
              
              </div>
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="inlineFormSelectPref">스터디센터</label>
                  <select class="form-select" id="inlineFormSelectPref" name="roomCenterName">
                    <option selected="" >스터디센터</option>
                  <c:forEach var="r" items="${list}"> 
                    <option value="${r.roomCenterName}">${r.roomCenterName}</option>
                  </c:forEach>
                  </select>
                </div>
               <div class="col-6 col-md-3" id="roomSize">
                  <label class="visually-hidden" for="autoSizingSelect">방크기(인원 수)</label>
                  <select class="form-select" id="autoSizingSelect" name="roomSize">
                    <option selected="">방크기(인원 수)</option>
                     
                  </select>
                </div> 
                <div class="col-6 col-md-3" id="roomName">
                  <label class="visually-hidden" for="inlineFormSelectPref2">방이름</label>
                  <select class="form-select" id="inlineFormSelectPref2" name="roomName">
                    <option selected="" >방이름</option>

                  </select>
                </div>
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="date" placeholder="시작시간">날짜</label>
                  <div class="input-group"  placeholder="날짜">
                    <input type="text" class="form-control" id="date1" placeholder="날짜" name="reservationDate"/>
                  </div>
                </div>
                <div class="col-6 col-md-3">
                <label class="visually-hidden" for="autoSizingSelect2">시작시간</label>
                <select class="form-select" id="autoSizingSelect2" name="reservationStartTime">
                  <option selected="">시작시간</option>
                  <c:forEach var="i" begin="9" end="20">
                  <option value="${i}">${i}</option>
                  </c:forEach>
                </select>
                </div>
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="autoSizingSelect3">사용시간</label>
                  <select class="form-select" id="autoSizingSelect3" name="reservationUsedTime">
                    <option selected="">사용시간</option>
                    <c:forEach var="r" begin="1" end="12">
                    <option value="${r}">${r}</option>
					</c:forEach>
                  </select>
                  </div>
                <div class="col-6 col-md-auto">
                  <c:if test="${not empty loginUser}">
                  <button class="btn btn-lg btn-primary" type="submit" id="confirmBtn">예약</button>
                  </c:if>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>

    </main>

    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
  </body>
  <script>
    var dtt = document.getElementById('date1')
    dtt.onfocus = function (event) {
        this.type = 'date';
        this.focus();
    }
  </script>
  <script>

  	$(function(){
  		$("#inlineFormSelectPref").change(function(){
  			var temp = $("#inlineFormSelectPref").val();
  			
  			
  			$.ajax({
  				url : "reserveRoomSize.ro",
  				data : {
  					roomCenterName : temp
  				},
  				success: function(list){
  					var roomSizeList ="";

  					for( var i in list){
  						roomSizeList +="<option value='"+list[i].roomSize+"'>"+ list[i].roomSize +"명</option>";
  					}
  					
  					$("#roomSize>select").html(roomSizeList);	
  					
  				},
  				error : function(){
  					alert("실패");
  				}
  			})
  			
  		})
  	})
  	$(function(){
  		$("#autoSizingSelect").change(function(){
  			var temp = $("#inlineFormSelectPref").val();
  			var temp1 = $("#autoSizingSelect").val();
  			
  			$.ajax({
  				url : "reserveRoomName.ro",
  				data : {
  					roomCenterName : temp,
  					roomSize : temp1 
  				},
  				success: function(list){
  					var roomNameList ="";
  					console.log(list);
  					for( var i in list){
  						roomNameList +="<option value='"+list[i].roomName+"'>"+ list[i].roomName +"</option>";
  						console.log(list[i].roonNo);
  					}
  					
  					$("#roomName>select").html(roomNameList);
  					
  				},
  				error : function(){
  					alert("실패");
  				}
  			})
  			
  		})
  	})
  	$("#confirmBtn").click(function(){
        if(!$("#inlineFormSelectPref").children("option:selected").attr("value")){
            alert("스터디센터를 선택해주세요");
            return false;
        }else if(!$("#autoSizingSelect").children("option:selected").attr("value")){
        	alert("방크기를 선택해주세요");
        	return false;
        }else if(!$("#inlineFormSelectPref2").children("option:selected").attr("value")){
        	alert("방을 선택해주세요");
        	return false;
        }else if($("#date1").val().length<1){
        	alert("날짜를 선택해주세요");
        	return false;
        }else if(!$("#autoSizingSelect2").children("option:selected").attr("value")){
        	alert("시작시간을 선택해주세요");
        	return false;
        }else if(!$("#autoSizingSelect3").children("option:selected").attr("value")){
        	alert("사용시간을 선택해주세요");
        	return false;
        }else{
        	return true;
        }
  	});
  </script>


</html>