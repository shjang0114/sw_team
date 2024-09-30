<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>
<link href="<c:url value='/'/>css/styles.css" rel="stylesheet"
	type="text/css">

<div class="container">

	<!-- 좌측의 홈페이지 제목, 클릭 시 상단으로 이동-->
	<a class="navbar-brand" href="#hospital">Hospinet</a>

	<!-- 반응형으로 화면의 width 크기가 작아졌을 때 메뉴 버튼이 생기고, 클릭했을때 하단 하위 메뉴들이 생김-->
	<button
		class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
		type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
		aria-expanded="false" aria-label="Toggle navigation">
		Menu <i class="fas fa-bars"></i>
	</button>

	<!-- 우측의 하위 메뉴들로 클릭 시 각 href에 링크된 구역으로 이동 -->
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ms-auto">
			<li class="nav-item mx-0 mx-lg-1 relative-position"><a
				class="nav-link py-3 px-0 px-lg-3 rounded"
				onclick="toggleChatbotHelp()" style="cursor: pointer;">챗봇</a></li>
			<li class="nav-item mx-0 mx-lg-1"><a
				class="nav-link py-3 px-0 px-lg-3 rounded" data-bs-toggle="modal"
				data-bs-target="#quizModal" style="cursor: pointer;">건강퀴즈</a></li>
		</ul>
	</div>
</div>




<script>
	function toggleChatbotHelp() {
		var chatbotHelp = document.getElementById("chatbotHelp");
		if (window.getComputedStyle(chatbotHelp).display === "none") {
			chatbotHelp.style.display = "block";
		} else {
			chatbotHelp.style.display = "none";
		}
	}
</script>
<style>
.relative-position {
	position: relative;
}

.chatbot-help {
	position: absolute;
	top: 100%;
	left: calc(100% - 350px);
	width: 330px;
	height: 600px;
	background-color: #fff;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
	padding: 10px;
	display: none;
	z-index: 1000;
	overflow: hidden;
}

#chatbot-messages {
	width: 330px;
	height: 490px;
	overflow-y: scroll;
	padding: 10px;
	border-bottom: 1px solid #e0e0e0;
	display: flex;
	flex-direction: column;
}

.chatbot-inner {
	position: absolute;
	bottom: 10px;
	left: 10px;
	right: 10px;
}

#chatbot-input {
	width: calc(100% - 100px);
	border: 1px solid #e0e0e0;
	border-radius: 18px;
	padding: 10px;
	margin-right: 10px;
	float: left;
}

#chatbot-send {
	float: right;
	background-color: rgba(112, 77, 152, 0.7);
	color: #ffffff;
	border: none;
	border-radius: 18px;
	padding: 10px 20px;
	margin: 0;
	cursor: pointer;
}

#chatbot-send:hover {
	background-color: rgba(177, 142, 217, 1);
}

.chatbot-inner::after {
	content: '';
	clear: both;
	display: table;
}

#loading {
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	bottom: 98px;
}

/* 점의 스타일 개선 */
.dot {
	width: 5px;
	height: 5px;
	margin: 0 3px;
	background-color: #3498db;
	border-radius: 50%;
	opacity: 0.7; /* 투명도 추가 */
	animation: dotPulse 1.5s infinite ease-in-out both;
}

/* 점 애니메이션에 ‘transform-origin’ 속성과 ‘opacity’ 변화 추가 */
@keyframes dotPulse {
	0% {
		transform: scale(0.9);
		opacity: 0.7;
	}
	50% {
		transform: scale(1.4);
		opacity: 1;
	}
	100% {
		transform: scale(0.9);
		opacity: 0.7;
	}
}
/* 말풍선 스타일 */
.chat-message {
	max-width: 70%;
	padding: 10px;
	border-radius: 15px;
	margin-bottom: 5px;
	position: relative;
	font-size: 20px;
	font-weight: lighter;
	animation: growEffect 0.5s ease-in-out;
}

/* 사용자 메시지 스타일 */
.user-message {
	background-color: #CFACF7;
	color: white;
	align-self: flex-end;
	margin-right: 10px;
	border-bottom-right-radius: 0;
	transform-origin: bottom right;
}

.user-message::after {
	content: '';
	position: absolute;
	right: -6px;
	bottom: 0;
	width: 10px;
	height: 0px;
	background-color: #CFACF7;
	transform: translateY(-50%) rotate(45deg);
}

/* GPT-3.5 메시지 스타일 */
.gpt3-message {
	background-color: rgba(207, 172, 247, 0.5);
	color: #564366;
	align-self: flex-start;
	margin-left: 10px;
	border-bottom-left-radius: 0;
	transform-origin: bottom left;
}

.gpt3-message::after {
	content: '';
	position: absolute;
	left: -6px;
	bottom: 0;
	width: 10px;
	height: 0px;
	background-color: rgba(207, 172, 247, 0.5);
	transform: translateY(-50%) rotate(45deg);
}

.symptom-btn {
	margin: 5px;
	padding: 10px;
	background-color: #CFACF7;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
}

.symptom-btn:hover {
	background-color: rgba(187, 152, 227, 1);
}

