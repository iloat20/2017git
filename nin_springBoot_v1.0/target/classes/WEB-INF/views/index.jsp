<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    if (path.equals("/")) {
        path = "";
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

    <c:set var="ctx" value="${pageContext.request.contextPath}" />

    <link rel="stylesheet" href="${ctx}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/jquery-ui-1.10.3.full.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/datepicker.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/googleFamily.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/ui.jqgrid.css" />

    <link rel="stylesheet" href="${ctx}/assets/css/chosen.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/custom.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css" />

    <!--[if !IE]> -->
    <script src="${ctx}/assets/js/jquery-2.0.3.min.js" ></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script src="${ctx}/assets/js/jquery-1.10.2.min.js" ></script>
    <![endif]-->

    <title>Spring Boot管理后台</title>
    <style>
        .logo{
            width: 30px;
            height:30px;
            padding: 0px;
            margin-top: -4px;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            //初始化查询菜单
//        initData();
            $("#menus").on("click", ".changeUrl", function() {
                var id = $(this).attr("id");
                var url = $(this).attr("value");

                /*<![CDATA[*/
                if(id && url){
                    addTabs({
                        id:id,
                        title:$(this).text(),
                        url:url,
                        close:true
                    });
                }
                /*]]>*/


            });
            $(".nav-tabs").on("click", ".close-tab", function() {
                id = $(this).prev("a").attr("aria-controls");
                closeTab(id);
            });

            $("#mainIframe").load(function(){
                var mainheight =$(this).contents().find("body").height();
                /*<![CDATA[*/
                if(mainheight<400){
                    mainheight = 400;
                }
                /*]]>*/
                $(this).height(mainheight);
            });

            //退出操作
            $("#outLogin").click(function(){
                $.ajax({
                    url: "/loginOut",
                    cache: false,
                    dataType: 'json',
                    type: 'get',
                    success: function (json) {
                        try {
                            window.location.href = "/";
                        } catch (e) {
                            window.location.href = "/";
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(123);
                    }
                });
            });
        });

        //打开菜单
        function changeUrl(url) {
            clearFlash();
            $("#mainFrame").attr("src","/" + url);
        }
        //清除iframe
        function clearFlash() {
            try {
                //在iframe销毁前清理掉iframe中的内容（特别是flash）
                $("#mainFrame").contents().find("body").empty();
            } catch (e) {
            }
        }
    </script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a class="navbar-brand" style="height: 45px;">
                <small>
                    <img class="logo" src="${ctx}/assets/images/logo.png" /> SpringBoot教程管理
                </small>
            </a>
        </div>

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-tasks"></i>
                        <span class="badge badge-grey">4</span>
                    </a>

                    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="icon-ok"></i>
                            还有4个任务完成
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">软件更新</span>
                                    <span class="pull-right">65%</span>
                                </div>

                                <div class="progress progress-mini ">
                                    <div style="width:65%" class="progress-bar "></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">硬件更新</span>
                                    <span class="pull-right">35%</span>
                                </div>

                                <div class="progress progress-mini ">
                                    <div style="width:35%" class="progress-bar progress-bar-danger"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">单元测试</span>
                                    <span class="pull-right">15%</span>
                                </div>
                                <div class="progress progress-mini ">
                                    <div style="width:15%" class="progress-bar progress-bar-warning"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">错误修复</span>
                                    <span class="pull-right">90%</span>
                                </div>
                                <div class="progress progress-mini progress-striped active">
                                    <div style="width:90%" class="progress-bar progress-bar-success"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                查看任务详情
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="purple"><a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-bell-alt icon-animated-bell"></i> <span class="badge badge-important">8</span>
                </a>

                    <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header"><i class="icon-warning-sign"></i>8条通知</li>
                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left"> <i class="btn btn-xs no-hover btn-pink icon-comment"></i> 新闻评论 </span> <span class="pull-right badge badge-info">+12</span>
                                </div>
                            </a>
                        </li>

                        <li><a href="#"> <i class="btn btn-xs btn-primary icon-user"></i> 切换为编辑登录..</a></li>

                        <li><a href="#">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>新订单</span> <span class="pull-right badge badge-success">+8</span>
                            </div>
                        </a></li>

                        <li><a href="#">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="btn btn-xs no-hover btn-info icon-twitter"></i> 粉丝 </span> <span class="pull-right badge badge-info">+11</span>
                            </div>
                        </a></li>

                        <li><a href="#"> 查看所有通知 <i class="icon-arrow-right"></i>
                        </a></li>
                    </ul></li>

                <li class="green">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>

                    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="icon-envelope-alt"></i>
                            5条消息
                        </li>

                        <li>
                            <a href="#">
                                <img src="${ctx}/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
                                <span class="msg-body">
                                    <span class="msg-title">
                                        <span class="blue">Alex:</span>
                                        不知道写啥 ...
                                    </span>

                                    <span class="msg-time">
                                        <i class="icon-time"></i>
                                        <span>1分钟以前</span>
                                    </span>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <img src="${ctx}/assets/avatars/avatar3.png"  class="msg-photo" alt="Susan's Avatar" />
                                <span class="msg-body">
                                    <span class="msg-title">
                                        <span class="blue">Susan:</span>
                                        不知道翻译...
                                    </span>

                                    <span class="msg-time">
                                        <i class="icon-time"></i>
                                        <span>20分钟以前</span>
                                    </span>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <img src="${ctx}/assets/avatars/avatar4.png"  class="msg-photo" alt="Bob's Avatar" />
                                <span class="msg-body">
                                    <span class="msg-title">
                                        <span class="blue">Bob:</span>
                                        到底是不是英文 ...
                                    </span>

                                    <span class="msg-time">
                                        <i class="icon-time"></i>
                                        <span>下午3:15</span>
                                    </span>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="inbox.html">
                                查看所有消息
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${ctx}/assets/images/dudu.jpg" />
                        <span class="user-info">
                            <small>欢迎光临,</small>
                            <span>大神</span>
						</span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="#"> <i class="icon-cog"></i> 设置</a></li>
                        <li><a href="#"> <i class="icon-user"></i> 个人资料</a></li>
                        <li class="divider"></li>
                        <li><a id="outLogin" href="#"> <i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>

<div class="main-container" id="main-container">

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#"> <span class="menu-text"></span></a>
        <div class="sidebar" id="sidebar">
            <ul id="menus" class="nav nav-list">
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text">教程管理</span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a id="learn" value="${ctx}/learn" class="changeUrl">
                                <i class="icon-double-angle-right"></i>
                                SpringBoot学习资料
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-cogs"></i>
                        <span class="menu-text">系统管理</span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                用户管理
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                角色管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text">客户-套餐管理</span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="#" class="changeUrl">
                                <i class="icon-double-angle-right"></i>
                                客户信息管理
                            </a>
                        </li>
                        <li>
                            <a href="#" class="changeUrl">
                                <i class="icon-double-angle-right"></i>
                                套餐模板管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-edit"></i>
                        <span class="menu-text">岗位体系管理</span>
                    </a>
                </li>



                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-cloud"></i>
                        <span class="menu-text">资源管理</span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                课程资源管理
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                课件资源管理
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                考试资源管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-globe"></i>
                        <span class="menu-text"> 系统信息管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                新客户审核
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left"
                   data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
        </div>
        <div class="main-content">
            <ul class="nav nav-tabs" role="tablist" style="height:34px">
                <li role="presentation" class="active" style="margin-right: 4px;">
                    <a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="icon-home home-icon"></i>首页</a>
                </li>
            </ul>
            <div class="tab-content page-content" style="margin-right: 5px;">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <iframe id="mainIframe" src="${ctx}/index/main" scrolling="no" frameborder="0" width="100%" style="border: 0;height: 200px;"></iframe>
                </div>
            </div>
        </div>

        <!-- /.main-content -->
        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>
            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>
                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" /> <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                </div>
                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/> <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>
                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" /> <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                </div>
                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" /> <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>
                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" /> <label class="lbl" for="ace-settings-add-container">切换窄屏<b></b></label>
                </div>
            </div>
        </div>
        <!-- /#ace-settings-container -->
    </div>
    <!-- /.main-container-inner -->
    <!--
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
     -->
</div>
<!-- /.main-container -->
<script src="${ctx}/assets/js/ace-extra.min.js" ></script>
<!--[if lt IE 9]>

<script src="${ctx}/assets/js/html5shiv.js" ></script>
<script src="${ctx}/assets/js/respond.min.js" ></script>
<![endif]-->
<script src="${ctx}/assets/js/bootstrap.min.js" ></script>
<script src="${ctx}/assets/js/jquery-ui-1.10.3.custom.min.js" ></script>
<script src="${ctx}/assets/js/jquery.slimscroll.min.js" ></script>
<script src="${ctx}/assets/js/chosen.jquery.min.js" ></script>
<script src="${ctx}/assets/js/ace-elements.min.js" ></script>
<script src="${ctx}/assets/js/ace.min.js" ></script>
<script src="${ctx}/assets/js/md5.js" ></script>
<script src="${ctx}/assets/js/custom.js" ></script>
<script src="${ctx}/assets/js/jquery.messager.js" ></script>
</body>
</html>