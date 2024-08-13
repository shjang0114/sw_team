/*!
* Start Bootstrap - Freelancer v7.0.7 (https://startbootstrap.com/theme/freelancer)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-freelancer/blob/master/LICENSE)
*/
//
// Scripts
// 

// 웹 페이지가 준비 되면 시행되는 이벤트
//window.addEventListener('DOMContentLoaded', event => {
//
//    // 페이지 스크롤에 따라 네비게이션 바의 크기를 수정
//    var navbarShrink = function () {
//        const navbarCollapsible = document.body.querySelector('#mainNav');
//        if (!navbarCollapsible) {
//            return;
//        }
//
//        // 페이지 상단에 있을 경우 navbar-shrink css 제거, 하단에 있을 경우 추가
//        if (window.scrollY === 0) {
//            navbarCollapsible.classList.remove('navbar-shrink')
//        } else {
//            navbarCollapsible.classList.add('navbar-shrink')
//        }
//
//    };
//
//    // 페이지가 로드될 때 navbarShrink 함수를 실행하여 초기 네비게이션 바 크기 조절 
//    navbarShrink();
//
//    // 페이지가 스크롤될 때 navbarSrink 함수를 호출하여 네비게이션 바 크기 조절
//    document.addEventListener('scroll', navbarShrink);
//
//    // 페이지에서 #mainNav id를 가진 요소를 찾아 mainNav 변수에 할당
//    const mainNav = document.body.querySelector('#mainNav');
//
//    // Bootstrap ScrollSpy를 활성화하여 페이지의 스크롤 위치에 따라 네비게이션 메뉴 항목을 하이라이트
//    // #mainNav를 대상으로 설정하여 rootMargin을 통해 스크롤 위치에서'0px 0px -40%' 떨어졌을 때 활성화
//    if (mainNav) {
//        new bootstrap.ScrollSpy(document.body, {
//            target: '#mainNav',
//            rootMargin: '0px 0px -40%',
//        });
//    };
//
//    // 페이지에서 '.navbar-toggler' 클래스를 가진 요소를 찾아 navbarToggler 변수에 할당
//    const navbarToggler = document.body.querySelector('.navbar-toggler');
//
//    // 페이지에서 #navbarResponsive 안에 있는 '.nav-link' 클래스를 가진 모든 요소를 찾아 responsiveNavItems 배열에 할당
//    const responsiveNavItems = [].slice.call(
//        document.querySelectorAll('#navbarResponsive .nav-link')
//    );
//
//    // responsiveNavItems 배열의 각 요소에 대해 이벤트리스너를 추가
//    // 각 네비게이션 메뉴 항목이 클릭되면
//    // 현재 화면 너비에서 네비게이션 바 토글 버튼('navbarToggler')이 보이는지 확인
//    // 토글 버튼이 보이면 클릭하여 반응형 네비게이션 메뉴를 닫을 수 있음
//    responsiveNavItems.map(function (responsiveNavItem) {
//        responsiveNavItem.addEventListener('click', () => {
//            if (window.getComputedStyle(navbarToggler).display !== 'none') {
//                navbarToggler.click();
//            }
//        });
//    });
//
//});
//