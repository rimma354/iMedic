<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.entity.AdditionalInfo"%>
<%@page import="com.medic.facade.AdditionalInfoFacadeLocal"%>
<%@page import="com.medic.entity.MedicalCard"%>
<%@page import="com.medic.facade.MedicalCardFacadeLocal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.medic.facade.PatientFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.medic.entity.Patient"%>
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
        <div id="openModal3" class="modalDialog">
            <div>

                <a href="#closeDialog" title="close" class="closeDialog" class="calendar-cancel" onclick="calendar.hideCalendar()" >X</a>
                <h2>Analysis</h2>
                <center>
                    <p>Title of analysis</p>
                    <p>Date</p>
                    <p>Description</p>
                    <p><a href="#" class="btn">View file</a></p>

            </div>
        </div>
        <%

            String patientId = request.getParameter("id");
            Patient patient = null;
            MedicalCard card = null;
            Collection<AdditionalInfo> additionalInfo = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            MedicalCardFacadeLocal localCard = (MedicalCardFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalCardRef");
            AdditionalInfoFacadeLocal localInfo = (AdditionalInfoFacadeLocal) ic.lookup("java:comp/env/ejb/AdditionalInfoRef");
            String str = "";
            Integer id = null;
            if (patientId != null) {
                id = Integer.valueOf(patientId);
            }
            if (id != null) {
                patient = localPatient.find(id);
                card = patient.getIdMedicalCard();
                additionalInfo = card.getAdditionalInfos();
            }
            str = patient.getLastName() + " " + patient.getFirstName() + " " + patient.getPatronymic();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String birth = sdf.format(patient.getDateBirth());
        %>



        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Personal data</a></li>
                <li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Additional information</a></li>
                <li><a href="#tab3"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Current medical history</a></li>
                <li><a href="#tab4"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Analysis</a></li>

                <li><a href="#tab5"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Medical history</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">


                    <div class="container" >
                        <form class="form-horizontal">
                            <div class="row">
                                <div class="span4">
                                    <img src="../resources/img/foto.png" style="width:140px; heigth:140px;">

                                    <div>
                                        <label class="my-control-label" for="sex" >Sex</label>
                                        <input type="text" id="sex" readonly placeholder="<%= patient.getIdSex().getSexTitle()%>">
                                    </div>
                                </div>
                                <div class="span8 ">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputFIO">Last name, first name, patronymic</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputFIO" readonly placeholder="<%=str%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="card" >Medical card</label>
                                        <div class="my-controls">
                                            <input type="text" id="card" readonly placeholder="<%= card.getIdMedicalCard()%>">
                                        </div>
                                    </div>	


                                    <div class="control-group">
                                        <label class="my-control-label" for="outputBirth">Date of birth</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputBirth" readonly placeholder="<%= birth%>">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputTel">Telephone number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputTel" readonly placeholder="<%= patient.getTelephone()%>">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputPassport">Passport number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputPassport" readonly placeholder="<%= patient.getPassport()%>">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputNumber" >Medical insurance number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputNumber" readonly placeholder="<%= patient.getInsuranceNumber()%>">
                                        </div>
                                    </div>	
                                </div>

                            </div>
                        </form>
                    </div >

                </div>

                <div class="tab-pane" id="tab2">
                    <div class="container" >
                        <form class="form-horizontal">
                            <div class="row">
                                <div class="span8 "style="margin-left: 200px;">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputChronicDiseases" >Chronic illness</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputChronicDiseases" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 3) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputDrugIntolerance">Drug intolerance</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputDrugIntolerance" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 4) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputAllergy">Allergies</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputAllergy" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 1) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputVaccinations">Vaccinations</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputVaccinations" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 6) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputBloodGroup">Blood group</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputBloodGroup" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 2) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputRHFactor">RH factor</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputRHFactor" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfo) {
                                                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 5) {
                                                        out.print(someInfo.getDescription());
                                                    }
                                                }
                                                   %>">
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </div >
                    </form>
                </div>

                <div class="tab-pane" id="tab3">
                    <div class="container" >

                        <form class="form-horizontal" action="">
                            <div class="row">
                                <div class="span8 " style="margin-left: 200px;">
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputPatientComplaint" >Complaints</label>
                                        <div class="my-controls">
                                            <input type="text" name="complaint" id="inputPatientComplaint">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputFirstInspection">Initial examination</label>
                                        <div class="my-controls">
                                            <input type="text" name="firstInspection" id="inputFirstInspection">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputSecondaryInspection">Secondary examination</label>
                                        <div class="my-controls">
                                            <input type="text" name="secondaryInspection" id="inputSecondaryInspection">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="inputDiagnosis">Diagnosis</label>
                                        <div class="my-controls">
                                            <input type="text" name="diagnosis" id="inputDiagnosis">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="inputTreatmentAssignment">Treatment assignment</label>
                                        <div class="my-controls">
                                            <input type="text" name="treatment" id="inputTreatmentAssignment">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputFirstDate">Date of first visit</label>
                                        <div class="my-controls">
                                            <input type="text" name="firstDate" id="inputFirstDate" value="dd.mm.yyyy"/>
                                            <p> <script type="text/javascript" /> calendar.set("inputFirstDate"); </script /></p>
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputLastDate">Date of discharge</label>
                                        <div class="my-controls">
                                            <input type="text" name="lastDate" id="inputLastDate" value="dd.mm.yyyy"/>
                                            <p> <script type="text/javascript" /> calendar.set("inputLastDate"); </script /></p>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn">Save</button>
                                </div>
                            </div>
                        </form>
                    </div >
                </div>



                <div class="tab-pane" id="tab4">


                    <div class="container" >

                        <div class="row">
                            <div class="span8 " style="margin-left: 200px;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Title</th>
                                            <th>Selection</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>2</td>
                                            <td>

                                                <p><a href="#openModal3" class="btn">View</a></p>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>2</td>
                                            <td>

                                                <p><a href="#openModal3" class="btn">View</a></p>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <form class="form-horizontal" method="get" action="#openModal3">			
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputAnalisisSearch" >Searching by title</label>
                                        <div class="my-controls">
                                            <input type="text" name="analysis" id="inputAnalisisSearch">
                                        </div>
                                        <button type="submit" class="btn">Search</button>
                                    </div>	
                                </form>


                            </div >	
                        </div >					

                    </div >


                </div>



                <div class="tab-pane" id="tab5">


                    <div class="container" >
                        <form class="form-horizontal">
                            <div class="row">
                                <div class="span8 " style="margin-left: 200px;">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputPatientComplaint" >Complaints</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputPatientComplaint" readonly placeholder="some data">

                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputFirstInspection">Initial examination</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputFirstInspection" readonly placeholder="some data">

                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputSecondaryInspection">Secondary examination</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputSecondaryInspection" readonly placeholder="some data">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputDiagnosis">Diagnosis</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputDiagnosis" readonly placeholder="some data">
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputTreatmentAssignment">Treatment assignment</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputTreatmentAssignment" readonly placeholder="some data">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputFirstDate">Date of first visit</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputFirstDate" readonly placeholder="some data">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputLastDate">Date of discharge</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputLastDate" readonly placeholder="some data">
                                        </div>
                                    </div>	
                                </div>
                            </div>
                        </form>
                    </div>

                </div>



            </div>
    </body>
</html>