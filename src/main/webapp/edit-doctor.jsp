<%@ page import="entity.doctors"%>

<%
doctors d = (doctors) request.getAttribute("doctor");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MediFlow MS – Edit Doctor</title>
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
	box-shadow: 0 2px 8px rgba(0, 0, 0, .15);
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
	letter-spacing: .5px;
}

.topnav-logo span {
	font-weight: 300;
	opacity: .85;
}

.topnav-links {
	display: flex;
	gap: 5px;
	margin-left: 30px;
}

.topnav-links a {
	color: rgba(255, 255, 255, .82);
	text-decoration: none;
	padding: 6px 14px;
	border-radius: 6px;
	font-size: 13.5px;
	font-weight: 500;
	transition: background .18s, color .18s;
}

.topnav-links a:hover {
	background: rgba(255, 255, 255, .18);
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
	background: rgba(255, 255, 255, .15);
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
	color: rgba(255, 255, 255, .65);
}

.topnav-search i {
	color: rgba(255, 255, 255, .7);
	font-size: 13px;
}

.topnav-icons {
	display: flex;
	gap: 12px;
	align-items: center;
}

.topnav-icons i {
	color: rgba(255, 255, 255, .85);
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
	color: rgba(255, 255, 255, .7);
	font-size: 11.5px;
}

.avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: rgba(255, 255, 255, .25);
	color: #fff;
	font-weight: 700;
	font-size: 13px;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid rgba(255, 255, 255, .4);
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
	transition: all .18s;
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
	transition: all .18s;
}

.bottom-menu a:hover {
	color: var(--blue);
	background: var(--blue-light);
}

/* ── LAYOUT ── */
.layout-wrapper {
	display: flex;
	flex-direction: column;
	flex: 1;
}

.layout {
	display: flex;
	flex: 1;
}

.main {
	margin-left: var(--sidebar-w);
	flex: 1;
	padding: 22px 22px 30px;
	padding-top: 136px;
	min-width: 0;
}

/* ── FORM CARD ── */
.page-card {
	background: var(--white);
	border-radius: 12px;
	box-shadow: 0 1px 6px rgba(0, 0, 0, .07);
	max-width: 760px;
	margin: 0 auto;
}

.page-card-header {
	padding: 18px 24px;
	border-bottom: 1px solid var(--border);
	display: flex;
	align-items: center;
	gap: 12px;
}

.page-card-header .header-icon {
	width: 42px;
	height: 42px;
	border-radius: 10px;
	background: var(--blue-light);
	color: var(--blue);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	flex-shrink: 0;
}

.page-card-header h3 {
	font-size: 16px;
	font-weight: 700;
	color: var(--text);
}

.page-card-header p {
	font-size: 12px;
	color: var(--muted);
	margin-top: 2px;
}

.page-card-body {
	padding: 24px;
}

/* ── FORM FIELDS ── */
.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 18px;
}

.form-grid .full-width {
	grid-column: 1/-1;
}

.form-group label {
	font-size: 12px;
	font-weight: 600;
	color: var(--muted);
	text-transform: uppercase;
	letter-spacing: .4px;
	display: block;
	margin-bottom: 6px;
}

.form-control {
	width: 100%;
	padding: 9px 13px;
	font-size: 13.5px;
	color: var(--text);
	border: 1.5px solid var(--border);
	border-radius: 8px;
	outline: none;
	transition: border-color .18s, box-shadow .18s;
}

.form-control:focus {
	border-color: var(--blue);
	box-shadow: 0 0 0 3px rgba(43, 101, 201, .1);
}

/* ── BUTTONS ── */
.btn-group {
	display: flex;
	gap: 10px;
	margin-top: 6px;
}

.btn {
	padding: 9px 22px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	font-size: 13.5px;
	font-weight: 600;
	transition: all .18s;
	display: inline-flex;
	align-items: center;
	gap: 7px;
	text-decoration: none;
}

.btn-success {
	background: #17884a;
	color: #fff;
}

.btn-success:hover {
	background: #116638;
}

.btn-secondary {
	background: #6c757d;
	color: #fff;
}

.btn-secondary:hover {
	background: #555;
}

