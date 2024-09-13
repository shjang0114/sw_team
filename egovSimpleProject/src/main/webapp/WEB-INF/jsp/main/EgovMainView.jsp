<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<title>HOSPINET</title>
<link href="<c:url value='/'/>css/styles.css" rel="stylesheet"
	type="text/css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
	<!-- 전체 레이어 시작 -->

	<div id="wrap">
		<!-- header 시작 -->
		<div id="header_mainsize">
			<nav
				class="navbar navbar-expand-lg bg-male text-uppercase fixed-top gender-color"
				id="mainNav"
				style="height: 80px; transition: background-color 0.5s ease, color 0.5s ease;">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /> </nav>
		</div>
		<!-- //header 끝 -->
		<!-- container 시작 -->
		<div id="main_container" style="background-color: #F1F3F5;">

			<!-- hospital 섹션 -->
			<section class="page-section hospital" id="hospital">
			<div class="container">
				<br>

				<div class="row justify-content-center">

					<div class="col-md-6 col-lg-4 mb-5"
						style="position: relative; display: flex; justify-content: center; align-items: center; height: 100%; transform: translateY(-25px);">


						<!-- 인체 모양-->
						<c:url value='/images/human.png' var="imgSrc" />
						<img src="${imgSrc}" alt="Alternative Text"
							style="width: 90%; height: 90%;" />

						<!-- 성별 체인지 버튼 -->
						<div id="Male" class="position-absolute image-transition"
							style="top: 1%; left: 3.5%; display: block;">
							<c:url value='/images/Male.png' var="Male" />
							<img id="MaleImg" src="${Male}" alt="Alternative Text"
								style="width: 50px; height: 50px;" />
						</div>
						<div id="Female" class="position-absolute image-transition"
							style="top: 0%; left: 2%; display: none;">
							<c:url value='/images/Female.png' var="Female" />
							<img id="FemaleImg" src="${Female}" alt="Alternative Text"
								style="width: 60px; height: 60px;" />
						</div>
						<div class="position-absolute"
							style="top: 10%; left: 9%; transform: translate(-50%, -50%);">
							<button id="genderchange-rotate-button" class="btn"
								style="width: 50px; height: 50px; border-radius: 50%; position: relative;">
								<div id="genderchange-rotate-image-container"
									style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
									<c:url value='/images/genderchangeBtn.png'
										var="genderchangeBtnimgSrc" />
									<img id="gender-rotate-image" src="${genderchangeBtnimgSrc}"
										alt="Alternative Text"
										style="width: 50px; height: 50px; transition: transform 0.3s ease;" />
								</div>
							</button>
						</div>

						<!-- 전후면 체인지 버튼 / 클릭시 전후면 표시-->
						<div class="position-absolute front"
							style="top: 4%; left: 76.5%; display: block;">
							<h6>전면</h6>
						</div>
						<div class="position-absolute back"
							style="top: 4%; left: 76.5%; display: none;">
							<h6>후면</h6>
						</div>
						<div class="position-absolute"
							style="top: 10%; left: 80%; transform: translate(-50%, -50%);">
							<button id="rotate-button" class="btn"
								style="width: 50px; height: 50px; border-radius: 50%; position: relative;">
								<div id="rotate-image-container"
									style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
									<c:url value='/images/changeBtn.png' var="changeBtnimgSrc" />
									<img id="rotate-image" src="${changeBtnimgSrc}"
										alt="Alternative Text"
										style="width: 50px; height: 50px; transition: transform 0.3s ease;" />
								</div>
							</button>
						</div>

						<!-- 사용법 구간-->
						<div class="position-absolute gender-color bg-male"
							style="width: 450px; height: 600px; left: -110%; border-radius: 10%; transition: background-color 0.5s ease, color 0.5s ease;">
							<h2 class="text-center"
								style="position: relative; top: 5%; color: azure;">사용법을
								알려드려요!</h2>
							<div class="position-absolute text-center"
								style="width: 400px; height: 450px; top: 54%; left: 50%; background-Color: white; transform: translate(-50%, -50%); border-radius: 10%;">
								<div>
									<h3 class="gender-color2 color-male"
										style="position: relative; top: 50px; transition: color 0.5s ease">아픈
										부분을 클릭해주세요</h3>
									<h3 class="gender-color2 color-male"
										style="position: relative; top: 80px; transition: color 0.5s ease">
										질문에 답한 뒤<br>완료 버튼을 눌러주세요
									</h3>
									<h3 class="gender-color2 color-male"
										style="position: relative; top: 110px; transition: color 0.5s ease">
										지도를 보고<br>병원을 확인해주세요
									</h3>
								</div>
							</div>
						</div>

						<!-- 전면 버튼 시작-->

						<!-- 머리 버튼 -->
						<div id="head-btn" class="position-absolute translate-middle"
							style="top: 7%; left: 49.9%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 70px; height: 90px; border-radius: 50%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal1"></button>
						</div>

						<!-- 목 버튼 -->
						<div id="neck-btn" class="position-absolute translate-middle"
							style="top: 15%; left: 49.9%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 50px; height: 40px; border-radius: 50%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal2"></button>
						</div>

						<!-- 왼쪽 어깨 버튼 -->
						<div id="shoulder-btn" class="position-absolute translate-middle"
							style="top: 20%; left: 34%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 70px; height: 30px; border-radius: 50%; transform: rotate(-25deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal3"></button>
						</div>

						<!-- 오른쪽 어깨 버튼 -->
						<div id="shoulder-btn" class="position-absolute translate-middle"
							style="top: 20%; left: 66.5%;">
							<button class="btn btn-primary btn-opacity"s
								style="width: 70px; height: 30px; border-radius: 50%; transform: rotate(25deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal3"></button>
						</div>

						<!-- 가슴 버튼 -->
						<div id="chest-btn"
							class="position-absolute translate-middle front"
							style="top: 24.5%; left: 49.9%; display: block;">
							<button class="btn btn-primary btn-opacity"
								style="width: 120px; height: 70px; border-radius: 40%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal8"></button>
						</div>

						<!-- 복부 버튼 -->
						<div id="abdomen-btn"
							class="position-absolute translate-middle front"
							style="top: 38%; left: 49.9%; display: block;">
							<button class="btn btn-primary btn-opacity"
								style="width: 120px; height: 140px; border-radius: 30%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal9"></button>
						</div>

						<!-- 왼쪽 팔 윗 부분 버튼 -->
						<div id="upper_arm-btn" class="position-absolute translate-middle"
							style="top: 28%; left: 30%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 90px; border-radius: 50%; transform: rotate(5deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal4"></button>
						</div>

						<!-- 왼쪽 팔꿈치 버튼 -->
						<div id="elbow-btn" class="position-absolute translate-middle"
							style="top: 36%; left: 27.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 32px; height: 30px; border-radius: 50%; transform: rotate(8deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal5"></button>
						</div>

						<!-- 왼쪽 팔 아랫 부분 버튼 -->
						<div id="lower_arm-btn" class="position-absolute translate-middle"
							style="top: 44%; left: 23%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 20px; height: 90px; border-radius: 50%; transform: rotate(14deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal6"></button>
						</div>

						<!-- 왼손 버튼 -->
						<div id="hand-btn" class="position-absolute translate-middle"
							style="top: 55%; left: 17%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 35px; height: 60px; border-radius: 50%; transform: rotate(14deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal7"></button>
						</div>

						<!-- 오른쪽 팔 윗 부분 버튼 -->
						<div id="upper_arm-btn" class="position-absolute translate-middle"
							style="top: 28%; left: 70%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 90px; border-radius: 50%; transform: rotate(-5deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal4"></button>
						</div>

						<!-- 오른쪽 팔꿈치 버튼 -->
						<div id="elbow-btn" class="position-absolute translate-middle"
							style="top: 36%; left: 72.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 32px; height: 30px; border-radius: 50%; transform: rotate(-8deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal5"></button>
						</div>

						<!-- 오른쪽 팔 아랫 부분 버튼 -->
						<div id="lower_arm-btn" class="position-absolute translate-middle"
							style="top: 44%; left: 77%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 20px; height: 90px; border-radius: 50%; transform: rotate(-14deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal6"></button>
						</div>

						<!-- 오른손 버튼 -->
						<div id="hand-btn" class="position-absolute translate-middle"
							style="top: 55%; left: 83.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 35px; height: 60px; border-radius: 50%; transform: rotate(-14deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal7"></button>
						</div>

						<!-- 소중이 버튼 -->
						<div id="genital-btn"
							class="position-absolute translate-middle front"
							style="top: 52%; left: 49.9%; display: block;">
							<button class="btn btn-primary btn-opacity"
								style="width: 60px; height: 70px; border-radius: 50%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal11"></button>
						</div>

						<!-- 왼쪽 골반 부분 버튼 -->
						<div id="pelvis-btn"
							class="position-absolute translate-middle front"
							style="top: 53%; left: 37%; display: block;">
							<button class="btn btn-primary btn-opacity"
								style="width: 35px; height: 90px; border-radius: 50%; transform: rotate(-7deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal10"></button>
						</div>

						<!-- 오른쪽 골반 부분 버튼 -->
						<div id="pelvis-btn"
							class="position-absolute translate-middle front"
							style="top: 53%; left: 63.7%; display: block;">
							<button class="btn btn-primary btn-opacity"
								style="width: 35px; height: 90px; border-radius: 50%; transform: rotate(7deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal10"></button>
						</div>

						<!-- 왼쪽 허벅지 부분 버튼 -->
						<div id="thighs-btn" class="position-absolute translate-middle"
							style="top: 63%; left: 40.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 40px; height: 67px; border-radius: 50%; transform: rotate(-2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal12"></button>
						</div>

						<!-- 오른쪽 허벅지 부분 버튼 -->
						<div id="thighs-btn" class="position-absolute translate-middle"
							style="top: 63%; left: 61%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 40px; height: 67px; border-radius: 50%; transform: rotate(2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal12"></button>
						</div>

						<!-- 왼쪽 무릎 부분 버튼 -->
						<div id="knee-btn" class="position-absolute translate-middle"
							style="top: 70%; left: 40.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 34px; height: 30px; border-radius: 50%; transform: rotate(2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal13"></button>
						</div>

						<!-- 오른쪽 무릎 부분 버튼 -->
						<div id="knee-btn" class="position-absolute translate-middle"
							style="top: 70%; left: 61%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 34px; height: 30px; border-radius: 50%; transform: rotate(-2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal13"></button>
						</div>

						<!-- 왼쪽 정강이 부분 버튼 -->
						<div id="thighs-btn" class="position-absolute translate-middle"
							style="top: 79%; left: 39.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 100px; border-radius: 50%; transform: rotate(4deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal14"></button>
						</div>

						<!-- 오른쪽 정강이 부분 버튼 -->
						<div id="thighs-btn" class="position-absolute translate-middle"
							style="top: 79%; left: 63.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 100px; border-radius: 50%; transform: rotate(-4deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal14"></button>
						</div>

						<!-- 왼쪽 발목 부분 버튼 -->
						<div id="ankle-btn" class="position-absolute translate-middle"
							style="top: 89%; left: 39%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 20px; height: 30px; border-radius: 50%; transform: rotate(2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal15"></button>
						</div>

						<!-- 오른쪽 발목 부분 버튼 -->
						<div id="ankle-btn" class="position-absolute translate-middle"
							style="top: 89.5%; left: 64.7%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 20px; height: 30px; border-radius: 50%; transform: rotate(-2deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal15"></button>
						</div>

						<!-- 왼쪽 발 부분 버튼 -->
						<div id="foot-btn" class="position-absolute translate-middle"
							style="top: 94.5%; left: 36.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 60px; border-radius: 50%; transform: rotate(16deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal16"></button>
						</div>

						<!-- 오른쪽 발 부분 버튼 -->
						<div id="foot-btn" class="position-absolute translate-middle"
							style="top: 95%; left: 67.5%;">
							<button class="btn btn-primary btn-opacity"
								style="width: 30px; height: 60px; border-radius: 50%; transform: rotate(-16deg);"
								data-bs-toggle="modal" data-bs-target="#hospitalModal16"></button>
						</div>

						<!-- 전면버튼 끝-->

						<!-- 후면버튼 시작-->

						<!-- 등 버튼-->
						<div id="back-btn" class="position-absolute translate-middle back"
							style="top: 33%; left: 49.9%; display: none;">
							<button class="btn btn-primary btn-opacity"
								style="width: 130px; height: 200px; border-radius: 10%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal17"></button>
						</div>

						<!-- 엉덩이 버튼 -->
						<div id="bottom-btn"
							class="position-absolute translate-middle back"
							style="top: 51%; left: 49.9%; display: none;">
							<button class="btn btn-primary btn-opacity"
								style="width: 160px; height: 90px; border-radius: 50%;"
								data-bs-toggle="modal" data-bs-target="#hospitalModal18"></button>
						</div>

						<!-- 후면버튼 끝-->

						<!-- 챗봇 도움말 구역 -->
						<div id="chatbotHelp" class="position-absolute translate-middle"
							style="display: none; top: 5%; left: 155%;">
							<div style="display: inline-block;">
								<p>챗봇이 도와드려요!</p>
								<input></input>
								<button>검색</button>
							</div>
						</div>


					</div>

				</div>
			</div>
			</section>

			<!-- 병원 위치 지도 섹션-->
			<section class="page-section hospital" style="height: 1000px;">
			<div class="d-flex justify-content-center" style="width: 100%;">
				<div class="col-md-6 col-lg-4 mb-5"
					style="position: relative; display: flex; justify-content: center; align-items: center;">
					<div class="divider-custom">
						<div class="divider-custom-line"></div>
						<div class="divider-custom-icon">
							<h1 class="container">병원 탐색</h1>
						</div>
						<div class="divider-custom-line"></div>
					</div>
				</div>
			</div>
			<div
				style="position: relative; display: flex; justify-content: center; align-items: center;">
				<div
					style="width: 1000px; height: 500px; border: 10px solid black; border-radius: 5px;"
					id="map"></div>
			</div>
			</section>

		</div>
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
		<!-- //전체 레이어 끝 -->




		<!-- 모달창 구간 -->

		<!-- 머리 -->
		<div class="hospital-modal modal fade" id="hospitalModal1"
			tabindex="-1" aria-labelledby="hospitalModal1" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">머리</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<div>
										<button class="btn btn-primary col-5 mb-3 modalbtn"
											style="margin-right: 20px;"
											onclick="ModalBtnChangeColor(this, '2')">두통이 있어요</button>
										<button class="btn btn-primary col-5 mb-3 modalbtn"
											onclick="ModalBtnChangeColor(this, '12')">눈이 아파요</button>
									</div>
									<div>
										<button class="btn btn-primary col-5 mb-3 modalbtn"
											style="margin-right: 20px;"
											onclick="ModalBtnChangeColor(this, '13')">귀가 아파요</button>
										<button class="btn btn-primary col-5 mb-3 modalbtn"
											onclick="ModalBtnChangeColor(this, '56')">턱이 아파요</button>
									</div>
									<br>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal1'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 목 -->
		<div class="hospital-modal modal fade" id="hospitalModal2"
			tabindex="-1" aria-labelledby="hospitalModal2" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">목</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal2'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 어깨 -->
		<div class="hospital-modal modal fade" id="hospitalModal3"
			tabindex="-1" aria-labelledby="hospitalModal3" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">어깨</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal3'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 팔 윗 부분 -->
		<div class="hospital-modal modal fade" id="hospitalModal4"
			tabindex="-1" aria-labelledby="hospitalModal4" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">팔
										윗 부분</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal4'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 팔꿈치 -->
		<div class="hospital-modal modal fade" id="hospitalModal5"
			tabindex="-1" aria-labelledby="hospitalModal5" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">팔꿈치</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal5'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 팔 아랫 부분 -->
		<div class="hospital-modal modal fade" id="hospitalModal6"
			tabindex="-1" aria-labelledby="hospitalModal6" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">팔
										아랫 부분</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal6'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 손 -->
		<div class="hospital-modal modal fade" id="hospitalModal7"
			tabindex="-1" aria-labelledby="hospitalModal7" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">손</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal7'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 가슴 -->
		<div class="hospital-modal modal fade" id="hospitalModal8"
			tabindex="-1" aria-labelledby="hospitalModal8" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">가슴</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal8'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 복부 -->
		<div class="hospital-modal modal fade" id="hospitalModal9"
			tabindex="-1" aria-labelledby="hospitalModal9" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">복부</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal9'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 골반 -->
		<div class="hospital-modal modal fade" id="hospitalModal10"
			tabindex="-1" aria-labelledby="hospitalModal10" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">골반</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal10'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 소중이 -->
		<div class="hospital-modal modal fade" id="hospitalModal11"
			tabindex="-1" aria-labelledby="hospitalModal11" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">성기</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>

									<!-- 완료 버튼 -->
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal11'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 허벅지 -->
		<div class="hospital-modal modal fade" id="hospitalModal12"
			tabindex="-1" aria-labelledby="hospitalModal12" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">허벅지</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal12'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 무릎 -->
		<div class="hospital-modal modal fade" id="hospitalModal13"
			tabindex="-1" aria-labelledby="hospitalModal13" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">무릎</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal13'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 정강이 -->
		<div class="hospital-modal modal fade" id="hospitalModal14"
			tabindex="-1" aria-labelledby="hospitalModal14" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">정강이</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal14'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 발목 -->
		<div class="hospital-modal modal fade" id="hospitalModal15"
			tabindex="-1" aria-labelledby="hospitalModal15" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">발목</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal15'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 발 -->
		<div class="hospital-modal modal fade" id="hospitalModal16"
			tabindex="-1" aria-labelledby="hospitalModal16" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">발</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal16'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 등 -->
		<div class="hospital-modal modal fade" id="hospitalModal17"
			tabindex="-1" aria-labelledby="hospitalModal17" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">등</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal17'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 엉덩이 -->
		<div class="hospital-modal modal fade" id="hospitalModal18"
			tabindex="-1" aria-labelledby="hospitalModal18" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">엉덩이</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>
									<button class="btn btn-primary"
										onclick="closeModalAndScrollToSection('hospitalModal18'); getUserLocation();">
										<i class="fas fa-xmark fa-fw"></i> 완료
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 건강 퀴즈 -->
		<div class="hospital-modal modal fade" id="quizModal" tabindex="-1"
			aria-labelledby="quizModal" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div style="display: flex; justify-content: flex-end;">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center pb-5">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<h2
										class="hospital-modal-title text-secondary text-uppercase mb-0">건강퀴즈</h2>
									<div class="divider-custom">
										<div class="divider-custom-line"></div>
										<div class="divider-custom-icon">
											<i class="fas fa-star"></i>
										</div>
										<div class="divider-custom-line"></div>
									</div>


									<div>
										<!-- 퀴즈 제출 폼 -->
										<form action="EgovincQuiz.jsp" method="post"
											onsubmit="event.preventDefault(); checkAnswer();">
											<!-- 퀴즈 내용 표시 컨테이너 -->
											<div id="questionContainer" class="question">
												<!-- 퀴즈 질문 표시 -->
												<h1 id="question"></h1>
												<!-- 퀴즈 답안 선택 라디오 버튼 -->
												<div class="row-vh d-flex flex-row justify-content-between">
													<div class="form_radio_btn">
														<input type="radio" id="answerO" name="answer" value="O">
														<label for="answerO">O</label>
													</div>
													<div class="form_radio_btn">
														<input type="radio" id="answerX" name="answer" value="X">
														<label for="answerX">X</label>
													</div>
												</div>
												<br />
												<!-- 제출 버튼 -->
												<input type="submit" value="제출" class="btn btn-success">
											</div>
										</form>

										<!-- 퀴즈 결과 및 설명 표시 컨테이너 -->
										<div id="result" style="display: none;" class="explanation">
											<!-- 결과 메시지 표시 -->
											<h1 id="resultMessage"></h1>
											<!-- 퀴즈 설명 표시 -->
											<p id="explanation"></p>
											<!-- 다음 문제로 넘어가는 버튼 -->
											<button id="nextButton" onclick="showNextQuiz()"
												class="btn btn-success">다음 문제</button>
										</div>

										<br />
										<!-- 퀴즈 점수 표시 컨테이너 -->
										<div id="scoreContainer" style="display: none;">
											<!-- 점수 메시지 표시 -->
											<h1 id="scoreMessage"></h1>
											<!-- 퀴즈 재시작 버튼 -->
											<button onclick="restartQuiz()" class="btn btn-primary">다시
												시작</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
		<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
		<!-- * *                               SB Forms JS                               * *-->
		<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
		<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
		<!-- 스크립트 부분 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5aedc9bc48ee8cf5b21c312d3905ad16&libraries=services"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script>
		var geocoder = new kakao.maps.services.Geocoder();
		// 지도 표시
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		var mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 7 // 지도의 확대 레벨
		};
		
		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);   
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();
		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT)
		
		function getUserCurrentLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(function(position) {
		            var lat = position.coords.latitude; // 위도
		            var lon = position.coords.longitude; // 경도

		            var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 생성

		            // 마커 표시
		            displayMarker(locPosition);
		            
		            onLocationSuccess();
		        });
		    }
		}
		
		// 위치 정보를 성공적으로 가져왔을 때 실행되는 함수
		function onLocationSuccess() {
		  // "보내기" 버튼에 이벤트 리스너 추가
		 $('#chatbot-send').click(function() {
        var message = $('#chatbot-input').val();
        sendMessage(message);
        $('#chatbot-input').val('');
     });
     
     // 엔터 키 이벤트
     $('#chatbot-input').keypress(function(e) {
        if (e.which == 13) {
            $('#chatbot-send').click();
        }
     });
         
		  // 메시지 전송 함수
		  function sendMessage(message) {
		    var userHtml = "<div class='chat-message user-message'>" + message + "</div>";
		    $('#chatbot-messages').append(userHtml);
		    getResponse(message);
		  }
		  
		  $("#toggle-symptom-buttons").click(function() {
	             $("#symptom-buttons").slideToggle(function() {
	                 // 콜백 함수 내에서 버튼 텍스트 업데이트
	                 if ($("#symptom-buttons").is(":visible")) {
	                     $("#toggle-symptom-buttons").text("숨기기");
	                 } else {
	                     $("#toggle-symptom-buttons").text("보이기");
	                 }
	             });
	         });

		  $(".symptom-btn").click(function() {
              var symptom = $(this).attr("data-symptom");
              var question = symptom + " 어디가야해?";
              displayUserQuestion(question);
              getResponse(question, symptom);
               // 통증 유형 버튼 표시
              $("#symptom-buttons").hide();
               
              $("#toggle-symptom-buttons").text("보이기");
          });
        
        function displayUserQuestion(question) {
             var questionHtml = "<div class='chat-message user-message'>" + question + "</div>";
             $('#chatbot-messages').append(questionHtml);
              
         }
		  
		// 글씨 크기 초기값 설정
		  var currentFontSize = 20;

		  // 글씨 크기 증가 함수
		  $('#increase-font-size').click(function() {
		      currentFontSize++;
		      $('.symptom-btn, .chat-message').css('font-size', currentFontSize + 'px');
		  });

		  // 글씨 크기 감소 함수
		  $('#decrease-font-size').click(function() {
		      if (currentFontSize > 10) { // 최소 글씨 크기 제한
		          currentFontSize--;
		          $('.symptom-btn, .chat-message').css('font-size', currentFontSize + 'px');
		      }
		  });

		  // GPT-3.5 API 호출 함수
		  function getResponse(message) {
		    $('#loading').show();
		    $.get("/hbz/getGPT3Response.do", {question: message}, function(response) {
		      $('#loading').hide();
		      var answer = response.answer;
		      var gpt3Html = "<div class='chat-message gpt3-message'>" + answer + "</div>";
		      $('#chatbot-messages').append(gpt3Html);
 
		    });
		  }
		}

		// 위치 정보 가져오기
		getUserCurrentLocation();
		
		// 병원 진료 과목 코드
		var hospital_subject = '0'; // 기본값 : 없음
		
		// 병원 위치 정보 확인
		function getUserLocation() {
			  if (navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(function(position) {
			      var lat = position.coords.latitude; // 위도
			      var lon = position.coords.longitude; // 경도

			      var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

			      // 마커를 표시합니다
			      displayMarker(locPosition);

			      // 이제 lat과 lon을 사용할 수 있으므로 geocoder.coord2RegionCode와 console.log에서 사용할 수 있습니다
			      geocoder.coord2RegionCode(lon, lat, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			          var fullAddress = result[0].address_name;
			          console.log('전체 주소: ' + fullAddress);

			          // 여기에서 슬라이싱을 통해 원하는 부분의 주소를 얻어냅니다.
			          var slicedAddress = fullAddress.slice(0, 12); // 예: 주소의 처음 12글자 ex(경산북도 경산시 하양읍)
			          console.log('슬라이싱된 주소: ' + slicedAddress);
			          var slicedCode = hospital_subject; // 선택된 진료 과목 코드

			          // 그리고 나서 이 주소를 API에 전달합니다.
			          $.ajax({
			            url: '/hbz/Hospital.do',  // 요청을 보낼 API의 URL을 적어주세요.
			            type: 'GET',
			            data: {address: slicedAddress, code: slicedCode},
			            dataType: 'html', // 서버로 보내는 데이터의 타입을 'html'으로 지정합니다
			            success: function(response) {
			              // 서버로부터 응답이 올 경우 실행할 함수
			              // 'response' 변수에는 서버로부터 받은 응답이 들어있습니다.
			              console.log(response);
			              $('body').html(response);
			              // 사용자 위치를 사용하는 코드를 여기에 위치시킵니다.
			              // 예: 위치에 따른 마커 표시 등
			            },
			            error: function(jqXHR, textStatus, errorThrown) {
			              console.log("AJAX 요청 실패: " + textStatus);
			              console.log("에러 내용: " + errorThrown);
			            }
			          });
			        }
			      });
			    });
			  } else {
			    // HTML5의 GeoLocation을 사용할 수 없을 때 처리
			    console.log('Geolocation을 지원하지 않는 브라우저입니다.');
			  }
			}

		// 현재위치 마커 및 정보 
		function displayMarker(locPosition) {
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			map.setCenter(locPosition);
		}
		
		// 위치 지역 마킹 찍는 함수
		var positions = [
	    <c:forEach var="hospital" items="${hospitalList}" varStatus="status">
	    	<c:if test="${not empty hospital.XPos}">
	        {
	            title: '${hospital.yadmNm}',
	            telno: '${hospital.telno}',
	            addr: '${hospital.addr}',
	            ykiho: '${hospital.ykiho}',
	            trmtMonStart: '${hospital.trmtMonStart}',
	            trmtMonEnd: '${hospital.trmtMonEnd}',
	            trmtTueStart: '${hospital.trmtTueStart}',
	            trmtTueEnd: '${hospital.trmtTueEnd}',
	            trmtWedStart: '${hospital.trmtWedStart}',
	            trmtWedEnd: '${hospital.trmtWedEnd}',
	            trmtThuStart: '${hospital.trmtThuStart}',
	            trmtThuEnd: '${hospital.trmtThuEnd}',
	            trmtFriStart: '${hospital.trmtFriStart}',
	            trmtFriEnd: '${hospital.trmtFriEnd}',
	            trmtSatStart: '${hospital.trmtSatStart}',
	            trmtSatEnd: '${hospital.trmtSatEnd}',
	            trmtSunStart: '${hospital.trmtSunStart}',
	            trmtSunEnd: '${hospital.trmtSunEnd}',
	            latlng: new kakao.maps.LatLng(${hospital.YPos}, ${hospital.XPos})
	        },
	        <c:if test="${!status.last}"></c:if>
	        </c:if>
	    </c:forEach>
		];

		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35);
		    var imageSrc = "/images/markerStar2.png";
		    // 요일별 운영 시간 설정 입니다.
		    var times = {
		    		sunday: {
		    	        start: !positions[i].trmtSunStart ? '0000' : positions[i].trmtSunStart,
		    	        end: !positions[i].trmtSunEnd ? '0000' : positions[i].trmtSunEnd,
		    	    },
		    	    monday: {
		    	        start: !positions[i].trmtMonStart ? '0900' : positions[i].trmtMonStart,
		    	        end: !positions[i].trmtMonEnd ? '1700' : positions[i].trmtMonEnd,
		    	    },
		    	    tuesday: {
		    	        start: !positions[i].trmtTueStart ? '0900' : positions[i].trmtTueStart,
		    	        end: !positions[i].trmtTueEnd ? '1700' : positions[i].trmtTueEnd,
		    	    },
		    	    wednesday: {
		    	        start: !positions[i].trmtWedStart ? '0900' : positions[i].trmtWedStart,
		    	        end: !positions[i].trmtWedEnd ? '1700' : positions[i].trmtWedEnd,
		    	    },
		    	    thursday: {
		    	        start: !positions[i].trmtThuStart ? '0900' : positions[i].trmtThuStart,
		    	        end: !positions[i].trmtThuEnd ? '1700' : positions[i].trmtThuEnd,
		    	    },
		    	    friday: {
		    	        start: !positions[i].trmtFriStart ? '0900' : positions[i].trmtFriStart,
		    	        end: !positions[i].trmtFriEnd ? '1700' : positions[i].trmtFriEnd,
		    	    },
		    	    saturday: {
		    	        start: !positions[i].trmtSatStart ? '0000' : positions[i].trmtSatStart,
		    	        end: !positions[i].trmtSatEnd ? '0000' : positions[i].trmtSatEnd,
		    	    },
		    };
		    
		 	// 요일별 운영시간 인포윈도우 출력
		    var monStart = !positions[i].trmtMonStart ? '0900' : positions[i].trmtMonStart;
		    var monEnd = !positions[i].trmtMonEnd ? '1700' : positions[i].trmtMonEnd;
		    var tueStart = !positions[i].trmtTueStart ? '0900' : positions[i].trmtTueStart;
		    var tueEnd = !positions[i].trmtTueEnd ? '1700' : positions[i].trmtTueEnd;
		    var wedStart = !positions[i].trmtWedStart ? '0900' : positions[i].trmtWedStart;
		    var wedEnd = !positions[i].trmtWedEnd ? '1700' : positions[i].trmtWedEnd;
		    var thuStart = !positions[i].trmtThuStart ? '0900' : positions[i].trmtThuStart;
		    var thuEnd = !positions[i].trmtThuEnd ? '1700' : positions[i].trmtThuEnd;
		    var friStart = !positions[i].trmtFriStart ? '0900' : positions[i].trmtFriStart;
		    var friEnd = !positions[i].trmtFriEnd ? '1700' : positions[i].trmtFriEnd;
		    var satStart = !positions[i].trmtSatStart || positions[i].trmtSatStart == '0000' ? '정보없음' : positions[i].trmtSatStart;
		    var satEnd = !positions[i].trmtSatEnd || positions[i].trmtSatEnd == '0000' ? '정보없음' : positions[i].trmtSatEnd;
		    var sunStart = !positions[i].trmtSunStart || positions[i].trmtSunStart == '0000' ? '정보없음' : positions[i].trmtSunStart;
		    var sunEnd = !positions[i].trmtSunEnd || positions[i].trmtSunEnd == '0000' ? '정보없음' : positions[i].trmtSunEnd;
		    
		    monStart = monStart.substring(0, 2) + ':' + monStart.substring(2);
		    monEnd = monEnd.substring(0, 2) + ':' + monEnd.substring(2);
		    tueStart = tueStart.substring(0, 2) + ':' + tueStart.substring(2);
		    tueEnd = tueEnd.substring(0, 2) + ':' + tueEnd.substring(2);
		    wedStart = wedStart.substring(0, 2) + ':' + wedStart.substring(2);
		    wedEnd = wedEnd.substring(0, 2) + ':' + wedEnd.substring(2);
		    thuStart = thuStart.substring(0, 2) + ':' + thuStart.substring(2);
		    thuEnd = thuEnd.substring(0, 2) + ':' + thuEnd.substring(2);
		    friStart = friStart.substring(0, 2) + ':' + friStart.substring(2);
		    friEnd = friEnd.substring(0, 2) + ':' + friEnd.substring(2);
		    
		    if(satStart !== '정보없음'){satStart = satStart.substring(0, 2) + ':' + satStart.substring(2)};
		    if(satEnd !== '정보없음'){satEnd = satEnd.substring(0, 2) + ':' + satEnd.substring(2)};
		    if(sunStart !== '정보없음'){sunStart = sunStart.substring(0, 2) + ':' + sunStart.substring(2)};
		    if(sunEnd !== '정보없음'){sunEnd = sunEnd.substring(0, 2) + ':' + sunEnd.substring(2)};
		    
		    // 현재 요일 및 시간 생성
		    var now = new Date();
		    var currentDay = now.getDay();
		    // now.setHours(8);		// 테스트용
		    // now.setMinutes(45);	// 테스트용
		    var currentHour = now.getHours();
		    var currentMinute = now.getMinutes();

		    var days = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
		    var today = days[currentDay];

		    var startHour = parseInt(times[today].start.slice(0, 2));
		    var startMinute = parseInt(times[today].start.slice(2, 4));
		    var endHour = parseInt(times[today].end.slice(0, 2));
		    var endMinute = parseInt(times[today].end.slice(2, 4));
		    
		 	// 현재 시간이 오늘 진료 시간 내에 있으면 이미지 변경
		    if ((currentHour > startHour || (currentHour === startHour && currentMinute >= startMinute)) &&
		        (currentHour < endHour || (currentHour === endHour && currentMinute <= endMinute))) {
		    	imageSrc = "/images/markerStar3.png";
		    }
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		     	// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        title : "월 : " + monStart + " - " + monEnd +
		        		"\n화 : " + tueStart + " - " + tueEnd + 
		        		"\n수 : " + wedStart + " - " + wedEnd + 
		        		"\n목 : " + thuStart + " - " + thuEnd + 
		        		"\n금 : " + friStart + " - " + friEnd + 
		        		"\n토 : " + satStart + " - " + satEnd + 
		        		"\n일 : " + sunStart + " - " + sunEnd,
		        image : markerImage // 마커 이미지 
		    });

		    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		    var iwContent = '<div style="width: 300px; height: 100%;">병원명 : ' + positions[i].title + '<br>전화번호 : ' + positions[i].telno + '<br>주소 : ' + positions[i].addr + '</div>';
		    var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		        
		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		        
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', (function(marker, infowindow, ykiho) {
		        return function() {
		            // 마커 위에 인포윈도우를 표시합니다
		            infowindow.open(map, marker);  
		            console.log(ykiho);
		        };
		    })(marker, infowindow, positions[i].ykiho));
		    
		    // 사용자의 위치를 API부분으로 옮긴다
		    var userPosition;
			
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(function(position) {
		            userPosition = {
		                latitude: position.coords.latitude,
		                longitude: position.coords.longitude
		            };
		        });
		    }
		}
		</script>

		<script type="text/javascript">

        //시계로 180도씩 계속 돌아감
        document.addEventListener("DOMContentLoaded", function () {
		    const genderrotateButton = document.getElementById("genderchange-rotate-button");
		    const genderrotateImage = document.getElementById("gender-rotate-image");
		    
		    if (genderrotateButton && genderrotateImage) {
		        let genderrotationDegree = 0;
		
		        genderrotateButton.addEventListener("click", function() {
		            genderrotationDegree += 180;
		            genderrotateImage.style.transform = 'rotate(' + genderrotationDegree + 'deg)';
		        });
		    }
		});
		        
        document.addEventListener("DOMContentLoaded", function () {
	        const rotateButton = document.getElementById("rotate-button");
	        const rotateImage = document.getElementById("rotate-image");
	
	        if (rotateButton && rotateImage) {
	            let rotationDegree = 0;
	
	            rotateButton.addEventListener("click", function() {
	                rotationDegree += 180;
	                rotateImage.style.transform = 'rotate(' + rotationDegree + 'deg)';
	            });
	        }
	    });

     	// 성별 교체
        function GenderChange() {
		    const MaleDiv = document.getElementById("Male");
		    const FemaleDiv = document.getElementById("Female");
		    const GenderChangeBtn = document.getElementById("genderchange-rotate-button");
		    const MaleImg = document.getElementById("MaleImg");
		    const FemaleImg = document.getElementById("FemaleImg");
		
		    let isGender = true;
		
		    // 성별 그림 교체          
		    GenderChangeBtn.addEventListener("click", function () {
				    if (isGender) {
				        changeImage(FemaleImg, '/images/Female.png');
				        MaleDiv.style.display = "none";
				        FemaleDiv.style.display = "block";
				    } else {
				        changeImage(MaleImg, '/images/Male.png');
				        MaleDiv.style.display = "block";
				        FemaleDiv.style.display = "none";
				    }
				 	// 색상 변경 함수 호출
				    changeColor(!isGender);
				    changeColor2(!isGender);
				    
				    isGender = !isGender;
				});
			}
		
		//성별 변경 온로드
		window.onload = function() {
		    GenderChange();
		};
 
		// 남성-하늘색 여성-분홍색 계열
		function changeColor(isMale) {
		    const elementsToChange = document.querySelectorAll('.gender-color');
		
		    elementsToChange.forEach(element => {
		        element.classList.toggle('bg-male', isMale);
		        element.classList.toggle('bg-female', !isMale);
		    });
		}
		
		function changeColor2(isMale2) {
		    const elementsToChange = document.querySelectorAll('.gender-color2');
		
		    elementsToChange.forEach(element => {
		        element.classList.toggle('color-male', isMale2);
		        element.classList.toggle('color-female', !isMale2);
		    });
		}
		
		// 이미지 애니메이션
		function changeImage(imageElement, newImageUrl) {
		    // 페이드 아웃
		    imageElement.style.opacity = '0';
		
		    // 0.5초 후 이미지 교체 및 페이드 인
		    setTimeout(() => {
		        imageElement.src = newImageUrl;
		        imageElement.onload = () => {
		            // 이미지 로드 완료 후 페이드 인
		            imageElement.style.opacity = '1';
		        };
		    }, 250); // 0.25초 후 이미지 변경
		}

        // 인체모양 전후면 교체
        function HumanFrontBackChange() {
            const frontElements = document.querySelectorAll(".front");
            const backElements = document.querySelectorAll(".back");
            const changeBtn = document.getElementById("rotate-button");

            let isFront = true;

            //전면-후면 교체            
            changeBtn.addEventListener("click", function () {
                if (isFront) {
                    frontElements.forEach(frontElement => {
                        frontElement.style.display = "none";
                    });
                    backElements.forEach(backElement => {
                        backElement.style.display = "block";
                    });
                } else {
                    frontElements.forEach(frontElement => {
                        frontElement.style.display = "block";
                    });
                    backElements.forEach(backElement => {
                        backElement.style.display = "none";
                    });
                }

                isFront = !isFront;
            });
        }

        document.addEventListener("DOMContentLoaded", function () {
            HumanFrontBackChange();
        });

        // 모달을 닫는 함수
		function closeModal(modalId) {
		    var modal = document.getElementById(modalId);
		    var modalInstance = bootstrap.Modal.getInstance(modal);
		    if (modalInstance) {
		        modalInstance.hide();
		    }
		}
		
		// 모달을 닫고 특정 모달에서만 스크롤 이동하는 함수
		function closeModalAndScrollToSection(modalId) {
		    var modal = document.getElementById(modalId);
		
		    // 모달이 완전히 닫힌 후에 실행될 이벤트 리스너
		    modal.addEventListener('hidden.bs.modal', function onModalHidden() {
		        const mapElement = document.getElementById('map');
		        if (mapElement) {
		            mapElement.scrollIntoView({
		                behavior: 'smooth',
		                block: 'start'
		            });
		        }
		
		        // 이 이벤트 리스너를 제거함으로써 다시는 실행되지 않음
		        modal.removeEventListener('hidden.bs.modal', onModalHidden);
		    }, { once: true }); // 이벤트 리스너가 한 번만 실행되도록 설정
		
		    closeModal(modalId); // 모달을 닫음
		}

		//모달창 질문 선택
		function setInput(input) {
	    	document.getElementById('input').value = input;
		}
		
		//모달 버튼색 체인지
		function ModalBtnChangeColor(button, code) {
    		if (button.classList.contains('btn-primary')) {
    			hospital_subject = code; // 진료 과목
		        button.classList.remove('btn-primary');
		        button.classList.add('btn-primary-changed');
		    } else {
		    	hospital_subject = '0';
		        button.classList.remove('btn-primary-changed');
		        button.classList.add('btn-primary');
		    }
		}

		// 현재 퀴즈 인덱스 초기화
	    var currentQuizIndex = 0;
	    // 사용자 점수 초기화
	    var score = 0;
	    // 전체 퀴즈 리스트
	    var quizList = [
	    	['편두통은 대부분 스트레스 때문에 발생한다.', 'X', '편두통은 스트레스 외에도 호르몬 변화, 수면 부족, 특정 음식 섭취 등 다양한 원인이 있습니다.'],
	        ['항상 좌식 생활은 지방간의 위험을 높인다.', 'O', '운동 부족과 잘못된 식습관은 지방간 질환의 위험을 증가시킵니다.'],
	        ['모든 암은 통증을 동반한다.', 'X', '암의 초기 단계에서는 통증이 없을 수 있으며, 암에 따라 증상이 다릅니다.'],
	        ['모기에 물린 자리를 긁으면 감염의 위험이 증가한다.', 'O', '긁는 행위로 인해 피부 손상이 생기고 세균이 침투할 수 있어 감염 위험이 증가합니다'],
	        ['손톱을 물어뜯는 습관은 구강 감염을 일으킬 수 있다.', 'O', '손톱 아래에는 세균이 많이 존재하기 때문에 이런 습관은 구강 감염의 위험을 높일 수 있습니다.'],
	        ['먹은 음식이 위장에서 소화되기까지 보통 6시간이 걸린다.', 'O', '일반적으로 위장에서 음식이 소화되고 소장으로 이동하는 데 약 4시간에서 6시간 정도 소요됩니다.'],
	        ['수분 섭취는 피부의 수분 함량에 별 영향을 미치지 않는다.', 'X', '적절한 수분 섭취는 피부의 수분 함량과 탄력을 유지하는 데 도움이 됩니다.'],
	        ['항생제는 바이러스 감염에도 효과적이다.', 'X', '항생제는 세균 감염에만 효과적이며, 바이러스 감염에는 효과가 없습니다.'],
	        ['비만은 당뇨병, 심장병 및 일부 암과 같은 질병의 위험 요소이다.', 'O', '비만은 여러 가지 만성 질환의 위험을 증가시킵니다.'],
	        ['우울증은 \'마음의 병’이므로 신체적인 질병으로 간주되지 않는다.', 'X', '우울증은 심리적 문제일 뿐만 아니라 뇌의 화학적 불균형과 관련된 신체적 질병으로 간주됩니다.'],
	        ['고등어와 같은 등푸른 생선에는 오메가-3 지방산이 풍부하다.', 'O', '고등어, 연어 등의 등푸른 생선에는 건강에 좋은 오메가-3 지방산이 풍부합니다.'],
	        ['일교차가 클 때 혈압이 일시적으로 변화할 수 있다.', 'O', '일교차와 같은 기온 변화는 혈압에 일시적인 영향을 줄 수 있습니다.'],
	        ['당근을 많이 먹으면 야간 시력이 향상된다.', 'X', '당근에 함유된 베타카로틴(비타민 A의 전구체)은 눈 건강에 좋지만, 야간 시력을 향상시키지는 않습니다.'],
	        ['인플루엔자(독감)와 일반 감기는 같은 바이러스 때문에 발생한다.', 'X', '인플루엔자(독감) 바이러스와 감기 바이러스는 서로 다릅니다.'],
	        ['스트레스는 소화 불량을 유발할 수 있다.', 'O', '스트레스는 위산 분비를 증가시키거나 장 운동성에 영향을 주어 소화 불량을 일으킬 수 있습니다.'],
	        ['고통을 느끼는 능력은 우리 몸에 해로우므로 피해야 한다.', 'X', '고통은 신체의 경고 신호로, 잠재적인 문제나 손상을 나타내기 때문에 중요한 역할을 합니다.'],
	        ['심한 탈수는 콩팥 질환이나 신장 결석을 유발할 수 있다.', 'O', '탈수는 신장에 부담을 주어 콩팥 질환과 신장 결석의 위험을 높일 수 있습니다.'],
	        ['모든 유형의 알레르기 반응은 즉각적으로 나타난다.', 'X', '일부 알레르기 반응은 며칠 후에 나타나는 지연 반응일 수 있습니다.'],
	        ['채식 주의자는 단백질 결핍의 위험이 높다.', 'X', '채식을 할 때 콩류, 견과류 등 다양한 식물성 단백질 출처를 통해 충분한 단백질을 섭취할 수 있습니다.'],
	        ['엄지발가락에 생기는 통풍은 과도한 육류 섭취로 인해 발생할 수 있다.', 'O', '통풍은 체내의 고요산 수치가 높아져 발생하는데, 육류는 요산을 증가시킬 수 있는 퓨린이 풍부합니다.'],
	        ['수면 부족은 체중 증가로 연결될 수 있다.', 'O', '수면 부족은 밤동안의 식습관을 변경하고 섭식 조절 호르몬에 영향을 줄 수 있어 체중 증가와 관련이 있습니다.'],
	        ['세계보건기구(WHO)는 성인의 일일 설탕 섭취 권장량을 전체 칼로리의 10% 미만으로 권장한다.', 'O', 'WHO는 전체 에너지 섭취량의 10% 미만을 가공 설탕으로 섭취하라고 권장합니다.'],
	        ['녹차는 체중 감량에 도움이 될 수 있다.', 'O', '녹차에 포함된 항산화제와 카테킨은 신진대사를 촉진하고 체중 감량에 도움이 될 수 있습니다.'],
	        ['아세트아미노펜(타이레놀 등)은 간에 해로울 수 있다.', 'O', '과량의 아세트아미노펜을 섭취하면 간에 심각한 손상을 입힐 수 있습니다.'],
	        ['비행기 안에서 잇몸이나 코로부터 출혈이 더 쉽게 발생할 수 있다.', 'O', '비행기 안의 낮은 기압과 건조한 공기는 점막을 건조하게 만들어 출혈을 유발할 수 있습니다.'],
	        ['위산과다는 위궤양의 가장 흔한 원인이다.', 'X', '위궤양의 가장 흔한 원인은 헬리코박터 파일로리(Helicobacter pylori) 감염과 특정 약물(비스테로이드성 항염증제)의 사용입니다.'],
	        ['피임약은 여성의 생리통을 감소시킬 수 있다.', 'O', '피임약은 호르몬 수준을 조절하여 생리통 감소에 도움을 줄 수 있습니다.'],
	        ['콜레스테롤 수치는 체중에 따라 달라지지 않는다.', 'X', '체중이 증가하면 나쁜(LDL) 콜레스테롤이 증가하고 좋은(HDL) 콜레스테롤이 감소할 수 있습니다.'],
	        ['비타민 C는 감기를 예방할 수 있다.', 'X', '비타민 C는 감기 증세를 다소 완화할 수 있으나, 감기를 예방하는 데 대한 확실한 증거는 없습니다.']
	        // ... (퀴즈 데이터 추가)

	    ];

	    // 선택된 퀴즈 리스트
	    var selectedQuizList = [];
	    // 퀴즈 개수
	    var quizNumber = 5; 

	    // 배열 섞기 함수
	    function shuffle(array) {
	        for (let i = array.length - 1; i > 0; i--) {
	            let j = Math.floor(Math.random() * (i + 1));
	            [array[i], array[j]] = [array[j], array[i]];
	        }
	        return array;
	    }

	    // 퀴즈 선택 함수
	    function selectQuiz() {
	        // 퀴즈 리스트를 섞어서 선택된 퀴즈 리스트에 할당
	        shuffle(quizList);
	        selectedQuizList = quizList.slice(0, quizNumber);
	    }

	    // 다음 퀴즈 표시 함수
	    function showNextQuiz() {
	        if (currentQuizIndex >= quizNumber) {
	            // 퀴즈가 끝나면 점수 화면을 보여줌
	            document.getElementById('questionContainer').style.display = "none";
	            document.getElementById('scoreContainer').style.display = "block";
	            document.getElementById('scoreMessage').innerHTML = "당신의 점수는 " + score + "점 입니다.";
	         	// 결과 보기 버튼 숨기기
	            document.getElementById('nextButton').style.display = "none";
	            return;
	        }

	        var quiz = selectedQuizList[currentQuizIndex];
	        var question = quiz[0];

	        // 다음 퀴즈로 넘어가기 전에 화면 설정
	        document.getElementById('question').innerHTML = question;
	        document.getElementById('result').style.display = "none";
	        document.getElementById('questionContainer').style.display = "block";

	        if (currentQuizIndex === quizNumber - 1) {
	            // 마지막 퀴즈일 경우 버튼 텍스트를 '결과 보기'로 변경
	            document.getElementById('nextButton').innerText = '결과 보기';
	        } else {
	            document.getElementById('nextButton').innerText = '다음 문제';
	        }

	        // 다음 퀴즈로 인덱스 증가
	        currentQuizIndex++;
	    }

	    // 정답 확인 및 결과 표시 함수
	    function checkAnswer() {
	        var userAnswer;

	        // 사용자가 선택한 답 확인
	        if (document.getElementById('answerO').checked) {
	            userAnswer = 'O';
	        } else if (document.getElementById('answerX').checked) {
	            userAnswer = 'X';
	        }

	        if (currentQuizIndex <= quizNumber) {
	            // 퀴즈가 남아있으면 정답 확인 후 결과 화면 표시
	            var quiz = selectedQuizList[currentQuizIndex - 1];
	            var answer = quiz[1];
	            var explanation = quiz[2];

	            document.getElementById('questionContainer').style.display = "none";
	            document.getElementById('result').style.display = "block";

	            if (userAnswer === answer) {
	                // 정답인 경우 점수 증가
	                document.getElementById('resultMessage').innerHTML = "정답입니다! <br>설명:" + explanation;
	                score++;
	            } else {
	                document.getElementById('resultMessage').innerHTML = "틀렸습니다!<br>설명: " + explanation;
	            }
	        }
	        document.getElementById('answerO').checked = false;
	        document.getElementById('answerX').checked = false;
	    }

	    // 퀴즈 초기화 및 첫 번째 퀴즈 표시 함수
	    function restartQuiz() {
	        currentQuizIndex = 0;
	        score = 0;
	        selectQuiz();
	        showNextQuiz();
	        document.getElementById('scoreContainer').style.display = "none";
	        document.getElementById('questionContainer').style.display = "block";
	        document.getElementById('nextButton').style.display = "block";
	    }

	    // 초기화 함수 호출
	    selectQuiz();
	    showNextQuiz();
    </script>
</body>
</html>

