<%@ page import="java.util.*"%>
<%@ page import="entity.doctors"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MediFlow MS – Doctors</title>
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

.topnav-links a:hover, .topnav-links a.active {
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

/* ── MAIN ── */
.main {
	margin-left: var(--sidebar-w);
	flex: 1;
	padding-top: 136px;
	padding-left: 24px;
	padding-right: 24px;
	padding-bottom: 36px;
	min-width: 0;
}

/* ── PAGE CARD ── */
.page-card {
	background: var(--white);
	border-radius: 12px;
	box-shadow: 0 1px 6px rgba(0, 0, 0, .07);
	overflow: hidden;
	margin-bottom: 28px;
}

.page-card:last-child {
	margin-bottom: 0;
}

.page-card-header {
	padding: 16px 22px;
	border-bottom: 1px solid var(--border);
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 12px;
	background: var(--white);
}

.page-card-header h3 {
	font-size: 16px;
	font-weight: 700;
	color: var(--text);
}

.page-card-body {
	padding: 22px;
}

/* ── ADD DOCTOR FORM ── */
.add-form .form-row {
	display: grid;
	grid-template-columns: 2fr 1.5fr 1.3fr 2fr 1.2fr auto;
	gap: 12px;
	align-items: end;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-size: 11.5px;
	color: var(--muted);
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: .4px;
	margin-bottom: 5px;
}

.form-control {
	width: 100%;
	padding: 9px 12px;
	font-size: 13.5px;
	color: var(--text);
	border: 1.5px solid var(--border);
	border-radius: 8px;
	outline: none;
	transition: border-color .18s, box-shadow .18s;
	background: #fff;
	height: 38px;
}

.form-control:focus {
	border-color: var(--blue);
	box-shadow: 0 0 0 3px rgba(43, 101, 201, .1);
}

/* ── BUTTONS ── */
.btn {
	padding: 9px 18px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	font-size: 13.5px;
	font-weight: 600;
	transition: all .18s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
	text-decoration: none;
	white-space: nowrap;
	height: 38px;
}

.btn-primary {
	background: var(--blue);
	color: #fff;
}

.btn-primary:hover {
	background: #1e50a8;
}

.btn-success {
	background: #17884a;
	color: #fff;
}

.btn-success:hover {
	background: #116638;
}

.btn-warning {
	background: #d47c00;
	color: #fff;
}

.btn-warning:hover {
	background: #b36800;
}

.btn-danger {
	background: #c0392b;
	color: #fff;
}

.btn-danger:hover {
	background: #a02d22;
}

.btn-outline {
	background: transparent;
	color: var(--blue);
	border: 1.5px solid var(--blue);
}

.btn-outline:hover {
	background: var(--blue-light);
}

.btn-sm {
	padding: 5px 12px;
	font-size: 12.5px;
	border-radius: 6px;
	height: 32px;
}

/* ── SEARCH TOOLBAR ── */
.search-toolbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 12px;
	margin-bottom: 16px;
	flex-wrap: wrap;
}

.search-box {
	display: flex;
	align-items: center;
	gap: 8px;
	background: #f0f4fc;
	border: 1.5px solid var(--border);
	border-radius: 8px;
	padding: 7px 14px;
	flex: 1;
	max-width: 340px;
	transition: border-color .18s;
}

.search-box:focus-within {
	border-color: var(--blue);
	background: #fff;
}

.search-box i {
	color: var(--muted);
	font-size: 13px;
}

.search-box input {
	border: none;
	outline: none;
	background: transparent;
	font-size: 13.5px;
	color: var(--text);
	width: 100%;
}

.search-box input::placeholder {
	color: var(--muted);
}

.result-count {
	font-size: 12.5px;
	color: var(--muted);
}

/* ── TABLE ── */
.data-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 13.5px;
}

.data-table thead tr {
	background: var(--blue);
	color: #fff;
}

.data-table thead th {
	padding: 11px 14px;
	font-weight: 600;
	font-size: 12.5px;
	letter-spacing: .3px;
	text-align: left;
}

.data-table thead th:first-child {
	border-radius: 8px 0 0 0;
}

