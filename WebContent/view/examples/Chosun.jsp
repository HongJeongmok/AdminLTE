<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header_main.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>RSS 연동하기</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		//변수 g에 크로스 도메인의 데이터를 가져올 수 있도록 구글 주소를 저장하였습니다.
		//var g="https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&num=10&callback=?&q=";
		var g = "https://api.rss2json.com/v1/api.json?rss_url=";

		$("#news_wrap h2 a").on(
				"click",
				function(e) {
					e.preventDefault();
					$("#news_wrap h2 a").removeClass("on");
					$(this).addClass("on");
					$.ajax({
						url : g + $(this).attr("href"),
						dataType : "json",
						success : function(data) {
							var obj = JSON.stringify(data);

							$("#news_list").empty();
							$.each(data.items, function(i, d) {
								if (i == 5)
									return false;
								var title = d["title"];
								var date = new Date(d["pubDate"]);
								var m = date.getFullYear() + "-"
										+ (date.getMonth() + 1) + "-"
										+ date.getDate();
								var lk = d["link"];
								$("#news_list").append(
										'<li><a href="'+lk+'" target="_blank">'
												+ title + '</a> <span>' + m
												+ '</span></li>');
							});
						}
					});
				});

		$("#news_wrap h2 a").eq(0).click();
	});
</script>
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
			<link rel="stylesheet"
				href="<%=contextPath%>/resources/dist/css/AdminLTE.min.css">
				<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
				<link rel="stylesheet"
					href="<%=contextPath%>/resources/dist/css/skins/_all-skins.min.css">

					<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
					<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
					<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

					<!-- Google Font -->
					<link rel="stylesheet"
						href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

						<style type="text/css">
/*기본 세팅*/
* {
	margin: 0;
	padding: 0;
}

#news_wrap li {
	list-style: none;
}

.box-body {
	font: 12px Malgun Gothic, "맑은고딕", gulim, "굴림", sans-serif;
	color: #333;
	padding-top: 20px;
}

#news_wrap h1, #news_wrap h2, #news_wrap  h3, #news_wrap h4, #news_wrap h5,
	#news_wrap h6 {
	font-size: 100%;
	font-weight: normal;
}

#news_wrap a {
	color: #333;
	text-decoration: none;
	outline: none;
}

#news_wrap h1 {
	font-size: 2em;
	text-align: center;
	margin-bottom: 10px;
	color: #c00;
}

/*탭 메뉴 디자인*/
#news_wrap {
	width: 380px;
	margin: 0 auto;
	background: #FFF url("../../../10장/images/rss_bg.gif") 0 20px repeat-x;
}

#news_wrap li {
	height: 25px;
	line-height: 25px;
	position: relative;
}

#news_wrap span {
	position: absolute;
	top: 0;
	right: 3px;
}

#news_wrap li a {
	display: block;
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 5px;
	background: url("images/bullet.gif") 5px 10px no-repeat;
}

#news_wrap h2 {
	float: left;
	padding-right: 3px;
	margin-bottom: 10px;
}

#news_list {
	clear: both;
}

/*비활성화 탭 버튼 모양*/
#news_wrap h2 a {
	display: inline-block;
	padding: 8px 10px;
	border: 1px solid #aaa;
	border-bottom: none;
	border-radius: 5px 5px 0 0;
	background: #ccc;
}
/*비활성화 탭 버튼 모양*/
#news_wrap h2 a.on {
	background-color: #fff;
	font-weight: bold;
}
</style>
</head>

<!-- =============================================== -->

<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar"> <!-- Sidebar user panel -->
<div class="user-panel">
	<div class="pull-left image">
		<img src="<%=contextPath%>/resources/dist/img/user2-160x160.jpg"
			class="img-circle" alt="User Image">
	</div>
	<div class="pull-left info">
		<p>Alexander Pierce</p>
		<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
	</div>
</div>
<!-- search form -->
<form action="#" method="get" class="sidebar-form">
	<div class="input-group">
		<input type="text" name="q" class="form-control"
			placeholder="Search..."> <span class="input-group-btn">
				<button type="submit" name="search" id="search-btn"
					class="btn btn-flat">
					<i class="fa fa-search"></i>
				</button>
		</span>
	</div>
