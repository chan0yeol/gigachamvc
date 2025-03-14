<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyAttendance</title>

<%@ include file="./layout/header.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/attendance.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/attendance.css">

</head>
<body>
	<%@ include file="./layout/newNav.jsp"%>
	<%@ include file="./layout/newSide.jsp"%>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>근태 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}">Home</a></li>
					<li class="breadcrumb-item">마이페이지</li>
					<li class="breadcrumb-item active">나의 근무현황</li>
				</ol>
			</nav>
		</div>
		"${loginDto}"
		<div class="row">
			<div id="content" class="col-10">
				<div class="work-status">
					<div class="card info-card customers-card">
						<div class="card-body">
							<div class="attendance-container">
<!-- 								<div class="navigation"> -->
<!-- 									<div class="nav-link"> -->
<!-- 										<i class=" brightness-alt-high"></i> 01:43:23 PM 6/15(월) -->
<!-- 									</div> -->
<!-- 								</div> -->

								<div class="time-card">
									<div class="row">
										<div class="col-md-7">
											<div class="work-time">TODAY</div>
											<input type="hidden" id="empno" value="${loginDto.empno}">
											<div class="time-display">00:00:00</div>
											<div class="action-buttons">
												<button class="btn-check-in">출근</button>
												<button class="btn-check-out">퇴근</button>
											</div>
											<div class="notice">버튼을 눌러 출근시간을 기록하세요.</div>
										</div>
										<div class="col-md-5">
											<div class="work-system">
												<div class="work-system-title">
													<i class="bi bi-person-lines-fill"></i>&nbsp;나의 근태 현황
												</div>
												<hr>
												<div class="mb-3">
													<div class="d-flex justify-content-between">
														<span>• 입사 년도:</span> <span class="text-primary fw-bold"
															id="hiredate">"${loginDto.hiredate}"</span> <span
															class="badge rounded-pill bg-secondary" id="hiredateText"></span>
													</div>
												</div>
<!-- 												<div class="mb-3"> -->
<!-- 													<div class="d-flex justify-content-between"> -->
<!-- 														<span>• 발생 연차:</span> <span class="text-primary fw-bold">20개</span> -->
<!-- 														<span>• 사용 연차:</span> <span class="text-primary fw-bold">8.2개</span> -->
<!-- 														<span>• 남은 연차:</span> <span class="text-primary fw-bold">11.5개</span> -->
<!-- 													</div> -->
<!-- 												</div> -->
												<div class="mb-3">
													<div class="d-flex justify-content-between">
														<span>• 출근 시간:</span> <span class="text-primary fw-bold" id="workInTime">00:00:00</span>
														
													</div>
												</div>

												<div class="mb-3">
													<div class="d-flex justify-content-between">
														<span>• 퇴근 시간:</span> <span class="text-primary fw-bold" id="workOutTime">00:00:00</span>
													</div>
												</div>
												<div class="mb-3">
													<div class="d-flex justify-content-between">
														<span>• 월 누적 근무시간:</span> <span class="text-primary fw-bold" id="workTotalTime">00:00:00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>


				<div class="work-status">
					<div class="card info-card customers-card">
						<div class="card-body">
							<!-- Default Tabs -->
							<div class="tab_menu">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="home-tab"
											data-bs-toggle="tab" data-bs-target="#home" type="button"
											role="tab" aria-controls="home" aria-selected="true">근태</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
											data-bs-target="#profile" type="button" role="tab"
											aria-controls="profile" aria-selected="false" tabindex="-1">연차</button>
									</li>
								</ul>
							</div>
							<div class="tab-content pt-2" id="myTabContent">
								<div class="tab-pane fade active show" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<!-- ------------------근무----------------------------- -->
									<div class="card-body">
										<h5 class="card-title">근무 내역</h5>
										<div
											class="d-flex align-items-center mb-3 justify-content-between">
											<div class="d-flex align-items-center" id="attperiod">
												<span id="selectperiod"><i
													class="bi bi-calendar-check"></i>&nbsp;&nbsp;기간&nbsp;&nbsp;</span>
												<select class="form-select w-auto me-2" name="yearSelect"
													id="yearSelect">
													<!-- 										<option>2024</option> -->
													<!-- 										<option>2025</option> -->
												</select> <select class="form-select w-auto" id="monthSelect">
													<!-- 										<option>1월</option> -->
													<!-- 										<option selected>2월</option> -->
													<!-- 										<option>3월</option> -->
												</select>
												<button class="btn btn-outline-danger btn-sm rounded-pill" id="showtoday">TODAY</button>
											</div>
											<!-- 근태 기록 다운로드 버튼 -->
											<button class="btn btn-outline-primary">
												<i class="bi bi-box-arrow-down"></i> 근태기록 다운로드
											</button>
										</div>

										<div class="scrollable-table-container"
											style="overflow: scroll">
											<!-- 근태 기록 테이블 -->
											<table class="table table-hover" id="attendanceTable">
												<thead class="table-light">
													<tr>
														<th>일자</th>
														<th>출근</th>
														<th>퇴근</th>
														<th>연장</th>
														<th>야간</th>
														<th>합계</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- ------------------연차----------------------------- -->
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<div class="card-body">
										<h5 class="card-title">연차 내역</h5>
										<div class="datatable-top">
											<div
												class="d-flex align-items-center mb-3 justify-content-between">
												<div class="d-flex align-items-center" id="attperiod">
													<span id="selectperiod"><i
														class="bi bi-calendar-check"></i>&nbsp;&nbsp;기간&nbsp;&nbsp;</span>
													<select class="form-select w-auto me-2" name="yearSelect"
														id="yearSelect">
													</select>
												</div>
												<div class="datatable-dropdown">
													<label> <select class="datatable-selector"
														name="per-page"><option value="5">5</option>
															<option value="10" selected="">10</option>
															<option value="15">15</option>
															<option value="-1">All</option></select> entries per page
													</label>
												</div>
												<button class="btn btn-outline-primary">
													<i class="bi bi-box-arrow-down"></i> 연차기록 다운로드
												</button>
											</div>
										</div>
										<div class="datatable-container">
											<table class="table table-hover">
												<thead class="table-light">
													<tr>
														<th>휴가 종류</th>
														<th>사용 기간</th>
														<th>사용 연차</th>
														<th>승인 연부</th>
														<th>비고
															<button type="button" data-id="0"
																class="btn btn-sm btn-primary pull-right notify">Click
																Me</button>
														</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
										<!-- End Table with hoverable rows -->
									</div>
								</div>
								<!-- End Default Tabs -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
<script>
    var pageContext = '${pageContext.request.contextPath}';
</script>
</body>
</html>
