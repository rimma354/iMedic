<%-- 
    Document   : index
    Created on : Dec 22, 2013, 11:51:33 AM
    Author     : Rimma
--%>

<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Locale.setDefault(Locale.ENGLISH);	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iMedic</title>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css"> 
	<script src="resources/js/jquery-latest.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/date.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
		<nav class="navbar-inner">
			<a href="index.html" class="brand">iMedic</a>
			<ul class="nav">
				<li class="divider-vertical"></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Registry<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="registry/new-patient.jsp">Create new patient card</a></li>
						<li><a href="registry/registry-search.jsp">Search patient</a></li>
						<li><a href="registry/doctors-schedule.jsp">Doctors schedule</a></li>
						<li><a href="registry/laboratories-schedule.jsp">Laboratories schedule</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Doctor<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="doctor/doctor-search.jsp">Search patient</a></li>
						<li><a href="doctor/doctor-reception.jsp">Receptions</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Laboratory<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="laboratory/laboratory-search.jsp">Search patient</a></li>
						<li><a href="laboratory/laboratory-reception.jsp">Receptions</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Edit doctor's schedule</a></li>
						<li><a href="#">Edit laboratory's  schedule</a></li>
						<li><a href="#">Edit DB doctors</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	<div class="container">
	<header>
		<h1>Welcome to iMedic Wed Application!</h1>
	</header>
	</div>
</body>
</html>