#toggle-symptom-buttons {
	background-color: #CFACF7;
	color: white;
	padding: 10px 20px; /* 상하 10px, 좌우 20px 패딩 */
	border: none; /* 테두리 없음 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 마우스 오버 시 커서 변경 */
	margin-top: 10px; /* 상단 여백 */
	font-size: 20px;
}

#toggle-symptom-buttons:hover {
	background-color: rgba(187, 152, 227, 1);
}

.symptom-button-container {
	max-height: 450px; /* 컨테이너의 최대 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 활성화 */
	padding: 10px;
	margin-bottom: 10px; /* 추가적인 여백을 제공 */
	transition: all 0.0001s ease; /* 부드러운 전환 효과 */
}

#increase-font-size, #decrease-font-size {
	width: 45px; /* 너비 설정 */
	height: 45px; /* 높이 설정 */
	line-height: 45px;
	padding: 0;
	margin: 5px;
	background-color: #CFACF7;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 25px;
	text-align: center;
	justify-content: center; /* 가로축 중앙 정렬 */
	align-items: center; /* 세로축 중앙 정렬 */
}

#increase-font-size:hover, #decrease-font-size:hover {
	background-color: rgba(187, 152, 227, 1);
}

@keyframes growEffect {
	0% {
		transform: scale(1);
	}
	100% {
		transform: scale(0);
	}
}
</style>

<div id="chatbotHelp" class="chatbot-help">

	<div class="chatbot-inner">
		<div id="chatbot-messages"></div>
		
		<div id="loading" style="display: none;">
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
		</div>
		
		<div id="symptom-buttons" class="symptom-button-container"
			style="padding: 10px;">
			<button class="symptom-btn" data-symptom="머리가 쑤신데">머리가 쑤심</button>
			<button class="symptom-btn" data-symptom="어지러운데">머리가 어지러움</button>
			<button class="symptom-btn" data-symptom="머리가 골절인데">머리가 골절</button>
			<button class="symptom-btn" data-symptom="목이 따가운데">목이 따가움</button>
			<button class="symptom-btn" data-symptom="목이 골절인데">목이 골절</button>
			<button class="symptom-btn" data-symptom="목이 쑤신데">목이 쑤심</button>
			<button class="symptom-btn" data-symptom="가슴이 따가운데">가슴이 따가움</button>
			<button class="symptom-btn" data-symptom="가슴이 골절인데">가슴이 골절</button>
			<button class="symptom-btn" data-symptom="배가 찌르듯이 아픈데">배가
				찌르듯이 아픔</button>
			<button class="symptom-btn" data-symptom="성기가 따가운데">성기가 따가움</button>
			<button class="symptom-btn" data-symptom="성기가 골절인데">성기가 골절</button>
			<button class="symptom-btn" data-symptom="어깨가 쑤시듯이 아픈데">어깨가
				쑤시듯이 아픔</button>
			<button class="symptom-btn" data-symptom="어깨가 골절인데">어깨가 골절</button>
			<button class="symptom-btn" data-symptom="팔이 쑤시듯이 아픈데">팔이
				쑤시듯이 아픔</button>
			<button class="symptom-btn" data-symptom="팔이 골절인데">팔이 골절</button>
			<button class="symptom-btn" data-symptom="손이 따가운데">손이 따가움</button>
			<button class="symptom-btn" data-symptom="손이 쑤시듯이 아픈데">손이
				쑤시듯이 아픔</button>
			<button class="symptom-btn" data-symptom="손이 골절인데">손이 골절</button>
			<button class="symptom-btn" data-symptom="골반이 쑤신데">골반이 쑤심</button>
			<button class="symptom-btn" data-symptom="골반이 골절인데">골반이 골절</button>
			<button class="symptom-btn" data-symptom="허벅지가 쑤신데">허벅지가 쑤심</button>
			<button class="symptom-btn" data-symptom="허벅지가 골절인데">허벅지가 골절</button>
			<button class="symptom-btn" data-symptom="무릎이 따가운데">무릎이 따가움</button>
			<button class="symptom-btn" data-symptom="무릎이 골절인데">무릎이 골절</button>
			<button class="symptom-btn" data-symptom="정강이가 쑤신데">정강이가 쑤심</button>
			<button class="symptom-btn" data-symptom="발목이 쑤신데">발목이 쑤심</button>
			<button class="symptom-btn" data-symptom="발목이 골절인데">발목이 골절</button>
			<button class="symptom-btn" data-symptom="발이 쑤신데">발이 쑤심</button>
			<button class="symptom-btn" data-symptom="발이 골절인데">발이 골절</button>
			<button class="symptom-btn" data-symptom="등이 따가운데">등이 따가움</button>
			<button class="symptom-btn" data-symptom="엉덩이가 쑤신데">엉덩이가 쑤심</button>
			<button class="symptom-btn" data-symptom="엉덩이가 골절인데">엉덩이가 골절</button>
		</div>
		
		<button id="toggle-symptom-buttons">숨기기</button>
		<button id="increase-font-size">+</button>
		<button id="decrease-font-size">-</button>
		
		<input type="text" id="chatbot-input" placeholder="메시지 입력">
		<button id="chatbot-send">보내기</button>
	</div>
</div>

<!-- Bootstrap JS -->
<script src="path/to/bootstrap.min.js"></script>