.data-table thead th:last-child {
	border-radius: 0 8px 0 0;
}

.data-table tbody tr {
	border-bottom: 1px solid #f0f3f9;
	transition: background .15s;
}

.data-table tbody tr:hover {
	background: #f8faff;
}

.data-table tbody tr.hidden-row {
	display: none;
}

.data-table td {
	padding: 11px 14px;
	color: var(--text);
	vertical-align: middle;
}

.no-results {
	text-align: center;
	color: var(--muted);
	padding: 30px;
	font-size: 14px;
	display: none;
}

/* doctor avatar circle */
.doc-avatar {
	width: 34px;
	height: 34px;
	border-radius: 50%;
	background: var(--blue-light);
	color: var(--blue);
	font-weight: 700;
	font-size: 13px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	margin-right: 8px;
	flex-shrink: 0;
}

.doc-name-cell {
	display: flex;
	align-items: center;
}

.spec-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11.5px;
	font-weight: 600;
	background: #f0faf4;
	color: #17884a;
	border: 1px solid #b6e8cc;
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
@media ( max-width : 1200px) {
	.add-form .form-row {
		grid-template-columns: 1fr 1fr 1fr;
		gap: 14px;
	}
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
		padding-top: 120px;
		padding-left: 14px;
		padding-right: 14px;
		padding-bottom: 20px;
	}
	.hamburger {
		display: block;
	}
	.topnav-links {
		display: none;
	}
	.topnav-user-info {
		display: none;
	}
	.add-form .form-row {
		grid-template-columns: 1fr 1fr;
		gap: 12px;
	}
}

