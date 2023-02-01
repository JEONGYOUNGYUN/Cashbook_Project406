<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="kr.or.ddit.security.CustomUser"%>
<%@ page import="kr.or.ddit.vo.EmpVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- header 시작  => 관리자는 이 헤더를 사용하지 않음 -->

<div class="row">
	<div class="col-lg-12">

		<!-- Navbar -->
		<nav class="navbar navbar-expand navbar-white navbar-light">
			<sec:authorize access='isAuthenticated()'>
				<%
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				CustomUser custom = (CustomUser) auth.getPrincipal();
				String empDep = custom.getEmpVO().getEmpDep();
				%>
				<!-- navbar links -->
				<ul class="navbar-nav">
					<!-- 공통 navbar links -->
					<li class="nav-item"><a href="/main" class="logoNav"> <img
							alt="MediCare" src="/resources/images/medicareLogo.png"
							width="80" height="60" />
					</a></li>
					<!-- 원무과 navbar links -->
					<%
						if (empDep.equals("BD002")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/patient/patientManage')"
						class="navA active">접수</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/patient/patientManage')"
						class="navA active">접수</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD active">접수</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD002")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/office/main')" class="navA">입퇴원</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/office/main')" class="navA">입퇴원</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">입퇴원</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD002")) {
					%>
					<li class="nav-item headerNav">
						<a href="javascript:start('/office/payment')" class="navA">수납</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/office/payment')" class="navA">수납</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">수납</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD002")) {
					%>
					<li class="nav-item headerNav"><a href="javascript:start('/patient/patientSms')"
						class="navA">SMS 관리</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a href="javascript:start('/patient/patientSms')"
						class="navA">SMS 관리</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">SMS
							관리</a></li>
					<%
						}
					%>

					<!-- 의사 navbar links -->
					<%
						if (empDep.equals("BD001")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/doc/docMain')" class="navA">진료실</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/doc/docMain')" class="navA">진료실</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">진료실</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD001")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/doc/docStatic')" class="navA">통계</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/doc/docStatic')" class="navA">통계</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">통계</a>
					</li>
					<%
						}
					%>

					<!-- 간호사 navbar links -->
					<%
						if (empDep.equals("BD007")||empDep.equals("BD006")||empDep.equals("BD005")||empDep.equals("BD004")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/ward/main')" class="navA">병동</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/ward/main')" class="navA">병동</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">병동</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD007")||empDep.equals("BD006")||empDep.equals("BD005")||empDep.equals("BD004")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/imsang/imsangMain')" class="navA">검사실</a>
					</li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/imsang/imsangMain')" class="navA">검사실</a>
					</li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">검사실</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD007")||empDep.equals("BD006")||empDep.equals("BD005")||empDep.equals("BD004")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/suacc/suaccMain')" class="navA">수액</a></li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/suacc/suaccMain')" class="navA">수액</a></li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">수액</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD007")||empDep.equals("BD006")||empDep.equals("BD005")||empDep.equals("BD004")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/bangsa/bangsaMain')" class="navA">방사선</a>
					</li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/bangsa/bangsaMain')" class="navA">방사선</a>
					</li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">방사선</a>
					</li>
					<%
						}
					%>
					<%
						if (empDep.equals("BD007")||empDep.equals("BD006")||empDep.equals("BD005")||empDep.equals("BD004")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/nurse/drugManagement')" class="navA">약품관리</a>
					</li>
					<%
						} else if (empDep.equals("BD003")) {
					%>
					<li class="nav-item headerNav"><a
						href="javascript:start('/nurse/drugManagement')" class="navA">약품관리</a>
					</li>
					<%
						} else {
					%>
					<li class="nav-item headerNav"><a href="#" class="navD">약품관리</a>
					</li>
					<%
						}
					%>
				</ul>
				<ul id="MARQUEE" style="width: 30%;"></ul>

				<ul class="navbar-nav ml-auto" style="padding-right: 0.8%;">
					<li class="nav-item dropdown" style="margin-top:10px">
					 	<a class="nav-link" data-toggle="dropdown" href="#" id="messageCount" aria-expanded="false"> 
					    	<i class="fas fa-comments" style="font-size: 2.0em; color: #162D76;"></i> 
					  	</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;" id="getThree"></div>
				   </li>

					<li class="nav-item pt-4" style="cursor: pointer;font-weight: bold;" id="connectionName">
						<sec:authentication property="principal.empVO.empName" />님 
					</li>
					
					<li class="nav-item pt-4" id="executeLogout" style="cursor: pointer;font-weight: bold;">
						<form action = "/logout" method = "post" name="logoutForm">
							&nbsp; &#124; &nbsp;로그아웃
							<sec:csrfInput/>
						</form>
					</li>
				</ul>
			</sec:authorize>
		</nav>
		<!-- /.navbar -->
	</div>
