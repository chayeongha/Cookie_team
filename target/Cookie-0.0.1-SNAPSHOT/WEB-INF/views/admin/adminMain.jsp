<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Admin</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin/admin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sb-admin-2.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body id="page-top">
	
	<div class="body_main">
		<div class="b"></div>
		<!-- Page Wrapper -->
		<div id="wrapper">

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">

				<!-- Main Content -->
				<div id="content">


					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1
								style="padding: 20px; font-size: 32px; font-family: CookieRun-Black; color: #f23600; line-height: 70px;">
								총 매출 현황</h1>

						</div>

						<!-- Content Row -->
						<div class="row">

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">${cMonth} 월 매출 </div>
												<div class="h5 mb-0 font-weight-bold text-gray-800 abc"> ${mEarn}</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-success text-uppercase mb-1">${cYear}년 총 매출</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800 abc2">${yEarn}</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
												<div class="row no-gutters align-items-center">
													<div class="col-auto">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
													</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar" style="width: 50%" 
															aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Pending Requests Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-warning shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-warning text-uppercase mb-1">총 주문 수</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${orderCount }</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-comments fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Content Row -->

						<div class="row">

							<!-- Area Chart -->
							<div class="col-xl-8 col-lg-7">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">${cYear}년 매출 그래프</h6>
										<div class="dropdown no-arrow">
											<a class="dropdown-toggle" href="#" role="button"
												id="dropdownMenuLink" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"> <i
												class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
											</a>
											<div
												class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
												aria-labelledby="dropdownMenuLink">
												<div class="dropdown-header">Dropdown Header:</div>
												<a class="dropdown-item" href="#">Action</a> <a
													class="dropdown-item" href="#">Another action</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">Something else here</a>
											</div>
										</div>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-area">
											<canvas id="myAreaChart"></canvas>
										</div>
									</div>
								</div>
							</div>

							<!-- Pie Chart -->
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
										<div class="dropdown no-arrow">
											<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
												<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
												<div class="dropdown-header">Dropdown Header:</div>
												<a class="dropdown-item" href="#">Action</a>
												<a class="dropdown-item" href="#">Another action</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">Something else here</a>
											</div>
										</div>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-pie pt-4 pb-2">
											<canvas id="myPieChart"></canvas>
										</div>
										<div class="mt-4 text-center small">
											<span class="mr-2"> <i
												class="fas fa-circle text-primary"></i> Direct
											</span> <span class="mr-2"> <i
												class="fas fa-circle text-success"></i> Social
											</span> <span class="mr-2"> <i
												class="fas fa-circle text-info"></i> Referral
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script
			src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script
			src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script
			src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
		<script
			src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>

		<!-- 아래내용 -->
		<div class="body2">

			<div class="memberTitle">
				<div class="PNAME">개인회원 <br></div>
				<div class="memberListContainer">
					<div id="listcontentWrap">
						<div id="listcontent">
							<div class="container MemberMenu">
								<div class="container" id="memberList"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="bMemberTitle">
					<div class="BNAME">비즈니스 회원 <br></div>
				<div class="bmemberList">
				</div>
			</div>
			
			<div class="storeBye">
				<div class="storeByeTi">스토어 폐업신청</div>
					
				<div class="storeByeContainer"></div>
			
			</div>

			<!-- 2container -->
		
		<c:forEach items="${monthar }" varStatus="s1" var="m">
				<input type="hidden" id="${s1.index}mname" value="${m}">
		</c:forEach>
					
		<c:forEach items="${mEarnar}" varStatus="s2" var="e">
			<c:if test="${not empty e  }">
				<input type="hidden" id="${s2.index}ename" value="${e}">
			</c:if>
			<c:if test="${empty e  }">
				<input type="hidden" id="${s2.index}ename" value="0" style="background: gold;">
			</c:if>
		</c:forEach>
		
		</div>

	</div>
	
	
	<script type="text/javascript">
		getMemberList(1); 
	
		$.ajax({
			type : "GET",
			url : "../store/storeAdmin",
			error : function() {
				alert("통신실패")
			},
			success : function(data) {
				$(".storeByeContainer").html(data);
				/*  alert("데이터 전송 성공"+data);   */
			}
		});
	
		/***************************일반회원***************************/
	
		function getMemberList(curPage) {
			$.ajax({
				type : "GET",
				url : "../admin/adminMemberList",
				async : false,
				data : {
					curPage : curPage,
					grade : "1"
	
				},
				error : function() {
					alert("통신실패")
				},
				success : function(data) {
					$("#memberList").html(data);
				}
			});
		}
	
		$("#memberList").on("click", ".listnum", function() {
			var curPage = $(this).attr("id");
			getMemberList(curPage);
			//두번째 페이지 이후 -클릭시 슬라이드업 다운
			$(".subjectList a").on("click", function() {
				var g = $(this).attr("title")
				$(".subMenu").slideUp();
				$(".subjectList .mainMenu").removeClass();
	
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
					$(this).parent().addClass();
				}
			}); 
		});
	
		$("#memberList").on("click", ".listimg", function() {
			var curPage = $(this).attr("id");
			getMemberList(curPage);
		})
	
		/**********************************비즈니스(점주))****************************/
		getBMemberList(1); 
		function getBMemberList(curPage) {
			$.ajax({
				type : "GET",
				url : "../admin/adminMemberList?grade=8888",
				async : false,
				data : {
					curPage : curPage,
					grade : "8888"
	
				},
				error : function() {
					alert("통신실패")
				},
				success : function(data) {
					$(".bmemberList").html(data);
				}
			});
		}
	
		$(".bmemberList").on("click", ".listnum", function() {
			var curPage = $(this).attr("id");
			getBMemberList(curPage);
	
			//두번째 페이지 이후-클릭시 슬라이드업 다운
				$(".subjectList a").on("click", function() {
				var g = $(this).attr("title")
				$(".subMenu").slideUp();
				$(".subjectList .mainMenu").removeClass();
	
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
					$(this).parent().addClass();
				}
			}); 
		});
	
		$(".bmemberList").on("click", ".listimg", function() {
			var curPage = $(this).attr("id");
			getBMemberList(curPage);
		})
		
			/*첫번째 페이지에서 둘다 슬라이드 다운 주기*/
	 	$(".subjectList a").on("click", function() {
			var g = $(this).attr("title")
			$(".subMenu"+g).slideUp();
			$(".subjectList .mainMenu").removeClass();
				
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
				$(this).parent().addClass();
			}
		}); 

	
	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: [$('#0mname').val(), $('#1mname').val(),$('#2mname').val(), $('#3mname').val() , $('#4mname').val(), $('#5mname').val(), $('#6mname').val(),$('#7mname').val(),$('#8mname').val(),$('#9mname').val(),$('#10mname').val(),$('#11mname').val()],
	    datasets: [{
	      label: "판매량",
	      lineTension: 0.3,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [$('#0ename').val(), $('#1ename').val(),$('#2ename').val(), $('#3ename').val() , $('#4ename').val(), $('#5ename').val(), $('#6ename').val(),$('#7ename').val(),$('#8ename').val(),$('#9ename').val(),$('#10ename').val(),$('#11ename').val()],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 11
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value)+'원';
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '원';
	        }
	      }
	    }
	  }
	});

	//,찍어주는 정규식 함수
	function addComma(price) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return price.toString().replace(regexp, ',');
	}

	var abc = $('.abc').text();
	var abc2 = $('.abc2').text();

	$('.abc').text(addComma(abc));
	$('.abc2').text(addComma(abc2));
	

	
	</script>
</body>
</html>