@media ( max-width : 480px) {
	.topnav-search {
		display: none;
	}
	.add-form .form-row {
		grid-template-columns: 1fr;
		gap: 10px;
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

	<!-- SUBNAV -->
	<div class="subnav">
		<span class="subnav-title">Doctors</span> <span class="breadcrumb">
			<i class="fa-solid fa-chevron-right"></i> Management
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

				<!-- ADD DOCTOR CARD -->
				<div class="page-card">
					<div class="page-card-header">
						<h3>
							<i class="fa-solid fa-user-plus"
								style="color: var(--blue); margin-right: 8px"></i> Add New
							Doctor
						</h3>
					</div>
					<div class="page-card-body">
						<form action="doctor" method="post" class="add-form">
							<input type="hidden" name="action" value="add">
							<div class="form-row">
								<div class="form-group">
									<label>Doctor Name</label> <input type="text"
										name="doctor_name" class="form-control"
										placeholder="Full name" required>
								</div>
								<div class="form-group">
									<label>Specialization</label> <input type="text"
										name="specialization" class="form-control"
										placeholder="e.g. Cardiologist" required>
								</div>
								<div class="form-group">
									<label>Phone</label> <input type="text" name="phone"
										class="form-control" placeholder="Phone number" required>
								</div>
								<div class="form-group">
									<label>Email</label> <input type="email" name="email"
										class="form-control" placeholder="Email address" required>
								</div>
								<div class="form-group">
									<label>Department ID</label> <input type="number"
										name="department_id" class="form-control"
										placeholder="Dept. ID" required>
								</div>
								<div class="form-group">
									<label>&nbsp;</label>
									<button type="submit" class="btn btn-success">
										<i class="fa-solid fa-plus"></i> Add
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- DOCTOR LIST CARD -->
				<div class="page-card">
					<div class="page-card-header">
						<h3>
							<i class="fa-solid fa-stethoscope"
								style="color: var(--blue); margin-right: 8px"></i> Doctor
							Records
						</h3>
						<a href="doctor" class="btn btn-outline btn-sm"> <i
							class="fa-solid fa-rotate-right"></i> Refresh
						</a>
					</div>
					<div class="page-card-body">

						<!-- SEARCH TOOLBAR -->
						<div class="search-toolbar">
							<div class="search-box">
								<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
									id="doctorSearch" placeholder="Search by doctor name..."
									oninput="filterDoctors()">
							</div>
							<span class="result-count" id="resultCount"></span>
						</div>

						<!-- TABLE -->
						<div style="overflow-x: auto;">
							<table class="data-table" id="doctorTable">
								<thead>
									<tr>
										<th>#ID</th>
										<th>Name</th>
										<th>Specialization</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Dept. ID</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="doctorBody">
									<%
									List<doctors> list = (List<doctors>) request.getAttribute("doctors");
									if (list != null) {
										for (doctors d : list) {
											String initials = d.getDoctor_name() != null && d.getDoctor_name().length() > 0
											? d.getDoctor_name().substring(0, 1).toUpperCase()
											: "D";
									%>
									<tr>
										<td><strong>#<%=d.getDoctor_id()%></strong></td>
										<td>
											<div class="doc-name-cell">
												<div class="doc-avatar"><%=initials%></div>
												<span><%=d.getDoctor_name()%></span>
											</div>
										</td>
										<td><span class="spec-badge"><%=d.getSpecialization()%></span></td>
										<td><i class="fa-solid fa-phone"
											style="color: var(--muted); font-size: 11px; margin-right: 4px"></i>
											<%=d.getPhone()%></td>
										<td><i class="fa-regular fa-envelope"
											style="color: var(--muted); font-size: 11px; margin-right: 4px"></i>
											<%=d.getEmail()%></td>
										<td><span style="font-weight: 600; color: var(--blue);"><%=d.getDepartment_id()%></span></td>
										<td style="white-space: nowrap;"><a
											href="doctor?action=edit&id=<%=d.getDoctor_id()%>"
											class="btn btn-warning btn-sm"> <i
												class="fa-solid fa-pen"></i> Edit
										</a> <a href="doctor?action=delete&id=<%=d.getDoctor_id()%>"
											class="btn btn-danger btn-sm"
											onclick="return confirm('Delete this doctor?')"
											style="margin-left: 4px;"> <i class="fa-solid fa-trash"></i>
												Delete
										</a></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
							<div class="no-results" id="noResults">
								<i class="fa-solid fa-magnifying-glass"
									style="font-size: 24px; margin-bottom: 8px; display: block; color: var(--muted)"></i>
								No doctors found matching your search.
							</div>
						</div>

					</div>
				</div>

			</main>
		</div>

		<!-- FOOTER -->
		<footer
			style="background: #1a2d4f; color: rgba(255, 255, 255, .6); font-size: 12.5px; padding: 16px 30px; margin-left: var(--sidebar-w); display: flex; justify-content: space-between; align-items: center;">
			<span>&copy; 2025 MediFlow MS. All rights reserved.</span> <a
				href="dashboard"
				style="color: rgba(255, 255, 255, .6); text-decoration: none;">
				<i class="fa-solid fa-arrow-left" style="margin-right: 5px"></i>Back
				to Dashboard
			</a>
		</footer>
	</div>

	<script>
function toggleSidebar() {
	document.getElementById('sidebar').classList.toggle('open');
	document.getElementById('sidebarOverlay').classList.toggle('open');
}

function filterDoctors() {
	const query = document.getElementById('doctorSearch').value.toLowerCase().trim();
	const rows  = document.querySelectorAll('#doctorBody tr');
	let visible = 0;

	rows.forEach(row => {
		// name is in cells[1], inside doc-name-cell span
		const nameCell = row.cells[1];
		const name = nameCell ? nameCell.textContent.toLowerCase() : '';
		if (name.includes(query)) {
			row.classList.remove('hidden-row');
			visible++;
		} else {
			row.classList.add('hidden-row');
		}
	});

	const countEl   = document.getElementById('resultCount');
	const noResults = document.getElementById('noResults');
	const total     = rows.length;

	if (query === '') {
		countEl.textContent = total + ' doctor' + (total !== 1 ? 's' : '') + ' total';
		noResults.style.display = 'none';
	} else {
		countEl.textContent = visible + ' of ' + total + ' doctor' + (total !== 1 ? 's' : '') + ' found';
		noResults.style.display = visible === 0 ? 'block' : 'none';
	}
}

window.addEventListener('DOMContentLoaded', () => {
	filterDoctors();
});
</script>
</body>
</html>