/* ── DOCTOR INFO BADGE ── */
.doctor-info-bar {
	background: var(--blue-light);
	border-radius: 8px;
	padding: 10px 16px;
	margin-bottom: 20px;
	font-size: 13px;
	color: var(--blue);
	font-weight: 500;
	display: flex;
	align-items: center;
	gap: 8px;
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

@media ( max-width : 768px) {
	:root {
		--sidebar-w: 0px;
	}
	.sidebar {
		left: -240px;
		width: 240px;
		transition: left .25s;
		z-index: 200;
	}
	.sidebar.open {
		left: 0;
	}
	.sidebar-overlay {
		display: block;
		position: fixed;
		inset: 0;
		background: rgba(0, 0, 0, .35);
		z-index: 199;
		opacity: 0;
		pointer-events: none;
		transition: opacity .25s;
	}
	.sidebar-overlay.open {
		opacity: 1;
		pointer-events: all;
	}
	.subnav {
		left: 0;
	}
	.main {
		margin-left: 0;
		padding: 14px;
		padding-top: 120px;
	}
	.hamburger {
		display: block;
	}
	.topnav-links, .topnav-user-info {
		display: none;
	}
	.form-grid {
		grid-template-columns: 1fr;
	}
}

@media ( max-width : 480px) {
	.topnav-search {
		display: none;
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
	if (userInitials == null)
		userInitials = userName.substring(0, 1).toUpperCase();
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
				<a href="index.jsp"><i class="fa-solid fa-house"></i> Home</a> <a
					href="about.jsp"><i class="fa-solid fa-circle-info"></i> About</a>
			</div>
		</div>
		<div class="topnav-right">
			<div class="topnav-search">
				<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
					placeholder="Search doctors, records...">
			</div>
			<div class="topnav-icons">
				<i class="fa-regular fa-bell"></i> <i
					class="fa-regular fa-circle-question"></i>
			</div>
			<div class="topnav-user">
				<div class="topnav-user-info">
					<strong><%=userName%></strong><small><%=userRole%></small>
				</div>
				<div class="avatar"><%=userInitials%></div>
			</div>
		</div>
	</nav>

	<div class="sidebar-overlay" id="sidebarOverlay"
		onclick="toggleSidebar()"></div>

	<!-- SUBNAV -->
	<div class="subnav">
		<span class="subnav-title">Doctors</span> <span class="breadcrumb">
			<i class="fa-solid fa-chevron-right"></i> Management <i
			class="fa-solid fa-chevron-right"></i> Edit
		</span>
	</div>

	<div class="layout-wrapper">
		<div class="layout">

			<!-- SIDEBAR -->
			<aside class="sidebar" id="sidebar">
				<div class="menu">
					<a href="index.jsp"><i class="fa-solid fa-table-columns"></i>
						Dashboard</a> <a href="patient"><i
						class="fa-solid fa-user-injured"></i> Patients</a> <a class="active"
						href="doctor"><i class="fa-solid fa-user-doctor"></i> Doctors</a>
					<a href="appointment.jsp"><i class="fa-solid fa-calendar-check"></i>
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

				<div class="page-card">
					<div class="page-card-header">
						<div class="header-icon">
							<i class="fa-solid fa-user-pen"></i>
						</div>
						<div>
							<h3>Edit Doctor</h3>
							<p>Update doctor information below</p>
						</div>
					</div>
					<div class="page-card-body">

						<div class="doctor-info-bar">
							<i class="fa-solid fa-circle-info"></i> Editing record for: <strong
								style="margin-left: 4px;"><%=d.getDoctor_name()%></strong>
							&nbsp;|&nbsp; ID: <strong>#<%=d.getDoctor_id()%></strong>
						</div>

						<form action="doctor" method="post">
							<input type="hidden" name="action" value="update"> <input
								type="hidden" name="doctor_id" value="<%=d.getDoctor_id()%>">

							<div class="form-grid">

								<div class="form-group">
									<label><i class="fa-solid fa-user-doctor"
										style="margin-right: 5px"></i>Doctor Name</label> <input type="text"
										name="doctor_name" class="form-control"
										value="<%=d.getDoctor_name()%>" required>
								</div>

								<div class="form-group">
									<label><i class="fa-solid fa-stethoscope"
										style="margin-right: 5px"></i>Specialization</label> <input
										type="text" name="specialization" class="form-control"
										value="<%=d.getSpecialization()%>" required>
								</div>

								<div class="form-group">
									<label><i class="fa-solid fa-phone"
										style="margin-right: 5px"></i>Phone</label> <input type="text"
										name="phone" class="form-control" value="<%=d.getPhone()%>"
										required>
								</div>

								<div class="form-group">
									<label><i class="fa-regular fa-envelope"
										style="margin-right: 5px"></i>Email</label> <input type="email"
										name="email" class="form-control" value="<%=d.getEmail()%>"
										required>
								</div>

								<div class="form-group full-width">
									<label><i class="fa-solid fa-building"
										style="margin-right: 5px"></i>Department ID</label> <input
										type="number" name="department_id" class="form-control"
										value="<%=d.getDepartment_id()%>" required>
								</div>

								<div class="form-group full-width">
									<div class="btn-group">
										<button type="submit" class="btn btn-success">
											<i class="fa-solid fa-floppy-disk"></i> Save Changes
										</button>
										<a href="doctor" class="btn btn-secondary"> <i
											class="fa-solid fa-arrow-left"></i> Cancel
										</a>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>

			</main>
		</div>

		<!-- FOOTER -->
		<footer
			style="background: #1a2d4f; color: rgba(255, 255, 255, .6); font-size: 12.5px; padding: 16px 30px; margin-left: var(--sidebar-w); display: flex; justify-content: space-between; align-items: center;">
			<span>&copy; 2025 MediFlow MS. All rights reserved.</span> <a
				href="doctor"
				style="color: rgba(255, 255, 255, .6); text-decoration: none;">
				<i class="fa-solid fa-arrow-left" style="margin-right: 5px"></i>Back
				to Doctors
			</a>
		</footer>
	</div>

	<script>
		function toggleSidebar() {
			document.getElementById('sidebar').classList.toggle('open');
			document.getElementById('sidebarOverlay').classList.toggle('open');
		}
	</script>
</body>
</html>
