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
			<a class="brand">iMedic</a>
			<ul class="nav">
				<li class="divider-vertical"></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Registry<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../registry/new-patient.html">Create new patient card</a></li>
						<li><a href="../registry/registry-search.html">Search patient</a></li>
						<li><a href="../registry/doctors-schedule.html">Doctors schedule</a></li>
						<li><a href="../registry/laboratories-schedule.html">Laboratories schedule</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Doctor<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../doctor/doctor-search.html">Search patient</a></li>
						<li><a href="../doctor/doctor-reception.html">Receptions</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Laboratory<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../laboratory/laboratory-search.html">Search patient</a></li>
						<li><a href="../laboratory/laboratory-reception.html">Receptions</a></li>
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
			<li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Additional information</a></li>
		
		</ul>
		 <div class="tab-content">
    <div class="tab-pane active" id="tab1">
    <body>
  
    <div class="container" >
		<form class="form-horizontal" action="">
			<div class="row">
					<div class="span4">
					<img src="../../resources/img/foto.png" style="width:140px; heigth:140px;">
				
				    <br><br>
					<div>
						<label for="sex" >Sex</label>
						<select class="input-medium" id="sex" name="sex">
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
				</div>
				<div class="span8 ">
					<div class="control-group">
						<label class="my-control-label" for="inputNumber" >Medical insurance number</label>
						<div class="my-controls">
							<input type="text" id="inputNumber" name="number">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputBirth">Date of birth</label>
						<div class="my-controls">
								<input type="text" name="date" id="inputBirth2" value="dd.mm.yyyy"/>
						<p> <script type="text/javascript" /> calendar.set("inputBirth2"); </script /></p>
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputFIO">Last name, first name, patronymic</label>
						<div class="my-controls">
							<input type="text" id="inputFIO" name="fio">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputTel">Telephone number</label>
						<div class="my-controls">
							<input type="text" id="inputTel" name="tel">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputAddress">Address</label>
						<div class="my-controls">
							<input type="text" id="inputAddress" name="address">
						</div>
					</div>
					<div class="control-group">
						<label class="my-control-label" for="inputPassport">Passport number</label>
						<div class="my-controls">
							<input type="text" id="inputPassport" name="passport">
						</div>
					</div>
					<button type="submit" class="btn">Save</button>
				</div>
			</div>
			</div >
 
		</form>
    </div>
	
    <div class="tab-pane" id="tab2">
      <body>
  
    <div class="container" >
		<form class="form-horizontal" action="">
			<div class="row">
								<div class="span8 "style="margin-left: 200px;">
					<div class="control-group">
						<label class="my-control-label" for="inputChronicDiseases" >Chronic illness</label>
						<div class="my-controls">
							<input type="text" id="inputChronicDiseases" name="chronic">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputDrugIntolerance">Drug intolerance</label>
						<div class="my-controls">
							<input type="text" id="inputDrugIntolerance" name="drug">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputAllergy">Allergies</label>
						<div class="my-controls">
							<input type="text" id="inputAllergy" name="allergy">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputVaccinations">Vaccinations</label>
						<div class="my-controls">
							<input type="text" id="inputVaccinations" name="vaccination">
						</div>
					</div>	
					<div class="control-group">
						<label class="my-control-label" for="inputBloodGroup">Blood group</label>
						<div class="my-controls">
							<input type="text" id="inputBloodGroup" name="blood">
						</div>
					</div>
					
						<div class="control-group">
						<label class="my-control-label" for="inputRHFactor">RH factor</label>
						<div class="my-controls">
							<input type="text" id="inputRHFactor" name="RH">
						</div>
					</div>
					<button type="submit" class="btn">Save</button>
				</div>
			</div>
			</div >
 
		</form>
    </div>
  </div>
  </div>
</body>
</html>