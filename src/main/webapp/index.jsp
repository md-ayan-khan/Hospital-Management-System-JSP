	<%@page import="entity.TimeLine"%>
	<%@page import="java.util.List"%>
	<%@page import="java.util.*"%>
	<%@page import="entity.WorkloadReport"%>
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MediFlow MS Dashboard</title>
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
		rel="stylesheet">
	<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Segoe UI', sans-serif;
	}
	
	:root {
		--blue: #2b65c9;
		--blue-light: #e9f1ff;
		--bg: #f4f6fb;
		--white: #fff;
		--border: #e0e6f0;
		--text: #222;
		--muted: #777;
		--sidebar-w: 220px;
		--topnav-h: 52px;
		--subnav-h: 48px;
	}
	
	body {
		background: var(--bg);
		min-height: 100vh;
		display: flex;
		flex-direction: column;
	}
	
	/* ── TOP NAVBAR ── */
	.topnav {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 100;
		height: var(--topnav-h);
		background: var(--blue);
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 0 20px;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
	}
	
	.topnav-left {
		display: flex;
		align-items: center;
		gap: 10px;
	}
	
	.topnav-logo {
		color: #fff;
		font-size: 20px;
		font-weight: 700;
		letter-spacing: 0.5px;
	}
	
	.topnav-logo span {
		font-weight: 300;
		opacity: 0.85;
	}
	
	.topnav-links {
		display: flex;
		gap: 5px;
		margin-left: 30px;
	}
	
	.topnav-links a {
		color: rgba(255, 255, 255, 0.82);
		text-decoration: none;
		padding: 6px 14px;
		border-radius: 6px;
		font-size: 13.5px;
		font-weight: 500;
		transition: background 0.18s, color 0.18s;
	}
	
	.topnav-links a:hover, .topnav-links a.active {
		background: rgba(255, 255, 255, 0.18);
		color: #fff;
	}
	
	.topnav-right {
		display: flex;
		align-items: center;
		gap: 14px;
	}
	
	.topnav-search {
		display: flex;
		align-items: center;
		background: rgba(255, 255, 255, 0.15);
		border-radius: 8px;
		padding: 5px 12px;
		gap: 8px;
	}
	
	.topnav-search input {
		background: transparent;
		border: none;
		outline: none;
		color: #fff;
		font-size: 13px;
		width: 180px;
	}
	
	.topnav-search input::placeholder {
		color: rgba(255, 255, 255, 0.65);
	}
	
	.topnav-search i {
		color: rgba(255, 255, 255, 0.7);
		font-size: 13px;
	}
	
	.topnav-icons {
		display: flex;
		gap: 12px;
		align-items: center;
	}
	
	.topnav-icons i {
		color: rgba(255, 255, 255, 0.85);
		font-size: 16px;
		cursor: pointer;
	}
	
	.topnav-user {
		display: flex;
		align-items: center;
		gap: 9px;
	}
	
	.topnav-user-info {
		text-align: right;
	}
	
	.topnav-user-info strong {
		color: #fff;
		font-size: 13.5px;
		display: block;
	}
	
	.topnav-user-info small {
		color: rgba(255, 255, 255, 0.7);
		font-size: 11.5px;
	}
	
	.avatar {
		width: 36px;
		height: 36px;
		border-radius: 50%;
		background: rgba(255, 255, 255, 0.25);
		color: #fff;
		font-weight: 700;
		font-size: 13px;
		display: flex;
		align-items: center;
		justify-content: center;
		border: 2px solid rgba(255, 255, 255, 0.4);
	}
	
	/* ── SUBNAV ── */
	.subnav {
		position: fixed;
		top: var(--topnav-h);
		left: var(--sidebar-w);
		right: 0;
		z-index: 90;
		height: var(--subnav-h);
		background: var(--white);
		border-bottom: 1px solid var(--border);
		display: flex;
		align-items: center;
		padding: 0 20px;
		gap: 8px;
	}
	
	.subnav-title {
		font-size: 15px;
		font-weight: 600;
		color: var(--text);
		margin-right: 10px;
	}
	
	.breadcrumb {
		font-size: 12.5px;
		color: var(--muted);
		display: flex;
		align-items: center;
		gap: 5px;
	}
	
	.breadcrumb i {
		font-size: 10px;
	}
	
	/* ── SIDEBAR ── */
	.sidebar {
		width: var(--sidebar-w);
		background: var(--white);
		border-right: 1px solid var(--border);
		position: fixed;
		top: var(--topnav-h);
		bottom: 0;
		left: 0;
		display: flex;
		flex-direction: column;
		overflow-y: auto;
		z-index: 80;
	}
	
	.menu {
		padding-top: calc(var(--subnav-h)+ 6px);
		flex: 1;
	}
	
	.menu a {
		display: flex;
		align-items: center;
		gap: 11px;
		padding: 13px 22px;
		text-decoration: none;
		color: #555;
		font-weight: 500;
		font-size: 14px;
		border-left: 3px solid transparent;
		transition: all 0.18s;
	}
	
	.menu a i {
		width: 18px;
		text-align: center;
		font-size: 15px;
	}
	
	.menu a:hover, .menu a.active {
		background: var(--blue-light);
		color: var(--blue);
		border-left-color: var(--blue);
	}
	
	.menu a.active {
		font-weight: 600;
	}
	
	.bottom-menu {
		border-top: 1px solid var(--border);
		padding: 10px 0;
	}
	
	.bottom-menu a {
		display: flex;
		align-items: center;
		gap: 11px;
		padding: 12px 22px;
		text-decoration: none;
		color: #555;
		font-size: 14px;
		transition: all 0.18s;
	}
	
	.bottom-menu a:hover {
		color: var(--blue);
		background: var(--blue-light);
	}
	
	/* ── LAYOUT WRAPPER ── */
	.layout-wrapper {
		display: flex;
		flex-direction: column;
		flex: 1;
	}
	
	.layout {
		display: flex;
		flex: 1;
	}
	
	/* ── MAIN CONTENT ── */
	.main {
		margin-left: var(--sidebar-w);
		flex: 1;
		padding: 22px 22px 30px 22px;
		min-width: 0;
		position: relative;
		z-index: 1;
		padding-top: calc(var(--topnav-h)+ var(--subnav-h)+ 22px);
		padding-top: 120px;
	}
	
	/* ── STAT CARDS ── */
	.cards {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 16px;
		margin-bottom: 20px;
		margin-top: 4px;
	}
	
	/* FIX: Card ko flexbox se layout karo */
	.card {
		background: var(--white);
		border-radius: 12px;
		padding: 20px 22px;
		box-shadow: 0 1px 6px rgba(0, 0, 0, 0.07);
		border-top: 3px solid var(--blue);
		transition: transform 0.22s, box-shadow 0.22s;
		cursor: default;
		animation: cardIn 0.5s ease both;
		position: relative;
		display: flex; /* ADDED */
		flex-direction: column; /* ADDED */
		min-height: 120px; /* ADDED */
	}
	
	/* FIX: Icon top-right mein absolute position */
	.card-icon {
		position: absolute; /* CHANGED from float:right */
		top: 20px;
		right: 20px;
		width: 44px;
		height: 44px;
		border-radius: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 18px;
	}
	
	.card h4 {
		font-size: 12.5px;
		color: var(--muted);
		margin-bottom: 8px;
		text-transform: uppercase;
		letter-spacing: 0.5px;
		padding-right: 52px; /* ADDED: icon ke liye space */
	}
	
	.card .number {
		font-size: 34px;
		font-weight: 700;
		color: var(--text);
		line-height: 1.1;
	}
	
	.card .sub {
		margin-top: 6px;
		font-size: 12px;
		color: var(--muted);
	}
	
	/* Card colors */
	.card:nth-child(1) {
		animation-delay: .05s;
		border-top-color: #2b65c9;
	}
	
	.card:nth-child(2) {
		animation-delay: .12s;
		border-top-color: #17884a;
	}
	
	.card:nth-child(3) {
		animation-delay: .19s;
		border-top-color: #d47c00;
	}
	
	.card:nth-child(4) {
		animation-delay: .26s;
		border-top-color: #b0246a;
	}
	
	.card:nth-child(1) .card-icon {
		background: #e9f1ff;
		color: #2b65c9;
	}
	
	.card:nth-child(2) .card-icon {
		background: #dff7e7;
		color: #17884a;
	}
	
	.card:nth-child(3) .card-icon {
		background: #fff3dc;
		color: #d47c00;
	}
	
	.card:nth-child(4) .card-icon {
		background: #fde8f3;
		color: #b0246a;
	}
	
	@
	keyframes cardIn {from { opacity:0;
		transform: translateY(18px);
	}
	
	to {
		opacity: 1;
		transform: translateY(0);
	}
	
	}
	.card:hover {
		transform: translateY(-4px);
		box-shadow: 0 6px 20px rgba(43, 101, 201, 0.13);
	}
	
	/* ── MIDDLE ROW ── */
	.middle-row {
		display: grid;
		grid-template-columns: 1.7fr 1fr;
		gap: 16px;
		margin-bottom: 20px;
	}
	
	.panel {
		background: var(--white);
		border-radius: 12px;
		box-shadow: 0 1px 6px rgba(0, 0, 0, 0.07);
		overflow: hidden;
		display: flex;
		flex-direction: column;
	}
	
	.panel-header {
		padding: 16px 18px 10px;
		border-bottom: 1px solid var(--border);
		flex-shrink: 0;
	}
	
	.panel-header h3 {
		font-size: 15px;
		font-weight: 600;
		color: var(--text);
	}
	
	.panel-header p {
		font-size: 12px;
		color: var(--muted);
		margin-top: 2px;
	}
	
	.panel-body {
		padding: 12px 18px;
		flex: 1;
		overflow-y: auto;
	}
	
	.panel-body::-webkit-scrollbar {
		width: 4px;
	}
	
	.panel-body::-webkit-scrollbar-thumb {
		background: #c5d4ee;
		border-radius: 4px;
	}
	
	.workload-panel {
		height: 300px;
	}
	
	.activity-panel {
		height: 300px;
	}
	
	.progress-group {
		margin-bottom: 16px;
	}
	
	.progress-title {
		display: flex;
		justify-content: space-between;
		font-size: 13px;
		font-weight: 600;
		margin-bottom: 6px;
		color: var(--text);
	}
	
	.progress-title span:last-child {
		font-weight: 400;
		color: var(--muted);
		font-size: 12px;
	}
	
	.progress-bar-bg {
		height: 9px;
		background: #dfe7f4;
		border-radius: 20px;
		overflow: hidden;
	}
	
	.progress-bar-fill {
		height: 100%;
		background: linear-gradient(90deg, #2b65c9, #5b8ee6);
		border-radius: 20px;
		transition: width 1s ease;
	}
	
	.no-data {
		color: #d92323;
		font-size: 13px;
		padding: 10px 0;
	}
	
	.activity-item {
		display: flex;
		align-items: flex-start;
		gap: 11px;
		padding: 10px 0;
		border-bottom: 1px solid #f0f0f0;
	}
	
	.activity-item:last-child {
		border-bottom: none;
	}
	
	.act-icon {
		width: 34px;
		height: 34px;
		flex-shrink: 0;
		border-radius: 50%;
		background: var(--blue-light);
		color: var(--blue);
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 14px;
	}
	
	.act-text {
		font-size: 13.5px;
		color: var(--text);
		font-weight: 500;
	}
	
	.act-time {
		font-size: 11.5px;
		color: var(--muted);
		margin-top: 2px;
	}
	
	/* ── BOTTOM ROW ── */
	.bottom-row {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 16px;
		margin-bottom: 20px;
	}
	
	.info-panel {
		background: var(--white);
		border-radius: 12px;
		box-shadow: 0 1px 6px rgba(0, 0, 0, 0.07);
		padding: 16px 18px;
		display: flex;
		flex-direction: column;
		gap: 6px;
		border-bottom: 3px solid var(--border);
	}
	
	.ip-blue {
		border-bottom-color: #2b65c9;
	}
	
	.ip-green {
		border-bottom-color: #17884a;
	}
	
	.ip-pink {
		border-bottom-color: #b0246a;
	}
	
	.info-panel .ip-header {
		display: flex;
		align-items: center;
		gap: 10px;
		margin-bottom: 4px;
	}
	
	.info-panel .ip-icon {
		width: 36px;
		height: 36px;
		border-radius: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 16px;
		flex-shrink: 0;
	}
	
	.info-panel .ip-title {
		font-size: 14px;
		font-weight: 600;
		color: var(--text);
	}
	
	.info-panel .ip-sub {
		font-size: 12px;
		color: var(--muted);
	}
	
	.info-panel .ip-list {
		list-style: none;
		margin-top: 2px;
	}
	
	.info-panel .ip-list li {
		font-size: 13px;
		color: var(--text);
		padding: 6px 0;
		border-bottom: 1px solid #f0f3f9;
		display: flex;
		align-items: center;
		gap: 8px;
	}
	
	.info-panel .ip-list li:last-child {
		border-bottom: none;
	}
	
	.info-panel .ip-list li i {
		color: var(--blue);
		font-size: 12px;
		width: 14px;
	}
	
	.info-panel .ip-list li a {
		color: var(--text);
		text-decoration: none;
		transition: color 0.18s;
	}
	
	.info-panel .ip-list li a:hover {
		color: var(--blue);
	}
	
	.ip-blue  .ip-icon {
		background: #e9f1ff;
		color: #2b65c9;
	}
	
	.ip-green .ip-icon {
		background: #dff7e7;
		color: #17884a;
	}
	
	.ip-pink  .ip-icon {
		background: #fde8f3;
		color: #b0246a;
	}
	
	/* ── FOOTER ── */
	footer {
		background: #1a2d4f;
		color: rgba(255, 255, 255, 0.75);
		font-size: 13px;
		padding: 28px 30px 20px;
		margin-left: var(--sidebar-w);
	}
	
	.footer-inner {
		display: grid;
		grid-template-columns: 2fr 1fr 1fr;
		gap: 30px;
		max-width: 1200px;
		padding-bottom: 20px;
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
		margin-bottom: 16px;
	}
	
	.footer-brand .brand-name {
		color: #fff;
		font-size: 17px;
		font-weight: 700;
		margin-bottom: 8px;
	}
	
	.footer-brand p {
		line-height: 1.6;
		max-width: 280px;
	}
	
	.footer-col h5 {
		color: #fff;
		font-size: 13px;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.6px;
		margin-bottom: 12px;
	}
	
	.footer-col ul {
		list-style: none;
	}
	
	.footer-col ul li {
		margin-bottom: 8px;
	}
	
	.footer-col ul li a {
		color: rgba(255, 255, 255, 0.65);
		text-decoration: none;
		transition: color 0.18s;
	}
	
	.footer-col ul li a:hover {
		color: #fff;
	}
	
	.footer-bottom {
		display: flex;
		justify-content: space-between;
		align-items: center;
		color: rgba(255, 255, 255, 0.45);
		font-size: 12px;
	}
	
	.footer-bottom .footer-links {
		display: flex;
		gap: 18px;
	}
	
	.footer-bottom .footer-links a {
		color: rgba(255, 255, 255, 0.45);
		text-decoration: none;
	}
	
	.footer-bottom .footer-links a:hover {
		color: rgba(255, 255, 255, 0.8);
	}
	
	/* ── HAMBURGER ── */
	.hamburger {
		display: none;
		background: none;
		border: none;
		cursor: pointer;
		padding: 5px;
	}
	
	.hamburger i {
		color: #fff;
		font-size: 20px;
	}
	
	.sidebar-overlay {
		display: none;
	}
	
	/* ── RESPONSIVE ── */
	@media ( max-width : 1100px) {
		.cards {
			grid-template-columns: repeat(2, 1fr);
		}
		.bottom-row {
			grid-template-columns: repeat(2, 1fr);
		}
	}
	
	@media ( max-width : 900px) {
		.middle-row {
			grid-template-columns: 1fr;
		}
		.workload-panel, .activity-panel {
			height: 260px;
		}
		.bottom-row {
			grid-template-columns: 1fr;
		}
	}
	
	@media ( max-width : 768px) {
		:root {
			--sidebar-w: 0px;
		}
		.sidebar {
			left: -240px;
			width: 240px;
			top: var(--topnav-h);
			transition: left 0.25s ease;
			z-index: 200;
		}
		.sidebar.open {
			left: 0;
		}
		.sidebar-overlay {
			display: block;
			position: fixed;
			inset: 0;
			background: rgba(0, 0, 0, 0.35);
			z-index: 199;
			opacity: 0;
			pointer-events: none;
			transition: opacity 0.25s;
		}
		.sidebar-overlay.open {
			opacity: 1;
			pointer-events: all;
		}
		.subnav {
			left: 0;
			padding-left: 20px;
		}
		.main {
			margin-left: 0;
			padding: 14px;
			padding-top: calc(var(--topnav-h)+ var(--subnav-h)+ 14px);
		}
		.hamburger {
			display: block;
		}
		.topnav-links {
			display: none;
		}
		.topnav-search input {
			width: 110px;
		}
		.topnav-user-info {
			display: none;
		}
		.cards {
			grid-template-columns: repeat(2, 1fr);
		}
		footer {
			margin-left: 0;
		}
		.footer-inner {
			grid-template-columns: 1fr;
			gap: 20px;
		}
		.footer-bottom {
			flex-direction: column;
			gap: 10px;
			text-align: center;
		}
	}
	
	@media ( max-width : 480px) {
		.cards {
			grid-template-columns: 1fr;
		}
		.topnav-search {
			display: none;
		}
		.bottom-row {
			grid-template-columns: 1fr;
		}
	}
	</style>
	</head>
	<body>
	
		<%
		String userName = (String) session.getAttribute("userName");
		String userRole = (String) session.getAttribute("userRole");
		String userInitials = (String) session.getAttribute("userInitials");
		if (userName == null)
			userName = "Guest";
		if (userRole == null)
			userRole = "User";
		if (userInitials == null) {
			String[] parts = userName.trim().split("\\s+");
			StringBuilder initials = new StringBuilder();
			for (String p : parts) {
				if (!p.isEmpty() && !p.equalsIgnoreCase("Dr.") && !p.equalsIgnoreCase("Dr"))
			initials.append(p.charAt(0));
				if (initials.length() >= 2)
			break;
			}
			userInitials = initials.length() > 0 ? initials.toString().toUpperCase() : userName.substring(0, 1).toUpperCase();
		}
	
		Integer totalPatients = (Integer) request.getAttribute("patientCount");
		Integer totalAppt = (Integer) request.getAttribute("appointmentCount");
		Integer apptRemaining = (Integer) request.getAttribute("apptRemaining");
		Integer billCount = (Integer) request.getAttribute("billCount");
		Integer totalDoctors = (Integer) request.getAttribute("doctorCount");
	
		if (totalPatients == null)
			totalPatients = 0;
		if (totalAppt == null)
			totalAppt = 0;
		if (apptRemaining == null)
			apptRemaining = 0;
		if (billCount == null)
		    billCount = 0;
		if (totalDoctors == null)
			totalDoctors = 0;
		%>
	
		<!-- TOP NAVBAR -->
		<nav class="topnav">
			<div class="topnav-left">
				<button class="hamburger" onclick="toggleSidebar()">
					<i class="fa-solid fa-bars"></i>
				</button>
				<div class="topnav-logo">
					MediFlow <span>MS</span>
				</div>
				<div class="topnav-links">
					<a href="index.jsp" class="active"><i class="fa-solid fa-house"></i>
						Home</a> <a href="about.jsp"><i class="fa-solid fa-circle-info"></i>
						About</a>
				</div>
			</div>
			<div class="topnav-right">
				<div class="topnav-search">
					<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
						placeholder="Search patients, records...">
				</div>
				<div class="topnav-icons">
					<i class="fa-regular fa-bell" title="Notifications"></i> <i
						class="fa-regular fa-circle-question" title="Help"></i>
				</div>
				<div class="topnav-user">
					<div class="topnav-user-info">
						<strong><%=userName%></strong> <small><%=userRole%></small>
					</div>
					<div class="avatar"><%=userInitials%></div>
				</div>
			</div>
		</nav>
	
		<div class="sidebar-overlay" id="sidebarOverlay"
			onclick="toggleSidebar()"></div>
	
		<!-- SUB NAV -->
		<div class="subnav">
			<span class="subnav-title">Dashboard</span> <span class="breadcrumb"><i
				class="fa-solid fa-chevron-right"></i> Overview</span>
		</div>
	
		<div class="layout-wrapper">
			<div class="layout">
	
				<!-- SIDEBAR -->
				<aside class="sidebar" id="sidebar">
					<div class="menu">
						<a class="active" href="dashboard"><i
							class="fa-solid fa-table-columns"></i> Dashboard</a> <a
							href="patient.jsp"><i class="fa-solid fa-user-injured"></i>
							Patients</a> <a href="doctor.jsp"><i
							class="fa-solid fa-user-doctor"></i> Doctors</a> <a
							href="appointment.jsp"><i class="fa-solid fa-calendar-check"></i>
							Appointments</a> <a href="bill.jsp"><i
							class="fa-solid fa-money-bill"></i> Billing</a> <a
							href="department.jsp"><i class="fa-solid fa-building"></i>
							Departments</a>
					</div>
					<div class="bottom-menu">
						<a href="settings.jsp"><i class="fa-solid fa-gear"></i>
							Settings</a> <a href="logout.jsp"><i
							class="fa-solid fa-right-from-bracket"></i> Logout</a>
					</div>
				</aside>
	
				<!-- MAIN -->
				<main class="main">
	
					<!-- 4 STAT CARDS -->
					<div class="cards">
						<div class="card">
							<div class="card-icon">
								<i class="fa-solid fa-users"></i>
							</div>
							<h4>Total Patients</h4>
							<div class="number" id="cnt-patients">
								<%=request.getAttribute("patientCount")%>
							</div>
							<div class="sub">+12% this month</div>
						</div>
	
						<div class="card">
							<div class="card-icon">
								<i class="fa-solid fa-calendar-check"></i>
							</div>
							<h4>Appointments Today</h4>
							<div class="number" id="cnt-appt">
								<%=request.getAttribute("appointmentCount")%>
							</div>
							<div class="sub"><%=apptRemaining%>
								remaining
							</div>
						</div>
	
						<div class="card">
							<div class="card-icon">
								<i class="fa-solid fa-file-invoice-dollar"></i>
							</div>
							<h4>Pending Bills</h4>
							<div class="number" id="cnt-bills">
								<%=request.getAttribute("billCount")%>
							</div>
							<div class="sub">High priority</div>
						</div>
	
						<div class="card">
							<div class="card-icon">
								<i class="fa-solid fa-user-doctor"></i>
							</div>
							<h4>Total Doctors</h4>
							<div class="number" id="cnt-doctors">
								<%=request.getAttribute("doctorCount")%>
							</div>
							<div class="sub">Active staff</div>
						</div>
					</div>	
	
					
	
					<!-- MIDDLE ROW -->
					<div class="middle-row">
	
						<!-- WORKLOAD -->
						<div class="panel workload-panel">
							<div class="panel-header">
								<h3>
									<i class="fa-solid fa-chart-bar"
										style="color: var(--blue); margin-right: 7px"></i>Doctor
									Workload
								</h3>
								<p>Patient distribution by department</p>
							</div>
							<div class="panel-body">
								<%
								List<WorkloadReport> list = (List<WorkloadReport>) request.getAttribute("workloadList");
								if (list != null && !list.isEmpty()) {
									for (WorkloadReport w : list) {
										int pct = Math.min(w.getTotalPatients() * 10, 100);
								%>
								<div class="progress-group">
									<div class="progress-title">
										<span><%=w.getDepartmentName()%></span> <span><%=w.getTotalPatients()%>
											pt / <%=w.getTotalDoctors()%> dr</span>
									</div>
									<div class="progress-bar-bg">
										<div class="progress-bar-fill" style="width:<%=pct%>%"></div>
									</div>
								</div>
								<%
								}
								} else {
								%>
								<div class="no-data">
									<i class="fa-solid fa-circle-exclamation"></i> No workload data
									found
								</div>
								<%
								}
								%>
							</div>
						</div>
	
						<!-- RECENT ACTIVITY -->
						<div class="panel activity-panel">
							<div class="panel-header">
								<h3>
									<i class="fa-solid fa-clock-rotate-left"
										style="color: var(--blue); margin-right: 7px"></i>Recent
									Activity
								</h3>
								<p>Latest hospital updates</p>
							</div>
							<div class="panel-body">
								<%
								List<TimeLine> activities = (List<TimeLine>) request.getAttribute("activities");
								if (activities != null && !activities.isEmpty()) {
									for (TimeLine t : activities) {
								%>
								<div class="activity-item">
									<div class="act-icon">
										<i class="fa-solid fa-circle-info"></i>
									</div>
									<div>
										<div class="act-text"><%=t.getTitle()%></div>
										<div class="act-time">
											<i class="fa-regular fa-clock"></i>
											<%=t.getEventDate()%></div>
									</div>
								</div>
								<%
								}
								} else {
								%>
								<div class="no-data">
									<i class="fa-solid fa-circle-exclamation"></i> No recent
									activity
								</div>
								<%
								}
								%>
							</div>
						</div>
	
					</div>
					<!-- END MIDDLE ROW -->
	
					<!-- BOTTOM ROW -->
					<div class="bottom-row">
	
						<div class="info-panel ip-blue">
							<div class="ip-header">
								<div class="ip-icon">
									<i class="fa-solid fa-bolt"></i>
								</div>
								<div>
									<div class="ip-title">Quick Actions</div>
									<div class="ip-sub">Common tasks</div>
								</div>
							</div>
							<ul class="ip-list">
								<li><i class="fa-solid fa-circle-plus"></i> <a
									href="patient.jsp">Register New Patient</a></li>
								<li><i class="fa-solid fa-circle-plus"></i> <a
									href="appointment.jsp">Book Appointment</a></li>
								<li><i class="fa-solid fa-circle-plus"></i> <a
									href="bill.jsp">Generate Bill</a></li>
								<li><i class="fa-solid fa-circle-plus"></i> <a
									href="doctor.jsp">Add New Doctor</a></li>
							</ul>
						</div>
	
						<div class="info-panel ip-green">
							<div class="ip-header">
								<div class="ip-icon">
									<i class="fa-solid fa-server"></i>
								</div>
								<div>
									<div class="ip-title">System Status</div>
									<div class="ip-sub">All services</div>
								</div>
							</div>
							<ul class="ip-list">
								<li><i class="fa-solid fa-circle" style="color: #17884a"></i>
									Patient Records — Online</li>
								<li><i class="fa-solid fa-circle" style="color: #17884a"></i>
									Billing System — Online</li>
								<li><i class="fa-solid fa-circle" style="color: #d47c00"></i>
									Lab Reports — Maintenance</li>
								<li><i class="fa-solid fa-circle" style="color: #17884a"></i>
									Pharmacy Module — Online</li>
							</ul>
						</div>
	
						<div class="info-panel ip-pink">
							<div class="ip-header">
								<div class="ip-icon">
									<i class="fa-solid fa-lightbulb"></i>
								</div>
								<div>
									<div class="ip-title">Did You Know?</div>
									<div class="ip-sub">MediFlow tips</div>
								</div>
							</div>
							<ul class="ip-list">
								<li><i class="fa-solid fa-star"></i> Use search to find
									patients instantly</li>
								<li><i class="fa-solid fa-star"></i> Billing auto-links to
									appointments</li>
								<li><i class="fa-solid fa-star"></i> Department reports
									export to PDF</li>
								<li><i class="fa-solid fa-star"></i> Visit About page to
									learn more</li>
							</ul>
						</div>
	
					</div>
					<!-- END BOTTOM ROW -->
	
				</main>
			</div>
			<!-- END LAYOUT -->
	
			<!-- FOOTER -->
			<footer>
				<div class="footer-inner">
					<div class="footer-brand">
						<div class="brand-name">
							<i class="fa-solid fa-heart-pulse"
								style="color: #5b8ee6; margin-right: 8px"></i>MediFlow MS
						</div>
						<p>A comprehensive hospital management system built to
							streamline patient care, billing, and staff coordination. Trusted
							by healthcare teams to deliver efficient and reliable operations.</p>
					</div>
					<div class="footer-col">
						<h5>Navigation</h5>
						<ul>
							<li><a href="dashboard">Dashboard</a></li>
							<li><a href="patient.jsp">Patients</a></li>
							<li><a href="doctor.jsp">Doctors</a></li>
							<li><a href="appointment.jsp">Appointments</a></li>
							<li><a href="bill.jsp">Billing</a></li>
							<li><a href="department.jsp">Departments</a></li>
						</ul>
					</div>
					<div class="footer-col">
						<h5>System</h5>
						<ul>
							<li><a href="about.jsp">About</a></li>
							<li><a href="settings.jsp">Settings</a></li>
							<li><a href="#">Help &amp; Docs</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</div>
				</div>
				<div class="footer-bottom">
					<span>&copy; 2025 MediFlow MS. All rights reserved.</span>
					<div class="footer-links">
						<a href="#">Privacy Policy</a> <a href="#">Terms of Use</a> <a
							href="about.jsp">About</a>
					</div>
				</div>
			</footer>
	
		</div>
		<!-- END LAYOUT-WRAPPER -->
	
		<script>
	function toggleSidebar() {
	  document.getElementById('sidebar').classList.toggle('open');
	  document.getElementById('sidebarOverlay').classList.toggle('open');
	}
	
	function animateCount(id, target, prefix, suffix) {
	  const el = document.getElementById(id);
	  if (!el) return;
	  let start = 0;
	  const step = Math.ceil(target / (900 / 16));
	  const timer = setInterval(() => {
	    start = Math.min(start + step, target);
	    el.textContent = (prefix || '') + start.toLocaleString() + (suffix || '');
	    if (start >= target) clearInterval(timer);
	  }, 16);
	}
	
	const patientsVal = <%=totalPatients%>;
	const apptVal     = <%=totalAppt%>;
	const doctorsVal  = <%=totalDoctors%>;
	const billVal = <%=billCount%>;
	
	window.addEventListener('DOMContentLoaded', () => {
	  animateCount('cnt-patients', patientsVal, '', '');
	  animateCount('cnt-appt',     apptVal,     '', '');
	  animateCount('cnt-doctors',  doctorsVal,  '', '');
	  animateCount('cnt-bills', billVal);
	});
	</script>
	</body>
	</html>