</div>

<!-- header 종료 -->
<script type="text/javascript">
//접속한 이름 클릭 시(ex.관리자님)
$(document).on("click", "#connectionName", function(){
	//li안의 내용 가져오기
	var connectionName= $(this).text();
	
	//접속한 이름이 박성룡님 or 송중호님일때 관리자 페이지로 이동
	if(connectionName.trim() == "박성룡님" || connectionName.trim() == "송중호님"){
		location.href = "/adminMain";
	}
	
});//end connectionName function

//자기 이름 클릭 시(로그아웃 할 것인지를 물어봄)
$(document).on("click", "#executeLogout", function(){
	//로그아웃 폼 가져오기
	var logoutForm = $("form[name=logoutForm]");
	
	//로그아웃 할 것인지 확인
	var checkOut = confirm("로그아웃 하시겠습니까?");
	
	if(checkOut == true){
		logoutForm.submit();
		
	}else{
		return false;
	}
	
});//end function

var session = "<sec:authentication property='principal.empVO.empNo'/>";

$(function(){
	
	// 처음에 띄우는 용
	listGet();
	
	// 계속 새로고침을 해줌으로써 알림을 보냄
	var timer2 = setInterval(function(){
		listGet();
	},1000);
})


 var popup;
 
 function openPopup(){
	var popupX = (window.screen.width/2)-(1000/2);
	var popupY = (window.screen.height/2) - (800/2);
		
	popup = window.open('<%=request.getContextPath()%>/chat/chat','chat','status=no, height=800, width=1000, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	
	var timer = setInterval(function(){
		if(popup.closed){
			clearInterval(timer);
			// 현재 세션의 값들을 모두 삭제
			let chFrom = '<sec:authentication property="principal.empVO.empNo"/>';
			console.log("chFrom : " + chFrom);
			$.ajax({
				url : "/chat/sessionDelete",
				 contentType : "application/json;charset=utf-8",
			     type : "post",
			     data : chFrom,
				 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
					                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				  },
				 success : function(result){
					 console.log(result);
				 } 
			})
		}
	},1000);
 }
 
 function listGet(){
	 
	 $.ajax({
			url : "/chat/messageCount",
			contentType : "application/json;charset=utf-8",
		    type : "post",
	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        data : session,
	        success : function(result){
// 	        	console.log(result);
                 if(result == 0){
                	 code = '';
                 }else{
	             code = ' <span class="badge badge-danger navbar-badge">'+result+'</span>';
                 }
		         $("#messageCount").append(code);
	        }
		})
		
		$.ajax({
			url : "/chat/getThree",
			contentType : "application/json;charset=utf-8",
		    type : "post",
		    beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        data : session,
	        success : function(result){
	        	console.log(JSON.stringify(result));
	        	code = '';
	        	$.each(result,function(i,v){        
        		code += '<a href="#" onclick="openPopup()" class="dropdown-item">';
        		code += '<div class="media">';
        		code += '<div class="media-body">';
        		code += '<h3 class="dropdown-item-title">';
        		code += v.EMP_NAME;
        		code += '<span class="float-right text-sm text-danger">';
        		code += '</span>';
        		code += '</h3>';
        		code += '<p class="text-sm">'+v.MESSAGE+'</p>';
        		code += '<p class="text-sm text-muted">';
        		let today = new Date();
        		
        		let year = today.getFullYear();
        		let month = ('0' + (today.getMonth() + 1)).slice(-2);
        		let date = ('0' + today.getDate()).slice(-2);
        		
        		currDate = year+"/"+month+"/"+date;
        		
        		if(v.DA == currDate){
        			let time = v.TI;
        			let getTime = time.substring(0,2);
        			let intTime = parseInt(getTime);
        			let str = '';
        			let cvHour = '';
        			
        			if(intTime < 12){
        				str = '오전';
        			}else{
        				str = '오후';
        			}
        			
        			if(intTime == 12){
        				cvHour = intTime;
        			}else{
        				cvHour = intTime % 12;
        			}
        			
        			let res = str + ('0'+cvHour).slice(-2) + time.slice(-3);
        			code += '<i class="far fa-clock mr-1"></i>'+res;
        		}else{
        			code += '<i class="far fa-clock mr-1"></i>'+v.DA;
        		}
        		code += '</p>';
        		code += '</div>';
        		code += '</div>';
        		code += '</a>';
        		code += '<div class="dropdown-divider"></div>';
	        	})
        		code += '<a href="#" onclick="openPopup()" class="dropdown-item dropdown-footer">메시지함</a>';	
	        	$("#getThree").html(code);
	        }
		})
 }
 
</script>
