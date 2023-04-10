<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

	<!-- LOGO -->
	<div class="navbar-brand-box">
		<a href="index.html" class="logo logo-dark"> <span class="logo-sm">
				<img src="/resources/dist/assets/images/logo-dark-sm.png" alt="" height="22">
		</span> <span class="logo-lg"> <img src="/resources/dist/assets/images/logo-dark.png"
				alt="" height="22">
		</span>
		</a> <a href="index.html" class="logo logo-light"> <span
			class="logo-lg"> <img src="/resources/dist/assets/images/logo-light.png"
				alt="" height="22">
		</span> <span class="logo-sm"> <img
				src="/resources/dist/assets/images/logo-light-sm.png" alt="" height="22">
		</span>
		</a>
	</div>

	<button type="button"
		class="btn btn-sm px-3 header-item vertical-menu-btn topnav-hamburger">
		<span class="hamburger-icon"> <span></span> <span></span> <span></span>
		</span>
	</button>

	<div data-simplebar class="sidebar-menu-scroll">

		<!--- Sidemenu -->
		<div id="sidebar-menu">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled" id="side-menu">

				<li class="menu-title" data-key="t-applications">Menu</li>

				<li>
					<a href="/list/CashBookList">
					<i class="icon nav-icon" data-eva="list"></i>
					<span class="menu-item" data-key="t-chat">내역</span>
				</a></li>

				<li><a href="apps-file-manager.html"> <i
						class="icon nav-icon" data-eva="pie-chart"></i> <span
						class="menu-item" data-key="t-filemanager">통계</span>
				</a></li>

				<li><a href="apps-file-manager.html"> <i
						class="icon nav-icon" data-eva="settings-outline"></i> <span
						class="menu-item" data-key="t-filemanager">설정</span>
				</a></li>
			</ul>
		</div>
		<!-- Sidebar -->

	</div>
</div>
<!-- Left Sidebar End -->
