<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CashBook</title>

<!-- App favicon -->
<link rel="shortcut icon" href="/resources/dist/assets/images/favicon.ico">

<!-- Bootstrap Css -->
<link href="/resources/dist/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="/resources/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="/resources/dist/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
</head>

<body>
	<!-- Page Wrapper -->
	<div id="layout-wrapper">
		<!-- Header_navbar -->
		<tiles:insertAttribute name="header" />
	
		<!-- Sidebar -->
		<tiles:insertAttribute name="aside" />
		
		<!-- content -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		</div>
	</div>

	<!-- JAVASCRIPT -->
	<script src="/resources/dist/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/dist/assets/libs/metismenujs/metismenujs.min.js"></script>
	<script src="/resources/dist/assets/libs/simplebar/simplebar.min.js"></script>
	<script src="/resources/dist/assets/libs/eva-icons/eva.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- apexcharts -->
	<script src="/resources/dist/assets/libs/apexcharts/apexcharts.min.js"></script>

	<script src="/resources/dist/assets/js/pages/dashboard.init.js"></script>

	<script src="/resources/dist/assets/js/app.js"></script>
</body>
</html>