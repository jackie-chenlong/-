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

					

					<li class="active open">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 管理模块 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="active">
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
					<li class="">
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
							<li class="">
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
								<a href="javascript:void(0)">管理模块</a>
							</li>
							<li class="active">用户管理</li>
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

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<!--<div class="well well-sm">
									You can have a custom jqGrid download here:
									<a href="http://www.trirand.com/blog/?page_id=6" target="_blank">
										http://www.trirand.com/blog/?page_id=6
										<i class="fa fa-external-link bigger-110"></i>
									</a>
								</div>-->

								<table id="grid-table"></table>

								<div id="grid-pager"></div>

								<script type="text/javascript">
									var $path_base = "..";//in Ace demo this will be used for editurl parameter
								</script>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
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

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		   var grid_data;

			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			];
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
			    })
				
				//resize on sidebar collapse/expand
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 20);
					}
			    })
				
				//if your grid is inside another element, for example a tab pane, you should use its parent's width:
				/**
				$(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
				//and also set width when tab pane becomes visible
				$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  if($(e.target).attr('href') == '#mygrid') {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				  }
				})
				*/
				
				//请求所有用户数据	
				var ajaxObj =  $.ajax({
					url: "userController/getUserList.action",
					type: "post",
					dataType:'json',
					data: "",
					success: function(res){	
						if(res){
							grid_data = res;
							jQuery(grid_selector).jqGrid({
								//direction: "rtl",
						
								//subgrid options
								subGrid : true,
								//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
								//datatype: "xml",
								subGridOptions : {
									plusicon : "ace-icon fa fa-plus center bigger-110 blue",
									minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
									openicon : "ace-icon fa fa-chevron-right center orange"
								},
								//for this example we are using local data
								subGridRowExpanded: function (subgridDivId, rowId) {
									var subgridTableId = subgridDivId + "_t";
									$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
									$("#" + subgridTableId).jqGrid({
										datatype: 'local',
										data: subgrid_data,
										colNames: ['No','Item Name','Qty'],
										colModel: [
											{ name: 'id', width: 50 },
											{ name: 'name', width: 150 },
											{ name: 'qty', width: 50 }
										]
									});
								},
																		
								data: grid_data,
								datatype: "local",
								height: 350,
								colNames:[' ', 'ID','Name','Password','Sex','Phone'],
								colModel:[
									{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
										formatter:'actions', 
										formatoptions:{ 
											keys:true,
											//delbutton: false,//disable delete button
											
											delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
											//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
										}
									},
									{name:'id',index:'id', width:100, sorttype:"int", editable: true},							
									{name:'name',index:'name', width:200,editable: true,editoptions:{size:"20",maxlength:"30"}},
									{name:'password',index:'password', width:200, sortable:true,editable: true, editoptions:{rows:"2",cols:"10"}},
									{name:'sex',index:'sex', width:100,editable: true,editoptions:{size:"20",maxlength:"30"}},
									{name:'phone',index:'phone', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}}
								], 
						
								viewrecords : true,
								rowNum:10,
								rowList:[10,20,30],
								pager : pager_selector,
								altRows: true,
								//toppager: true,
								
								multiselect: true,
								//multikey: "ctrlKey",
						        multiboxonly: true,
						
								loadComplete : function() {
									var table = this;
									setTimeout(function(){
										styleCheckbox(table);
										
										updateActionIcons(table);
										updatePagerIcons(table);
										enableTooltips(table);
									}, 0);
								},
						
								editurl: "graduateDesign/dummy.html",//nothing is saved
								caption: "用户表"
						
								//,autowidth: true,
						
						
								/**
								,
								grouping:true, 
								groupingView : { 
									 groupField : ['name'],
									 groupDataSorted : true,
									 plusicon : 'fa fa-chevron-down bigger-110',
									 minusicon : 'fa fa-chevron-up bigger-110'
								},
								caption: "Grouping"
								*/
						
							});
							//增加底部的几个按钮navButtons
							jQuery(grid_selector).jqGrid('navGrid',pager_selector,
								{ 	//navbar options
									edit: true,
									editicon : 'ace-icon fa fa-pencil blue',
									add: true,
									addicon : 'ace-icon fa fa-plus-circle purple',
									del: true,
									delicon : 'ace-icon fa fa-trash-o red',
									search: true,
									searchicon : 'ace-icon fa fa-search orange',
									refresh: true,
									refreshicon : 'ace-icon fa fa-refresh green',
									view: true,
									viewicon : 'ace-icon fa fa-search-plus grey',
								},
								{
									//edit record form
									//closeAfterEdit: true,
									//width: 700,
									recreateForm: true,
									beforeShowForm : function(e) {
										var form = $(e[0]);
										form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
										style_edit_form(form);
									}
								},
								{
									//new record form
									//width: 700,
									closeAfterAdd: true,
									recreateForm: true,
									viewPagerButtons: false,
									beforeShowForm : function(e) {
										var form = $(e[0]);
										form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
										.wrapInner('<div class="widget-header" />')
										style_edit_form(form);
									}
								},
								{
									//delete record form
									recreateForm: true,
									beforeShowForm : function(e) {
										var form = $(e[0]);
										if(form.data('styled')) return false;
										
										form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
										style_delete_form(form);
										
										form.data('styled', true);
									},
									onClick : function(e) {
										//alert(1);
									}
								},
								{
									//search form
									recreateForm: true,
									afterShowSearch: function(e){
										var form = $(e[0]);
										form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
										style_search_form(form);
									},
									afterRedraw: function(){
										style_search_filters($(this));
									}
									,
									multipleSearch: true,
									/**
									multipleGroup:true,
									showQuery: true
									*/
								},
								{
									//view record form
									recreateForm: true,
									beforeShowForm: function(e){
										var form = $(e[0]);
										form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
									}
								}
							)
						}
						
						//解除行中增加按钮的绑定事件
						$(".sgcollapsed").off("click");
					}
				
						
				});	
			
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
			
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$.jgrid.gridDestroy(grid_selector);
					$('.ui-jqdialog').remove();
				});
				
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
