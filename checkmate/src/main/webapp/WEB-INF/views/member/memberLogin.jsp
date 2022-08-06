<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style>
            
 	   .login-header{
           display:flex;
           justify-content: center;
       }
       form{
           padding:10px;
       }
       .input-box{
           position:relative;
           margin:10px 0;
       }
       .input-box > input{
           background:transparent;
           border:none;
           border-bottom: solid 1px #ccc;
           padding:20px 0px 5px 0px;
           font-size:14pt;
           width:100%;
       }
       input::placeholder{
           color:transparent;
       }
       input:placeholder-shown + label{
           color:#aaa;
           font-size:14pt;
           top:15px;

       }
       input:focus + label, label{
           color:#8aa1a1;
           font-size:10pt;
           pointer-events: none;
           position: absolute;
           left:0px;
           top:0px;
           transition: all 0.2s ease ;
           -webkit-transition: all 0.2s ease;
           -moz-transition: all 0.2s ease;
           -o-transition: all 0.2s ease;
       }

       input:focus, input:not(:placeholder-shown){
           border-bottom: solid 1px #8aa1a1;
           outline:none;
       }
       #loginBtn{
           background-color: #CD8B45;
           border:none;
           color:white;
           border-radius: 5px;
           width:100%;
           height:50px;
           font-size: 14pt;
           margin-top:20px;
       }
       #forgot{
           text-align: right;
           margin:10px 0px;
       }
       #kakaoBtn{
       	width:100%;
       	height:50px;
       }
           
            
	</style>	
</head>
<body>

	<c:if test="${not empty alertMsg}">
		<script>
			alertify.alert("서비스 요청 성공 ","${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>

	<c:choose>
		<c:when test="${ empty loginUser }">
			<a data-toggle="modal" data-target="#loginModal">로그인</a>
			<a href="memberEnrollForm.me">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="#">마이페이지</a>
			<a href="logout.me">로그아웃</a>
		</c:otherwise>
	</c:choose>
	
	
	
	
	
	
	
	<div class="modal fade" id="loginModal">
        <div class="modal-dialog">
            <div class="modal-content">
                
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    
	                <div class="login-header">
	                    <h2>Login</h2>
	                </div>
                    <div class="input-box">
		                <input id="username" type="text" name="userId" placeholder="아이디">
		                <label for="username">아이디</label>
		            </div>
                    <div class="input-box">
		                <input id="password" type="password" name="userPw" placeholder="비밀번호">
		                <label for="password">비밀번호</label>
		                
		            <div id="forgot">
		            <a href="" style="color: black">아이디</a>/<a href="" style="color: black">비밀번호 찾기</a>
		            </div>
                    <button type="submit" id="loginBtn">로그인</button>
                    <br><br>
		            <a href="javascript:kakaoLogin();"><img id="kakaoBtn" src="./resources/images/kakao_login_medium_wide.png"/></a>    
                   

                </form>
            </div>
        </div>
    </div>
    
    <script>
    	window.Kakao.init('25def9456817be2bd9d449ded95b8362');
    	
    	function kakaoLogin(){
        	window.Kakao.Auth.login({
        		scope:'profile_nickname,profile_image,account_email',
        		success: function(authObj){
        			console.log(authObj);
        			window.Kakao.API.request({
        				url:'/v2/user/me',
        				success: res => {
        					const kakao_account = res.kakao_account;
        					console.log(kakao_account);
        				}
        			});
        		}
        	});
        	
    	};
    	
    
    </script>
</body>
</html>