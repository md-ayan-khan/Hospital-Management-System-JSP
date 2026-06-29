<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About - MediFlow MS</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }

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

body { background: var(--bg); min-height: 100vh; display: flex; flex-direction: column; }

/* ── TOP NAVBAR (same as index) ── */
.topnav {
  position: fixed; top: 0; left: 0; right: 0; z-index: 100;
  height: var(--topnav-h); background: var(--blue);
  display: flex; align-items: center; justify-content: space-between;
  padding: 0 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}
.topnav-left { display: flex; align-items: center; gap: 10px; }
.topnav-logo { color: #fff; font-size: 20px; font-weight: 700; letter-spacing: 0.5px; }
.topnav-logo span { font-weight: 300; opacity: 0.85; }
.topnav-links { display: flex; gap: 5px; margin-left: 30px; }
.topnav-links a {
  color: rgba(255,255,255,0.82); text-decoration: none;
  padding: 6px 14px; border-radius: 6px; font-size: 13.5px; font-weight: 500;
  transition: background 0.18s, color 0.18s;
}
.topnav-links a:hover, .topnav-links a.active { background: rgba(255,255,255,0.18); color: #fff; }
.topnav-right { display: flex; align-items: center; gap: 14px; }
.topnav-search {
  display: flex; align-items: center;
  background: rgba(255,255,255,0.15); border-radius: 8px; padding: 5px 12px; gap: 8px;
}
.topnav-search input { background: transparent; border: none; outline: none; color: #fff; font-size: 13px; width: 180px; }
.topnav-search input::placeholder { color: rgba(255,255,255,0.65); }
.topnav-search i { color: rgba(255,255,255,0.7); font-size: 13px; }
.topnav-icons { display: flex; gap: 12px; align-items: center; }
.topnav-icons i { color: rgba(255,255,255,0.85); font-size: 16px; cursor: pointer; }
.topnav-user { display: flex; align-items: center; gap: 9px; }
.topnav-user-info { text-align: right; }
.topnav-user-info strong { color: #fff; font-size: 13.5px; display: block; }
.topnav-user-info small { color: rgba(255,255,255,0.7); font-size: 11.5px; }
.avatar {
  width: 36px; height: 36px; border-radius: 50%;
  background: rgba(255,255,255,0.25); color: #fff; font-weight: 700; font-size: 13px;
  display: flex; align-items: center; justify-content: center;
  border: 2px solid rgba(255,255,255,0.4);
}
.hamburger { display: none; background: none; border: none; cursor: pointer; padding: 5px; }
.hamburger i { color: #fff; font-size: 20px; }
.sidebar-overlay { display: none; }

/* ── SUBNAV ── */
.subnav {
  position: fixed; top: var(--topnav-h); left: 0; right: 0; z-index: 90;
  height: var(--subnav-h); background: var(--white); border-bottom: 1px solid var(--border);
  display: flex; align-items: center;
  padding: 0 20px 0 calc(var(--sidebar-w) + 20px); gap: 8px;
}
.subnav-title { font-size: 15px; font-weight: 600; color: var(--text); margin-right: 10px; }
.breadcrumb { font-size: 12.5px; color: var(--muted); display: flex; align-items: center; gap: 5px; }
.breadcrumb i { font-size: 10px; }
.breadcrumb a { color: var(--blue); text-decoration: none; }

/* ── SIDEBAR ── */
.sidebar {
  width: var(--sidebar-w); background: var(--white); border-right: 1px solid var(--border);
  position: fixed; top: calc(var(--topnav-h) + var(--subnav-h)); bottom: 0; left: 0;
  display: flex; flex-direction: column; overflow-y: auto; z-index: 80;
}
.menu { padding-top: 10px; flex: 1; }
.menu a {
  display: flex; align-items: center; gap: 11px;
  padding: 13px 22px; text-decoration: none; color: #555;
  font-weight: 500; font-size: 14px; border-left: 3px solid transparent; transition: all 0.18s;
}
.menu a i { width: 18px; text-align: center; font-size: 15px; }
.menu a:hover, .menu a.active { background: var(--blue-light); color: var(--blue); border-left-color: var(--blue); }
.menu a.active { font-weight: 600; }
.bottom-menu { border-top: 1px solid var(--border); padding: 10px 0; }
.bottom-menu a {
  display: flex; align-items: center; gap: 11px;
  padding: 12px 22px; text-decoration: none; color: #555; font-size: 14px; transition: all 0.18s;
}
.bottom-menu a:hover { color: var(--blue); background: var(--blue-light); }

/* ── LAYOUT WRAPPER ── */
.layout-wrapper { display: flex; flex-direction: column; flex: 1; padding-top: calc(var(--topnav-h) + var(--subnav-h)); }
.layout { display: flex; flex: 1; }

/* ── MAIN ── */
.main { margin-left: var(--sidebar-w); flex: 1; padding: 30px 30px 30px 30px; min-width: 0; }

/* ── HERO BANNER ── */
.about-hero {
  background: linear-gradient(135deg, #2b65c9 0%, #1a3f8f 100%);
  border-radius: 16px; padding: 48px 40px; margin-bottom: 28px;
  display: flex; align-items: center; gap: 28px;
  animation: cardIn 0.5s ease both;
}
@keyframes cardIn { from{opacity:0;transform:translateY(18px)} to{opacity:1;transform:translateY(0)} }
.hero-icon {
  width: 72px; height: 72px; border-radius: 18px;
  background: rgba(255,255,255,0.15); display: flex; align-items: center;
  justify-content: center; font-size: 32px; color: #fff; flex-shrink: 0;
}
.hero-text h1 { color: #fff; font-size: 28px; font-weight: 700; margin-bottom: 10px; }
.hero-text p { color: rgba(255,255,255,0.82); font-size: 15px; line-height: 1.7; max-width: 600px; }

/* ── SECTION TITLE ── */
.section-title { font-size: 17px; font-weight: 700; color: var(--text); margin-bottom: 16px; display: flex; align-items: center; gap: 9px; }
.section-title i { color: var(--blue); }

/* ── FEATURE CARDS GRID ── */
.features-grid { display: grid; grid-template-columns: repeat(3,1fr); gap: 16px; margin-bottom: 28px; }
.feature-card {
  background: var(--white); border-radius: 12px; padding: 22px 20px;
  box-shadow: 0 1px 6px rgba(0,0,0,0.07);
  border-top: 3px solid var(--blue);
  transition: transform 0.2s, box-shadow 0.2s;
  animation: cardIn 0.5s ease both;
}
.feature-card:hover { transform: translateY(-4px); box-shadow: 0 6px 20px rgba(43,101,201,0.13); }
.feature-card:nth-child(1) { animation-delay:.05s; border-top-color:#2b65c9; }
.feature-card:nth-child(2) { animation-delay:.10s; border-top-color:#17884a; }
.feature-card:nth-child(3) { animation-delay:.15s; border-top-color:#d47c00; }
.feature-card:nth-child(4) { animation-delay:.20s; border-top-color:#b0246a; }
.feature-card:nth-child(5) { animation-delay:.25s; border-top-color:#0e7490; }
.feature-card:nth-child(6) { animation-delay:.30s; border-top-color:#7c3aed; }
.fc-icon {
  width: 44px; height: 44px; border-radius: 12px;
  display: flex; align-items: center; justify-content: center;
  font-size: 20px; margin-bottom: 14px;
}
.fc-1 .fc-icon { background:#e9f1ff; color:#2b65c9; }
.fc-2 .fc-icon { background:#dff7e7; color:#17884a; }
.fc-3 .fc-icon { background:#fff3dc; color:#d47c00; }
.fc-4 .fc-icon { background:#fde8f3; color:#b0246a; }
.fc-5 .fc-icon { background:#e0f7fc; color:#0e7490; }
.fc-6 .fc-icon { background:#f3eeff; color:#7c3aed; }
.feature-card h3 { font-size: 15px; font-weight: 600; color: var(--text); margin-bottom: 8px; }
.feature-card p { font-size: 13px; color: var(--muted); line-height: 1.6; }

/* ── INFO PANELS ROW ── */
.info-row { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 28px; }
.info-panel {
  background: var(--white); border-radius: 12px;
  box-shadow: 0 1px 6px rgba(0,0,0,0.07); overflow: hidden;
}
.info-panel .panel-header { padding: 16px 20px 12px; border-bottom: 1px solid var(--border); }
.info-panel .panel-header h3 { font-size: 15px; font-weight: 600; color: var(--text); }
.info-panel .panel-header p { font-size: 12px; color: var(--muted); margin-top: 2px; }
.info-panel .panel-body { padding: 16px 20px; }

/* tech stack */
.tech-list { display: flex; flex-wrap: wrap; gap: 10px; }
.tech-badge {
  padding: 6px 14px; border-radius: 20px; font-size: 13px; font-weight: 600;
  display: inline-flex; align-items: center; gap: 6px;
}
.tb-java   { background:#fff3dc; color:#b06000; }
.tb-jsp    { background:#e9f1ff; color:#2b65c9; }
.tb-mysql  { background:#dff7e7; color:#17884a; }
.tb-css    { background:#fde8f3; color:#b0246a; }
.tb-html   { background:#fdecea; color:#c0392b; }
.tb-js     { background:#fffbdc; color:#9a7800; }
.tb-tomcat { background:#f3eeff; color:#7c3aed; }
.tb-fa     { background:#e0f7fc; color:#0e7490; }

/* team list */
.team-list { list-style: none; }
.team-list li {
  display: flex; align-items: center; gap: 13px;
  padding: 11px 0; border-bottom: 1px solid #f0f3f9;
}
.team-list li:last-child { border-bottom: none; }
.team-avatar {
  width: 40px; height: 40px; border-radius: 50%;
  background: var(--blue-light); color: var(--blue);
  display: flex; align-items: center; justify-content: center;
  font-weight: 700; font-size: 14px; flex-shrink: 0;
}
.team-name { font-size: 14px; font-weight: 600; color: var(--text); }
.team-role { font-size: 12px; color: var(--muted); }

/* ── STATS STRIP ── */
.stats-strip {
  background: var(--white); border-radius: 12px;
  box-shadow: 0 1px 6px rgba(0,0,0,0.07);
  display: grid; grid-template-columns: repeat(4,1fr);
  divide: 1px solid var(--border); margin-bottom: 28px; overflow: hidden;
}
.stat-item {
  padding: 22px 20px; text-align: center;
  border-right: 1px solid var(--border);
}
.stat-item:last-child { border-right: none; }
.stat-item .sn { font-size: 30px; font-weight: 700; color: var(--blue); }
.stat-item .sl { font-size: 13px; color: var(--muted); margin-top: 4px; }

/* ── FOOTER ── */
footer {
  background: #1a2d4f; color: rgba(255,255,255,0.75); font-size: 13px;
  padding: 28px 30px 20px; margin-left: var(--sidebar-w);
}
.footer-inner {
  display: grid; grid-template-columns: 2fr 1fr 1fr; gap: 30px; max-width: 1200px;
  padding-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.1); margin-bottom: 16px;
}
.footer-brand .brand-name { color: #fff; font-size: 17px; font-weight: 700; margin-bottom: 8px; }
.footer-brand p { line-height: 1.6; max-width: 280px; }
.footer-col h5 {
  color: #fff; font-size: 13px; font-weight: 600;
  text-transform: uppercase; letter-spacing: 0.6px; margin-bottom: 12px;
}
.footer-col ul { list-style: none; }
.footer-col ul li { margin-bottom: 8px; }
.footer-col ul li a { color: rgba(255,255,255,0.65); text-decoration: none; transition: color 0.18s; }
.footer-col ul li a:hover { color: #fff; }
.footer-bottom {
  display: flex; justify-content: space-between; align-items: center;
  color: rgba(255,255,255,0.45); font-size: 12px;
}
.footer-bottom .footer-links { display: flex; gap: 18px; }
.footer-bottom .footer-links a { color: rgba(255,255,255,0.45); text-decoration: none; }
.footer-bottom .footer-links a:hover { color: rgba(255,255,255,0.8); }

/* ── RESPONSIVE ── */
@media (max-width: 1100px) { .features-grid { grid-template-columns: repeat(2,1fr); } }
@media (max-width: 900px) { .info-row { grid-template-columns: 1fr; } .stats-strip { grid-template-columns: repeat(2,1fr); } }
@media (max-width: 768px) {
  :root { --sidebar-w: 0px; }
  .sidebar { left: -240px; width: 240px; transition: left 0.25s ease; z-index: 200; }
  .sidebar.open { left: 0; }
  .sidebar-overlay {
    display: block; position: fixed; inset: 0;
    background: rgba(0,0,0,0.35); z-index: 199; opacity: 0; pointer-events: none; transition: opacity 0.25s;
  }
  .sidebar-overlay.open { opacity: 1; pointer-events: all; }
  .subnav { padding-left: 20px; }
  .main { margin-left: 0; padding: 14px; }
  .hamburger { display: block; }
  .topnav-links { display: none; }
  .topnav-search input { width: 110px; }
  .topnav-user-info { display: none; }
  .features-grid { grid-template-columns: 1fr; }
  .about-hero { flex-direction: column; padding: 28px 20px; }
  footer { margin-left: 0; }
  .footer-inner { grid-template-columns: 1fr; gap: 20px; }
  .footer-bottom { flex-direction: column; gap: 10px; text-align: center; }
}
@media (max-width: 480px) {
  .topnav-search { display: none; }
  .stats-strip { grid-template-columns: repeat(2,1fr); }
}
</style>
</head>
<body>

<%
  String userName     = (String) session.getAttribute("userName");
  String userRole     = (String) session.getAttribute("userRole");
  String userInitials = (String) session.getAttribute("userInitials");
  if (userName == null)     userName     = "Dr. Smith";
  if (userRole == null)     userRole     = "Senior Surgeon";
  if (userInitials == null) userInitials = "DS";
%>

<!-- TOP NAVBAR -->
<nav class="topnav">
  <div class="topnav-left">
    <button class="hamburger" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
    <div class="topnav-logo">MediFlow <span>MS</span></div>
    <div class="topnav-links">
   <a href="dashboard"><i class="fa-solid fa-house"></i> Home</a>
      <a href="about.jsp" class="active"><i class="fa-solid fa-circle-info"></i> About</a>
    </div>
  </div>
  <div class="topnav-right">
    <div class="topnav-search">
      <i class="fa-solid fa-magnifying-glass"></i>
      <input type="text" placeholder="Search patients, records...">
    </div>
    <div class="topnav-icons">
      <i class="fa-regular fa-bell" title="Notifications"></i>
      <i class="fa-regular fa-circle-question" title="Help"></i>
    </div>
    <div class="topnav-user">
      <div class="topnav-user-info">
        <strong><%=userName%></strong>
        <small><%=userRole%></small>
      </div>
      <div class="avatar"><%=userInitials%></div>
    </div>
  </div>
</nav>

<div class="sidebar-overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>

<!-- SUB NAV -->
<div class="subnav">
  <span class="subnav-title">About</span>
  <span class="breadcrumb">
    <i class="fa-solid fa-chevron-right"></i>
    <a href="dashboard">Dashboard</a>
    <i class="fa-solid fa-chevron-right"></i>
    About MediFlow MS
  </span>
</div>

<div class="layout-wrapper">
  <div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar" id="sidebar">
      <div class="menu">
        <a href="dashboard"><i class="fa-solid fa-table-columns"></i> Dashboard</a>
        <a href="patient.jsp"><i class="fa-solid fa-user-injured"></i> Patients</a>
        <a href="doctor.jsp"><i class="fa-solid fa-user-doctor"></i> Doctors</a>
        <a href="appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Appointments</a>
        <a href="bill.jsp"><i class="fa-solid fa-money-bill"></i> Billing</a>
        <a href="department.jsp"><i class="fa-solid fa-building"></i> Departments</a>
      </div>
      <div class="bottom-menu">
        <a href="settings.jsp"><i class="fa-solid fa-gear"></i> Settings</a>
        <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      </div>
    </aside>

    <!-- MAIN -->
    <main class="main">

      <!-- HERO -->
      <div class="about-hero">
        <div class="hero-icon"><i class="fa-solid fa-heart-pulse"></i></div>
        <div class="hero-text">
          <h1>MediFlow Management System</h1>
          <p>A full-featured hospital management platform designed to simplify patient care, automate billing, manage doctor scheduling, and give your team real-time visibility into every department — all from one unified interface.</p>
        </div>
      </div>

      <!-- STATS STRIP -->
      <div class="stats-strip" style="margin-bottom:28px">
        <div class="stat-item"><div class="sn">6+</div><div class="sl">Core Modules</div></div>
        <div class="stat-item"><div class="sn">100%</div><div class="sl">Web Based</div></div>
        <div class="stat-item"><div class="sn">24/7</div><div class="sl">System Access</div></div>
        <div class="stat-item"><div class="sn">v1.0</div><div class="sl">Current Version</div></div>
      </div>

      <!-- FEATURES -->
      <div class="section-title"><i class="fa-solid fa-star"></i> Key Features</div>
      <div class="features-grid">

        <div class="feature-card fc-1">
          <div class="fc-icon"><i class="fa-solid fa-user-injured"></i></div>
          <h3>Patient Management</h3>
          <p>Register, search, and manage complete patient profiles including medical history, contact details, and visit records — all in one place.</p>
        </div>

        <div class="feature-card fc-2">
          <div class="fc-icon"><i class="fa-solid fa-calendar-check"></i></div>
          <h3>Appointment Scheduling</h3>
          <p>Book, reschedule, and track appointments with ease. Real-time availability view ensures no double-booking and minimal waiting time.</p>
        </div>

        <div class="feature-card fc-3">
          <div class="fc-icon"><i class="fa-solid fa-file-invoice-dollar"></i></div>
          <h3>Billing & Invoicing</h3>
          <p>Auto-generate bills linked to appointments, track pending payments, and maintain full financial records per patient and department.</p>
        </div>

        <div class="feature-card fc-4">
          <div class="fc-icon"><i class="fa-solid fa-user-doctor"></i></div>
          <h3>Doctor Directory</h3>
          <p>Manage all doctor profiles, their specializations, department assignments, and availability schedules from a centralized panel.</p>
        </div>

        <div class="feature-card fc-5">
          <div class="fc-icon"><i class="fa-solid fa-building"></i></div>
          <h3>Department Overview</h3>
          <p>Monitor workload distribution across all departments. View patient-to-doctor ratios and identify high-demand areas at a glance.</p>
        </div>

        <div class="feature-card fc-6">
          <div class="fc-icon"><i class="fa-solid fa-chart-line"></i></div>
          <h3>Live Dashboard</h3>
          <p>A powerful central dashboard showing real-time stats — total patients, today's appointments, billing status, and recent hospital activity.</p>
        </div>

      </div>

      <!-- INFO ROW -->
      <div class="info-row">

        <!-- TECH STACK -->
        <div class="info-panel">
          <div class="panel-header">
            <h3><i class="fa-solid fa-code" style="color:var(--blue);margin-right:7px"></i>Technology Stack</h3>
            <p>Built with reliable, industry-standard technologies</p>
          </div>
          <div class="panel-body">
            <div class="tech-list">
              <span class="tech-badge tb-java"><i class="fa-brands fa-java"></i> Java (Servlets)</span>
              <span class="tech-badge tb-jsp"><i class="fa-solid fa-file-code"></i> JSP</span>
              <span class="tech-badge tb-mysql"><i class="fa-solid fa-database"></i> MySQL</span>
              <span class="tech-badge tb-html"><i class="fa-brands fa-html5"></i> HTML5</span>
              <span class="tech-badge tb-css"><i class="fa-brands fa-css3-alt"></i> CSS3</span>
              <span class="tech-badge tb-js"><i class="fa-brands fa-js"></i> JavaScript</span>
              <span class="tech-badge tb-tomcat"><i class="fa-solid fa-server"></i> Apache Tomcat</span>
              <span class="tech-badge tb-fa"><i class="fa-solid fa-icons"></i> Font Awesome</span>
            </div>
            <p style="margin-top:18px;font-size:13px;color:var(--muted);line-height:1.6">
              MediFlow MS follows a classic MVC architecture using Java Servlets as controllers,
              JSP pages as views, and MySQL as the persistent data store.
              No external frameworks — clean, lightweight, and easy to extend.
            </p>
          </div>
        </div>

        <!-- PROJECT INFO -->
        <div class="info-panel">
          <div class="panel-header">
            <h3><i class="fa-solid fa-circle-info" style="color:var(--blue);margin-right:7px"></i>Project Details</h3>
            <p>Background and purpose</p>
          </div>
          <div class="panel-body">
            <ul class="team-list">
              <li>
                <div class="team-avatar"><i class="fa-solid fa-bullseye" style="font-size:16px"></i></div>
                <div>
                  <div class="team-name">Purpose</div>
                  <div class="team-role">Academic / Real-world hospital management project</div>
                </div>
              </li>
              <li>
                <div class="team-avatar"><i class="fa-solid fa-layer-group" style="font-size:16px"></i></div>
                <div>
                  <div class="team-name">Architecture</div>
                  <div class="team-role">MVC — Servlets + JSP + JDBC + MySQL</div>
                </div>
              </li>
              <li>
                <div class="team-avatar"><i class="fa-solid fa-code-branch" style="font-size:16px"></i></div>
                <div>
                  <div class="team-name">Version</div>
                  <div class="team-role">v1.0 — Initial release</div>
                </div>
              </li>
              <li>
                <div class="team-avatar"><i class="fa-solid fa-shield-halved" style="font-size:16px"></i></div>
                <div>
                  <div class="team-name">Security</div>
                  <div class="team-role">Session-based authentication, role access control</div>
                </div>
              </li>
              <li>
                <div class="team-avatar"><i class="fa-solid fa-mobile-screen" style="font-size:16px"></i></div>
                <div>
                  <div class="team-name">Responsive</div>
                  <div class="team-role">Works on desktop, tablet, and mobile browsers</div>
                </div>
              </li>
            </ul>
          </div>
        </div>

      </div>

      <!-- HOW IT WORKS -->
      <div class="section-title"><i class="fa-solid fa-diagram-project"></i> How It Works</div>
      <div style="background:var(--white);border-radius:12px;box-shadow:0 1px 6px rgba(0,0,0,0.07);padding:24px 28px;margin-bottom:28px;">
        <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:10px;text-align:center">
          <div style="padding:16px 10px">
            <div style="width:52px;height:52px;border-radius:50%;background:var(--blue-light);color:var(--blue);display:flex;align-items:center;justify-content:center;font-size:20px;margin:0 auto 12px">
              <i class="fa-solid fa-right-to-bracket"></i>
            </div>
            <div style="font-size:13px;font-weight:600;color:var(--text);margin-bottom:4px">1. Login</div>
            <div style="font-size:12px;color:var(--muted)">Staff log in with their credentials securely</div>
          </div>
          <div style="padding:16px 10px">
            <div style="width:52px;height:52px;border-radius:50%;background:#dff7e7;color:#17884a;display:flex;align-items:center;justify-content:center;font-size:20px;margin:0 auto 12px">
              <i class="fa-solid fa-user-plus"></i>
            </div>
            <div style="font-size:13px;font-weight:600;color:var(--text);margin-bottom:4px">2. Register Patients</div>
            <div style="font-size:12px;color:var(--muted)">Add patient profiles with full details</div>
          </div>
          <div style="padding:16px 10px">
            <div style="width:52px;height:52px;border-radius:50%;background:#fff3dc;color:#d47c00;display:flex;align-items:center;justify-content:center;font-size:20px;margin:0 auto 12px">
              <i class="fa-solid fa-calendar-plus"></i>
            </div>
            <div style="font-size:13px;font-weight:600;color:var(--text);margin-bottom:4px">3. Book Appointments</div>
            <div style="font-size:12px;color:var(--muted)">Schedule visits with available doctors</div>
          </div>
          <div style="padding:16px 10px">
            <div style="width:52px;height:52px;border-radius:50%;background:#fde8f3;color:#b0246a;display:flex;align-items:center;justify-content:center;font-size:20px;margin:0 auto 12px">
              <i class="fa-solid fa-file-invoice-dollar"></i>
            </div>
            <div style="font-size:13px;font-weight:600;color:var(--text);margin-bottom:4px">4. Billing</div>
            <div style="font-size:12px;color:var(--muted)">Generate and manage bills automatically</div>
          </div>
        </div>
      </div>

      <!-- BACK BUTTON -->
      <div style="text-align:center;margin-bottom:10px">
        <a href="dashboard" style="display:inline-flex;align-items:center;gap:8px;padding:11px 28px;background:var(--blue);color:#fff;border-radius:8px;text-decoration:none;font-size:14px;font-weight:600;transition:background 0.18s"
           onmouseover="this.style.background='#1a4faa'" onmouseout="this.style.background='#2b65c9'">
          <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
        </a>
      </div>

    </main>
  </div>

  <!-- FOOTER -->
  <footer>
    <div class="footer-inner">
      <div class="footer-brand">
        <div class="brand-name"><i class="fa-solid fa-heart-pulse" style="color:#5b8ee6;margin-right:8px"></i>MediFlow MS</div>
        <p>A comprehensive hospital management system built to streamline patient care, billing, and staff coordination. Trusted by healthcare teams to deliver efficient and reliable operations.</p>
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
          <li><a href="#">Help & Docs</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <span>&copy; 2025 MediFlow MS. All rights reserved.</span>
      <div class="footer-links">
        <a href="#">Privacy Policy</a>
        <a href="#">Terms of Use</a>
        <a href="about.jsp">About</a>
      </div>
    </div>
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
