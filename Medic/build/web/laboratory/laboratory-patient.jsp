<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
  
		<div class="tabbable">
		<ul class="nav nav-tabs" >
			<li class="active"><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Personal data</a></li>
			<li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Analysis</a></li>
		</ul>
		 <div class="tab-content">
    <div class="tab-pane active" id="tab1">
  
    <div class="container" >
		<form class="form-horizontal">
			<div class="row">
					<div class="span4">
					<img src="../../resources/img/foto.png" style="width:140px; heigth:140px;">
					<div>
						<label class="my-control-label" for="card" > Card</label>
						<input type="text" id="card" readonly placeholder="some data">
					</div>	
				 
					<div>
						
						<label class="my-control-label" for="sex"> Sex</label>
						<input type="text" id="sex" readonly placeholder="some data">
					</div>
				</div>
				<div class="span8 ">
					<div class="control-group">
						<label class="my-control-label" for="outputNumber" >Medical insurance number</label>
						<div class="my-controls">
							<input type="text" id="outputNumber" readonly placeholder="some data">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="outputBirth">Date of birth</label>
						<div class="my-controls">
							<input type="text" id="outputBirth" readonly placeholder="some data">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="outputFIO">Last name, first name, patronymic</label>
						<div class="my-controls">
							<input type="text" id="outputFIO" readonly placeholder="some data">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="outputTel">Telephone number</label>
						<div class="my-controls">
							<input type="text" id="outputTel" readonly placeholder="some data">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="outputAddress">Address</label>
						<div class="my-controls">
							<input type="text" id="outputAddress" readonly placeholder="some data">
						</div>
					</div>
					<div class="control-group">
						<label class="my-control-label" for="outputPassport">Passport number</label>
						<div class="my-controls">
								<input type="text" id="outputPassport" readonly placeholder="some data">
						</div>
					</div>
				</div>
			</div>
			</div >
 
		</form>
    </div>
	 <div class="tab-pane" id="tab2">
     <div class="container" >
		<form class="form-horizontal" action="">
			<div class="row">
				<div class="span8 " style="margin-left: 200px;">
					<div class="control-group">
						<label class="my-control-label" for="inputAnalisisName" >Title of analysis</label>
						<div class="my-controls">
							<input type="text" id="inputAnalisisName" name="title">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputAboutAnalisis">Description</label>
						<div class="my-controls">
							<input type="text" id="inputAboutAnalisis" name="info">
						</div>
					</div>	
						<div class="control-group">
						<label class="my-control-label" for="inputAnalisisDate">Date</label>
						<div class="my-controls">
						<input type="text" name="date" id="inputAnalisisDate" name="date" value="dd.mm.yyyy"/>
						<p> <script type="text/javascript" /> calendar.set("inputAnalisisDate2"); </script /></p>
												</div>
					</div>
					<p><a href="#" class="btn">Upload file</a></p>
					<button type="submit" class="btn">Save</button>
				</div>
			</div>
		</form>
	</div >
    </div>
	  </div>
	  </div>
  
</body>
</html>