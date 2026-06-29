<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>Doctor Workload Dashboard</title>

<!-- Bootstrap (optional but recommended) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.workload-card {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.dept-name {
	font-weight: bold;
	text-transform: uppercase;
}

.progress {
	height: 10px;
	border-radius: 5px;
	background: #e9ecef;
}

.progress-bar {
	background: linear-gradient(90deg, #007bff, #00c6ff);
}

.header-title {
	margin-bottom: 20px;
}
</style>

</head>

<body style="background: #f4f6f9;">

	<div class="container mt-5">

		<div class="workload-card">

			<h3 class="header-title">Doctor Workload Report</h3>

			<c:forEach var="w" items="${workloadList}">

				<div class="mb-4">

					<!-- Top Section -->
					<div class="d-flex justify-content-between mb-1">

						<span class="dept-name"> ${w.departmentName} </span> <span>
							${w.totalPatients} Patients / ${w.totalDoctors} Doctors </span>

					</div>

					<!-- Progress Bar -->
					<div class="progress">

						<div class="progress-bar" style="width:${w.totalPatients * 5}%;">
						</div>

					</div>

				</div>

			</c:forEach>

			<!-- Empty check -->
			<c:if test="${empty workloadList}">
				<div class="alert alert-warning">No workload data found</div>
			</c:if>

		</div>

	</div>

</body>
</html>	