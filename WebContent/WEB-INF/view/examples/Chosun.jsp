<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header_main.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>AdminLTE 2 | 조선일보</title>
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
</html>
<%@ include file="../include/footer_main.jspf"%>