</form>
<!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
<ul class="sidebar-menu" data-widget="tree">
	<li class="header">MAIN NAVIGATION</li>
	<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
			<span>Dashboard</span> <span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../main/index.jsp"><i class="fa fa-circle-o"></i>
					Dashboard v1</a></li>
			<li><a href="../main/index.jsp"><i class="fa fa-circle-o"></i>
					Dashboard v2</a></li>
		</ul></li>
	<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
			<span>Layout Options</span> <span class="pull-right-container">
				<span class="label label-primary pull-right">4</span>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../layout/top-nav.html"><i
					class="fa fa-circle-o"></i> Top Navigation</a></li>
			<li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i>
					Boxed</a></li>
			<li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i>
					Fixed</a></li>
			<li><a href="../layout/collapsed-sidebar.html"><i
					class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
		</ul></li>
	<li><a href="../widgets.html"> <i class="fa fa-th"></i> <span>Widgets</span>
			<span class="pull-right-container"> <small
				class="label pull-right bg-green">Hot</small>
		</span>
	</a></li>
	<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
			<span>Charts</span> <span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../charts/chartjs.html"><i
					class="fa fa-circle-o"></i> ChartJS</a></li>
			<li><a href="../charts/morris.html"><i
					class="fa fa-circle-o"></i> Morris</a></li>
			<li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i>
					Flot</a></li>
			<li><a href="../charts/inline.html"><i
					class="fa fa-circle-o"></i> Inline charts</a></li>
		</ul></li>
	<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
			<span>UI Elements</span> <span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i>
					General</a></li>
			<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i>
					Icons</a></li>
			<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i>
					Buttons</a></li>
			<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i>
					Sliders</a></li>
			<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i>
					Timeline</a></li>
			<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i>
					Modals</a></li>
		</ul></li>
	<li class="treeview"><a href="#"> <i class="fa fa-edit"></i> <span>Forms</span>
			<span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../forms/general.html"><i
					class="fa fa-circle-o"></i> General Elements</a></li>
			<li><a href="../forms/advanced.html"><i
					class="fa fa-circle-o"></i> Advanced Elements</a></li>
			<li><a href="../forms/editors.html"><i
					class="fa fa-circle-o"></i> Editors</a></li>
		</ul></li>
	<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
			<span>Tables</span> <span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../tables/simple.html"><i
					class="fa fa-circle-o"></i> Simple tables</a></li>
			<li><a href="../tables/data.html"><i class="fa fa-circle-o"></i>
					Data tables</a></li>
		</ul></li>
	<li><a href="../calendar.html"> <i class="fa fa-calendar"></i>
			<span>Calendar</span> <span class="pull-right-container"> <small
				class="label pull-right bg-red">3</small> <small
				class="label pull-right bg-blue">17</small>
		</span>
	</a></li>
	<li><a href="../mailbox/mailbox.html"> <i
			class="fa fa-envelope"></i> <span>Mailbox</span> <span
			class="pull-right-container"> <small
				class="label pull-right bg-yellow">12</small> <small
				class="label pull-right bg-green">16</small> <small
				class="label pull-right bg-red">5</small>
		</span>
	</a></li>
	<li class="treeview active"><a href="#"> <i
			class="fa fa-folder"></i> <span>Examples</span> <span
			class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="../examples/gallery.jsp"><i
					class="fa fa-circle-o"></i> Gallery</a></li>
			<li><a href="../examples/Chosun.jsp"><i
					class="fa fa-circle-o"></i> 조선일보</a></li>
			<li><a href="../examples/DongA.jsp"><i
					class="fa fa-circle-o"></i> 동아일보</a></li>
			<li><a href="../guestbook/guestbook.jsp"><i
					class="fa fa-circle-o"></i> 방명록</a></li>
			<li><a href="../../resources/pages/examples/invoice.html"><i
					class="fa fa-circle-o"></i> Invoice</a></li>
			<li><a href="../../resources/pages/examples/profile.html"><i
					class="fa fa-circle-o"></i> Profile</a></li>
			<li><a href="../../resources/pages/examples/login.html"><i
					class="fa fa-circle-o"></i> Login</a></li>
			<li><a href="../../resources/pages/examples/register.html"><i
					class="fa fa-circle-o"></i> Register</a></li>
			<li><a href="../../resources/pages/examples/lockscreen.html"><i
					class="fa fa-circle-o"></i> Lockscreen</a></li>
			<li><a href="../../resources/pages/examples/404.html"><i
					class="fa fa-circle-o"></i> 404 Error</a></li>
			<li><a href="../../resources/pages/examples/500.html"><i
					class="fa fa-circle-o"></i> 500 Error</a></li>
			<li><a href="../../resources/pages/examples/blank.html"><i
					class="fa fa-circle-o"></i> Blank Page</a></li>
			<li><a href="../../resources/pages/examples/pace.html"><i
					class="fa fa-circle-o"></i> Pace Page</a></li>
		</ul></li>
	<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
			<span>Multilevel</span> <span class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
			<li class="treeview"><a href="#"><i class="fa fa-circle-o"></i>
					Level One <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
					<li class="treeview"><a href="#"><i class="fa fa-circle-o"></i>
							Level Two <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a href="#"><i class="fa fa-circle-o"></i> Level
									Three</a></li>
							<li><a href="#"><i class="fa fa-circle-o"></i> Level
									Three</a></li>
						</ul></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
		</ul></li>
	<li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i>
			<span>Documentation</span></a></li>
	<li class="header">LABELS</li>
	<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
	<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
	<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
