<%--
  Class Name : EgovIncFooter.jsp
  Description : 화면하단 Footer(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/'/>css/styles.css" rel="stylesheet" type="text/css" >
   

    <!-- Footer-->

    <!-- 최하단 Copyright 섹션-->
    <!-- class="copyright py-4 text-center text-white" : 배경색#1a252f, 상단, 하단 패딩 1.5, 텍스트 중간 배치, 글자 흰색 -->
    <div class="copyright py-4 text-center text-white gender-color bg-male" style="transition: background-color 0.5s ease, color 0.5s ease;">
        <div class="container"><small>Copyright &copy; Hello Team Website 2023</small></div>
    </div>