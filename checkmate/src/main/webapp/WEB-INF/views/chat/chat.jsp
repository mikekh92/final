<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title> 

<style>
#chatContainer {
	border: 1px solid black;
	width: 90%;
	height: 500px;	
	margin-left: 5%;
}

#chatHeader {
	border: 1px solid black;
	height: 10%;
	text-align: center;
}

#chatBody {
	border: 1px solid black;
	height: 80%;
}

#chatFooter {
	border: 1px solid black;
	height: 10%;
}
</style>

</head>

<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<body>

	<div id="chatContainer">
		<div id="chatHeader"><strong>${studyGroup.sgName}</strong></div>

		<div id="chatBody">
				<c:forEach items="${firstList}" var="chat">
					<!-- 내 채팅일 경우 -->
					<c:if test="${loginMember.userNick eq chat.userNick}">
						<li data-no="${chat.chatNo}" class="me pr-2"><strong>${chat.userNick}</strong>
							<div class="me ">
								<strong style="display: inline;" class="align-self-end">
									<fmt:formatDate value="${chat.chatSendDate}"
										pattern="yy/MM/dd HH:mm" />
								</strong>
								<p class="myChat text-left p-2">${chat.chatContent}</p>
							</div></li>
					</c:if>

					<!-- 다른 사람의 채팅일 경우 -->
					<c:if test="${loginMember.userNick ne chat.userNick}">
						<li data-no="${chat.chatNo}" class="pl-2"><strong>${chat.userNick}</strong>
							<div class="row ml-0">
								<p class="otherChat bg-light p-2">${chat.chatContent}</p>
								<strong class="align-self-center"> <fmt:formatDate
										value="${chat.chatSendDate}" pattern="yy/MM/dd HH:mm" />
								</strong>
							</div></li>
					</c:if>
				</c:forEach>
		</div>
		<div id="chatFooter">
			<!-- form div 확인  -->
			<div class="input-group mb-3" style="height: 100%;">
				<input type="text" id="message" class="form-control"
					placeholder="메시지를 입력하세요" aria-label="메시지를 입력하세요"
					aria-describedby="button-addon2"
					onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
				<!-- <textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea> -->
				<button class="send btn btn-outline-secondary" type="button"
					id="btnSend" onclick="webSocket.sendChat()">전송</button>
			</div>
		</div>
	</div>
	
	<script>
		var webSocket = {
			init : function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat : function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
			},
			receiveMessage : function(str) {
				$('#chatBody').append('<div>' + str + '</div>');
			},
			closeMessage : function(str) {
				$('#chatBody').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect : function() {
				this._socket.close();
			},
			_initSocket : function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage : function(str) {
				this._socket.send(str);
			}
		};
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({
				url : '<c:url value="/chat" />'
			});
		});
	</script>
	
	
</body>
</html>