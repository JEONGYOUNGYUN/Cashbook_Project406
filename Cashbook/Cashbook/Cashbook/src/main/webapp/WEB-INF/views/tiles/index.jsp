<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MediCare System</title>

<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/logo_favicon.ico">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/assets/css/bootstrap.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">

<!-- jquery -->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
//로딩창 여는 함수
function LoadingWithMask() {
	
	//화면의 높이와 너비를 구합니다
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;
	
	//화면에 출력할 마스크를 설정해줍니다.
	var mask = "<div id='mask' style='position:absolute; z-index:998; background-color:#ffffff; display:none; left:0; top:92px;'></div>";
	var loadingImg = '';
	
	loadingImg += "<div id = 'loadingImg'>";
	loadingImg += "<img src='/resources/images/roadingGif.gif' style='position: absolute; z-index:999; margin: 0px; left:40%; top:20%;'/>";
	loadingImg += "</div>";
	
	//화면에 레이어 추가
	$('.content-wrapper').append(mask);
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다
	$('#mask').css({
		'width' : maskWidth,
		'height' : maskHeight,
		'opacity' : '1'
	});
	
	//마스크 표시
	$('#mask').show();
	
	//로딩중 이미지 표시
	$('#mask').append(loadingImg);
	$('#loadingImg').show();
}

//로딩창 닫는 함수
function closeLoadingWithMask() {
	$('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').remove();
}

//페이지 바뀌는 것을 지연시키는 함수(1초 뒤에 실행)
function pageLoad(wichi) {
	
	//해당 위치로 이동
	location.href = wichi;
}

//로딩창 실행하는 함수
function start(wichi){
	//로딩 창 실행
	LoadingWithMask();
	
	//로딩 창 닫기
    setTimeout("pageLoad('" + wichi + "')", 1100);

};//end start function

//창의 url을 가져온다.
var pageUrl = window.location.href;

//load가 되었을때 실행
$(window).on("load", function(wichi){
	//navA의 개수 구하기
	var navaLen = $('.headerNav .navA').length;
	
	//최대 navaA길이 => 원무과 4개
	var maxNava = 5;
	
	//다른 active가 있으면 지워준다.
    $('.navA').removeClass('active');
	
  	//url - 입퇴원
    if (pageUrl.indexOf('office/main') > -1) {
    	//원무과는 접수, 입퇴원, 수납, sms관리를 담당함
    	$('.headerNav .navA').eq(1).addClass('active');
    	
    } else if (pageUrl.indexOf('payment') > -1) {
    	//url - 수납
        $('.headerNav .navA').eq(2).addClass('active');
    	
    } else if (pageUrl.indexOf('patientSms') > -1) {
    	//url - SMS관리
        $('.headerNav .navA').eq(3).addClass('active');
    	
    }else if (pageUrl.indexOf('docMain') > -1) {
    	//url - 진료실
        $('.headerNav .navA').eq(4).addClass('active');
    	
    	//의사는 진료실, 통계를 담당
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(0).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('docStatic') > -1) {
    	//url - 통계
        $('.headerNav .navA').eq(5).addClass('active');
    	
      	//의사는 진료실, 통계를 담당
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(1).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('ward') > -1) {
    	//url - 병동
        $('.headerNav .navA').eq(6).addClass('active');
    	
    	//병동간호사는 병동만 담당(나머지는 다 navD)
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(0).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('imsang') > -1) {
    	//url - 검사실
        $('.headerNav .navA').eq(7).addClass('active');
    	
    	//임상병리사는 검사실만 담당함
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(0).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('suacc') > -1) {
    	//url - 수액
        $('.headerNav .navA').eq(8).addClass('active');
    	
    	//외래간호사는 수액과 약품과리를 담당함
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(0).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('bangsa') > -1) {
    	//url - 방사선
        $('.headerNav .navA').eq(9).addClass('active');
    	
    	//방사선은 하나 밖에 실행이 되지 않기 때문에 addClass다른 버전도 해줘야 함(다 navD이다)
    	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(0).addClass('active'); 
    	}
    	
    }else if (pageUrl.indexOf('drugManagement') > -1) {
    	//url - 약품관리
        $('.headerNav .navA').eq(10).addClass('active');
    	
      	//외래간호사는 수액과 약품과리를 담당함
      	//navLen 길이가 maxNava 이하일 때
    	if(navaLen < maxNava){
        	$('.headerNav .navA').eq(1).addClass('active'); 
    	}
    	
    }else {
    	$('.headerNav .navA').eq(0).addClass('active'); 
        //모든 조건이 아닐때 실행하도록 함 => 접수
    }
});//end function
</script>
</head>

<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Header_navbar -->
		<tiles:insertAttribute name="header" />
	
		<!-- Sidebar -->
		<tiles:insertAttribute name="aside" />
		
		<!-- content -->
		<div class="content-wrapper m-0">
			<section class="content">
				<div class="container-fluid p-2">
					<tiles:insertAttribute name="body" />
				</div>
			</section>
		</div>
	</div>

<!-- jQuery -->
<!-- <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script> -->

<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- ChartJS -->
<script src="/resources/plugins/chart.js/Chart.min.js"></script>

<!-- Sparkline -->
<script src="/resources/plugins/sparklines/sparkline.js"></script>

<!-- JQVMap -->
<script src="/resources/plugins/jqvmap/jquery.vmap.min.js"></script>

<script src="/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>

<!-- jQuery Knob Chart -->
<script src="/resources/plugins/jquery-knob/jquery.knob.min.js"></script>

<!-- daterangepicker -->
<script src="/resources/plugins/moment/moment.min.js"></script>

<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>

<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Summernote -->
<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>

<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
</body>
</html>