</ul>
</section> <!-- /.sidebar --> </aside>

<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		조선일보 <small>오늘의 뉴스</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Examples</a></li>
		<li class="active">조선일보</li>
	</ol>
	</section>

	<!-- Main content -->
	<section class="content"> <!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">오늘의 뉴스</h3>

			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse" data-toggle="tooltip" title="Collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove"
					data-toggle="tooltip" title="Remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>
		<div class="box-body">
			<h1>조선일보</h1>
			<div id="news_wrap">
				<h2>
					<!-- 초기에 첫 번째 버튼에만 class="on"이 포함되어 있습니다. -->
					<a href="http://myhome.chosun.com/rss/www_section_rss.xml"
						class="on"> 오늘의 주요뉴스</a>
				</h2>
				<h2>
					<a
						href="http://newsplus.chosun.com/hitdata/xml/newsplus/index/index.xml">인기뉴스</a>
				</h2>
				<h2>
					<a
						href="http://newsplus.chosun.com/hitdata/xml/se/sports/index.xml">스포츠</a>
				</h2>
				<h2>
					<a href="https://it.donga.com/feeds/rss">동아뉴스</a>
				</h2>
				<ul id="news_list">
				</ul>
			</div>
		</div>
		<!-- /.box-body -->
		<div class="box-footer">Footer</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box --> </section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<footer class="main-footer">
<div class="pull-right hidden-xs">
	<b>Version</b> 2.4.0
</div>
<strong>Copyright &copy; 2014-2016 <a
	href="https://adminlte.io">Almsaeed Studio</a>.
</strong> All rights reserved. </footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark"> <!-- Create the tabs -->
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
						<h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

						<p>Execution time 5 seconds</p>
					</div>
			</a></li>
		</ul>
		<!-- /.control-sidebar-menu -->

		<h3 class="control-sidebar-heading">Tasks Progress</h3>
		<ul class="control-sidebar-menu">
			<li><a href="javascript:void(0)">
					<h4 class="control-sidebar-subheading">
						Custom Template Design <span class="label label-danger pull-right">70%</span>
					</h4>

					<div class="progress progress-xxs">
						<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
					</div>
			</a></li>
			<li><a href="javascript:void(0)">
					<h4 class="control-sidebar-subheading">
						Update Resume <span class="label label-success pull-right">95%</span>
					</h4>

					<div class="progress progress-xxs">
						<div class="progress-bar progress-bar-success" style="width: 95%"></div>
					</div>
			</a></li>
			<li><a href="javascript:void(0)">
					<h4 class="control-sidebar-subheading">
						Laravel Integration <span class="label label-warning pull-right">50%</span>
					</h4>

					<div class="progress progress-xxs">
						<div class="progress-bar progress-bar-warning" style="width: 50%"></div>
					</div>
			</a></li>
			<li><a href="javascript:void(0)">
					<h4 class="control-sidebar-subheading">
						Back End Framework <span class="label label-primary pull-right">68%</span>
					</h4>

					<div class="progress progress-xxs">
						<div class="progress-bar progress-bar-primary" style="width: 68%"></div>
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
				<label class="control-sidebar-subheading"> Show me as online
					<input type="checkbox" class="pull-right" checked>
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
<script
	src="<%=contextPath%>/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="<%=contextPath%>/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script
	src="<%=contextPath%>/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script
	src="<%=contextPath%>/resources/bower_components/fastclick/lib/fastclick.js"></script>
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
