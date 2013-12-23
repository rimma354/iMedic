<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iMedic</title>
<link href="../resources/css/style.css" rel="stylesheet" type="text/css"> 
	<script src="../resources/js/jquery-latest.js"></script>
	<script src="../resources/js/bootstrap.js"></script>
	<script src="../resources/js/date.js"></script>
	<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
		<nav class="navbar-inner">
			<a href="../index.html" class="brand">iMedic</a>
			<ul class="nav">
				<li class="divider-vertical"></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Registry<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../registry/new-patient.jsp">Create new patient card</a></li>
						<li><a href="../registry/registry-search.jsp">Search patient</a></li>
						<li><a href="../registry/doctors-schedule.jsp">Doctors schedule</a></li>
						<li><a href="../registry/laboratories-schedule.jsp">Laboratories schedule</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Doctor<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../doctor/doctor-search.jsp">Search patient</a></li>
						<li><a href="../doctor/doctor-reception.jsp">Receptions</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Laboratory<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../laboratory/laboratory-search.jsp">Search patient</a></li>
						<li><a href="../laboratory/laboratory-reception.jsp">Receptions</a></li>
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
		<h1>Medical card</h1>
	</header>
	 <style>
	.my-control-label {
		float: left;
		width: 250px;
		padding-top: 5px;
		text-align: left;	
	}
	.my-controls {
		margin-left: 270px;
	}
	</style> 
	</div>

    <div class="container" >
		<form class="form-horizontal" action="registry-patient.jsp">
			<div class="row">
								<div class="span8 " style="margin-left: 200px;">
					 <center>
				<div class="control-group">
						<label class="my-control-label" for="inputSearch" >Searching patient by last name</label>
						<div class="my-controls">
							<input type="text" id="inputSearch" name="lastName">
						</div>
					</div>	
		
       	<p><button type="submit" class="btn">Search</button></p>
</center>
				
			</div>
			</div >
 		</form>
    </div>
	  </div>
   </div>
</body>
</html>