<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header_main.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | 동아일보</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=contextPath%>/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<%=contextPath%>/resources/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

		<!-- =============================================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					동아일보 <small>뉴스</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">동아일보</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Title</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<link rel="stylesheet" type="text/css"
							href="../../resources/build/css/DataTables/jquery.dataTables.min.css">
						<link rel="stylesheet" type="text/css"
							href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

						<script type="text/javascript" language="javascript"
							src="https://code.jquery.com/jquery-1.12.4.js"></script>
						<!-- <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script> -->
						<script type="text/javascript" language="javascript"
							src="../../resources/build/js/jquery.dataTables.min.js"></script>


						<script type="text/javascript" class="init">
							$(document)
									.ready(
											function() {

												var g = "https://api.rss2json.com/v1/api.json?rss_url=";
												var dongaNews = "https://it.donga.com/feeds/rss/news/";
												var keys = "&api_key=bdl3lrsxdpnhqm6hhhler7hufnnecux4bwztd19b";
												var counts = "&count=200";

												$
														.ajax({
															url : g + dongaNews
																	+ keys
																	+ counts, //요청할 데이터 경로.
															dataType : "json", //요청할 데이터에 타입.
															success : function(
																	data) { //성공적으로 요청했왔을 때...
																//obj = JSONtoString(data);
																// JSON.stringify()는 json 객체를 String 객체로 변환시킨다.
																// JSON.parse()는 string 객체를 json 객체로 변환시킨다.
																var obj = JSON
																		.stringify(data);
																//alert(obj);

																$
																		.each(
																				data.items,
																				function(
																						i,
																						d) {
																					var date = new Date(
																							d["pubDate"]); //뉴스 작성 날짜 객체 생성
																					//작성한 년-월-일 형식으로 변수 m에 저장합니다.
																					var m = date
																							.getFullYear()
																							+ "-"
																							+ (date
																									.getMonth() + 1)
																							+ "-"
																							+ date
																									.getDate()
																							+ " "
																							+ date
																									.getHours()
																							+ ":"
																							+ date
																									.getMinutes()
																							+ ":"
																							+ date
																									.getSeconds();
																					var title = d["title"]; //title 키의 값을 가져옵니다.
																					var lk = d["link"];
																					var categories = d["categories"];
																					var author = d["author"];
																					//앞서 구해온 데이터를 이용해 정보 목록 태그를 생성합니다.
																					$(
																							"tbody")
																							.append(
																									'<tr><td>'
																											+ m
																											+ '</td><td>'
																											+ categories
																											+ '</td><td><a href="'+lk+'" target="_blank">'
																											+ title
																											+ '</a></td><td>'
																											+ author
																											+ '</td></tr>');
																				}); // “$.each” 메서드에 종료
															}, // “success: function”에 종료

															error : function(
																	data) {
																alert("에러 발생하였습니다.");
															},

															complete : function(
																	data) {
																$('#example')
																		.DataTable(
																				{
																					"language" : {
																						"sEmptyTable" : "데이터가 없습니다",
																						"sInfo" : "_START_ - _END_ / _TOTAL_",
																						"sInfoEmpty" : "0 - 0 / 0",
																						"sInfoFiltered" : "(총 _MAX_ 개)",
																						"sInfoPostFix" : "",
																						"sInfoThousands" : ",",
																						"sLengthMenu" : "페이지당 줄수 _MENU_",
																						"sLoadingRecords" : "읽는중...",
																						"sProcessing" : "처리중...",
																						"sSearch" : "검색:",
																						"sZeroRecords" : "검색 결과가 없습니다",
																						"oPaginate" : {
																							"sFirst" : "처음",
																							"sLast" : "마지막",
																							"sNext" : "다음",
																							"sPrevious" : "이전"
																						},
																						"oAria" : {
																							"sSortAscending" : ": 오름차순 정렬",
																							"sSortDescending" : ": 내림차순 정렬"
																						}
																					}
																				});
															}
														}); // $.ajax() 메서드에 종료
											}); // end of $(document).ready(function()
						</script>
						<div class="content">
							<table id="example" class="display" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th width="20%">날짜</th>
										<th width="10%">분류</th>
										<th width="50%">제목</th>
										<th width="20%">작성자</th>
									</tr>
								</thead>
								<tfoot>
									<hr>
								</tfoot>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="https://adminlte.io">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>

				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<!-- <script src="<%=contextPath%>/resources/bower_components/jquery/dist/jquery.min.js"></script> -->
	<!-- Bootstrap 3.3.7 -->
	<script src="<%=contextPath%>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="<%=contextPath%>/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="<%=contextPath%>/resources/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=contextPath%>/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=contextPath%>/resources/dist/js/demo.js"></script>
	<script>
		$(document).ready(function() {
			$('.sidebar-menu').tree()
		})
	</script>
</body>
</html>
