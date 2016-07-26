<%@page import="java.util.List"%>
<%@page import="com.lauguobin.www.po.User"%>
<%@ page language="Java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
if(request.getAttribute("userlist")==null)
{
	request.getRequestDispatcher("../UserShowServlet").forward(request, response);
	return ;
}
@SuppressWarnings("unchecked")
List<User> list = (List<User>)request.getAttribute("userlist");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>图书馆后台</title>
		<base href="<%=basePath%>">
		<link rel="shortcut icon" href="assets/images/gt_favicon.png">
		
		<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> 
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	
		<!-- Custom styles for our template -->
		<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
		<link rel="stylesheet" href="assets/css/main.css"> 
	
		<link rel="stylesheet" href="assets/css/table.css">
	</head>
	
	<body class="home">
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="home.jsp">Library System</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="manager/librarymanage.jsp">书籍</a></li>
					<li><a href="manager/addbook.jsp">上架新书</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">用户页面 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="manager/userlist.jsp">查看用户信息</a></li>
							<li><a href="manager/log.jsp">查看用户日志</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">审核信息 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="manager/audit.jsp">注册信息</a></li>
							<li><a href="manager/borrowManage.jsp">借阅信息</a></li>
						</ul>
					</li>
					<li><a class="btn" href="signin.jsp">退出</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">
	
		<ol class="breadcrumb">
			<li><a href="home.jsp">Home</a></li>
			<li class="active">注册信息</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h5 class="page-title"></h5>
<!-- 						<form action = "UserSearchServlet" method = "post">
		<p>
			<input type = "text" name = "search" class = "search" style = "width:500px;color:#5b5b5b;" placeholder = "输入用户信息">
			<button type = "submit"  class = "search">点我搜索</button>
		</p>
	</form> -->
				</header>
				<%if(list.isEmpty()) {%>
					<p class="text-danger">没有可以显示的信息！</p>
				<%}else{ %>
					<table >
						<tr><th>用户名</th><th>密码</th><th>身份</th></tr>
						<%for(User u : list) {%>
						<tr>
							<td><%= u.getUsername() %></td>
							<td><%= u.getPassword() %></td>
							<td><%= u.getIdentify() %></td>
						</tr>
						<%} %>
					</table>
				 	<%} %>
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->

	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					
					<div class="col-md-3 widget">
						<h3 class="widget-title">我</h3>
						<div class="widget-body">
							<p>+86 156 2517 8801<br>
								<a href="mailto:#">Eyetide@live.com</a><br>
								<br>
								兴宁 梅州 广东
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">关注我</h3>
						<div class="widget-body">
							<p class="follow-me-icons clearfix">
								<a href=""><i class="fa fa-twitter fa-2"></i></a>
								<a href=""><i class="fa fa-dribbble fa-2"></i></a>
								<a href=""><i class="fa fa-github fa-2"></i></a>
								<a href=""><i class="fa fa-facebook fa-2"></i></a>
							</p>	
						</div>
					</div>

					<div class="col-md-6 widget">
						<h3 class="widget-title">关于项目</h3>
						<div class="widget-body">
							<p>二轮考核项目2.0版本，基于maven以及mybatis框架重构。</p>
							<p>重构了整个架构，新增了一些功能，优化页面。</p>
						</div>
					</div>

				</div> 
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					
					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="#">主页</a> | 
								<b><a href="signup.html"></a>登录</b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">
								Copyright &copy; 2016, gb. 由<a href="http://gitlab.topview.com/" rel="designer">TopView</a>提供技术支持
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</footer>	
		
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>