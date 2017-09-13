<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		 <base href="<%=basePath%>" />	
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>后台管理</title>

		<meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="graduateDesign/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="graduateDesign/assets/css/font-awesome.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="graduateDesign/assets/css/jquery-ui.css" />
		<link rel="stylesheet" href="graduateDesign/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="graduateDesign/assets/css/ui.jqgrid.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="graduateDesign/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="graduateDesign/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="graduateDesign/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="graduateDesign/assets/css/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="graduateDesign/assets/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="graduateDesign/assets/js/html5shiv.js"></script>
		<script src="graduateDesign/assets/js/respond.js"></script>
		<![endif]-->
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default          ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="javascript:void(0)" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							后台管理系统
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">					

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="graduateDesign/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎,</small>
									管理员
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:void(0)">
										<i class="ace-icon fa fa-cog"></i>
										配置
									</a>
								</li>

								<li>
									<a href="javascript:void(0)">
										<i class="ace-icon fa fa-user"></i>
										个人简介
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="javascript:void(0)">
										<i class="ace-icon fa fa-power-off"></i>
										注销
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<!--<li class="">
						<a href="index.html">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>-->

					

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 管理模块 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="graduateDesign/manage/userManage.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									用户管理
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="graduateDesign/manage/orderManage.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									交易信息管理
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="graduateDesign/manage/shopManage.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									美发平台管理
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="active open">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 统计模块 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="graduateDesign/manage/messageCount.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									订单数统计
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="graduateDesign/manage/serviceCount.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									服务统计
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="active">
								<a href="graduateDesign/manage/evalCount.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									评论数统计
								</a>

								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>

				

				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="javascript:void(0)">主页</a>
							</li>

							<li>
								<a href="javascript:void(0)">统计模块</a>
							</li>
							<li class="active">评论数统计</li>
						</ul><!-- /.breadcrumb -->

						<!-- #section:basics/content.searchbox -->
						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<!-- #section:settings.skins -->
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; 选择皮肤</span>
									</div>

									<!-- /section:settings.skins -->

									<!-- #section:settings.navbar -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<!-- /section:settings.navbar -->

									<!-- #section:settings.sidebar -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<!-- /section:settings.sidebar -->

									<!-- #section:settings.breadcrumbs -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<!-- /section:settings.breadcrumbs -->

									<!-- #section:settings.rtl -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<!-- /section:settings.rtl -->

									<!-- #section:settings.container -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>

									<!-- /section:settings.container -->
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<!-- #section:basics/sidebar.options -->
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>

									<!-- /section:basics/sidebar.options -->
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->

						<!-- /section:settings.box -->
						<div class="page-header">
							<h1>
							
							</h1>
						</div><!-- /.page-header -->

						
                <div id="columnContainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                <div id="pieContainer" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">后台</span>
							管理 &copy; 2016-2017
						</span>

						&nbsp; &nbsp;
						<!--<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>-->
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="graduateDesign/assets/js/jquery.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="graduateDesign/assets/js/jquery1x.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='graduateDesign/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="graduateDesign/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="graduateDesign/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="graduateDesign/js/jquery.jqGrid.js"></script>
		<script src="graduateDesign/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>

		<!-- ace scripts -->
		<script src="graduateDesign/assets/js/ace/elements.scroller.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.colorpicker.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.fileinput.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.typeahead.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.spinner.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.treeview.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.wizard.js"></script>
		<script src="graduateDesign/assets/js/ace/elements.aside.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.ajax-content.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.touch-drag.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.sidebar.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.widget-box.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.settings.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.settings-skin.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.searchbox-autocomplete.js"></script>
        
        <script src="graduateDesign/js/exporting.js"></script>
        <script src="graduateDesign/js/highcharts.js"></script>
			<script type="text/javascript">
			//请求商店订单数据
			var ajaxObj =  $.ajax({
				url: "evalController/getAllEvalCount.action",
				type: "post",
				dataType:'json',
				data: "",
				success: function(res){
					var nameArr = [],orderNumArr = [],pieData = [];
					if(res){
						for(var i=0;i<res.length;i++){
						   nameArr.push(res[i].shopName);
						   orderNumArr.push(res[i].countEval);
						   var obj = {};
						   obj.name = res[i].shopName;
						   obj.y = res[i].countEval;
						   pieData.push(obj);
						}
						Highcharts.chart('columnContainer', {
						    chart: {
						        type: 'column'
						    },
						    title: {
						        text: '商店评论数统计'
						    },
						    subtitle: {
						        text: ''
						    },
						    xAxis: {
						        categories: nameArr,
						        crosshair: true
						    },
						    yAxis: {
						        min: 0,
						        title: {
						            text: '评论数'
						        },
						         plotLines: [{
						            value: 3,
						            width: 1,
						            color: '#808080'
						        }]
						    
						    },
						    tooltip: {
						        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
						        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
						            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
						        footerFormat: '</table>',
						        shared: true,
						        useHTML: true
						    },
						    plotOptions: {
						        column: {
						            pointPadding: 0.2,
						            borderWidth: 0
						        }
						    },
						    series: [{
						        name: '美发商店',
						        data: orderNumArr
						
						    }]
						});
						Highcharts.chart('pieContainer', {
						    chart: {
						        plotBackgroundColor: null,
						        plotBorderWidth: null,
						        plotShadow: false,
						        type: 'pie'
						    },
						    title: {
						        text: '商店评论数统计'
						    },
						    tooltip: {
						        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
						    },
						    plotOptions: {
						        pie: {
						            allowPointSelect: true,
						            cursor: 'pointer',
						            dataLabels: {
						                enabled: true,
						                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
						                style: {
						                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
						                }
						            }
						        }
						    },
						    series: [{
						        name: 'Brands',
						        colorByPoint: true,
						        data: pieData
						    }]
						});
						
					}										
				}
					
			});
			
</script>


		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="graduateDesign/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="graduateDesign/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="graduateDesign/assets/js/ace/elements.onpage-help.js"></script>
		<script src="graduateDesign/assets/js/ace/ace.onpage-help.js"></script>
		<script src="graduateDesign/docs/assets/js/rainbow.js"></script>
		<script src="graduateDesign/docs/assets/js/language/generic.js"></script>
		<script src="graduateDesign/docs/assets/js/language/html.js"></script>
		<script src="graduateDesign/docs/assets/js/language/css.js"></script>
		<script src="graduateDesign/docs/assets/js/language/javascript.js"></script>
	</body>
</html>
