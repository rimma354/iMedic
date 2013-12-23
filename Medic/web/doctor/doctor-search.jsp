
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.medic.entity.Patient"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.facade.PatientFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
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
                <h1>Search patient</h1>
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
            <form class="form-horizontal" action="doctor-patient.jsp">

                <div class="row">
                    <div class="span8 " style="margin-left: 200px;">
                        <div class="control-group">
                            <label class="my-control-label" for="inputSearch" >Searching patient by id</label>
                            <div class="my-controls">
                                <input type="text" name="id"> <button type="submit" class="btn">Search</button>
                            </div>
                        </div>	
                    </div>
                </div >
            </form>
        </div>

        <div class="container" >
            <form class="form-horizontal" action="doctor-search.jsp">

                <div class="row">
                    <div class="span8 " style="margin-left: 200px;">
                        <div class="control-group">
                            <label class="my-control-label" for="inputSearch" >Searching patient by last name</label>
                            <div class="my-controls">
                                <input type="text" name="lastName"> <button type="submit" class="btn">Search</button>
                            </div>
                        </div>	
                    </div>
                </div >
            </form>
        </div>
           <style>
                .my-input {
                    float: left;
                    width: 150px;
                    text-align: left;	
                }
            </style> 
        <%
            String patientLastName = request.getParameter("lastName");
            List<Patient> patients = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            if (patientLastName != null) {
                patients = localPatient.findByLastName(patientLastName);
        %>
       
       
            <%
                for (Patient somePatient : patients) {
            %>
 <form class="form-horizontal" action="doctor-patient.jsp">
     <table>
                <tr>
                    <td><input class="my-input" type="text" name="id" readonly value="<%= somePatient.getIdPatient()%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= somePatient.getLastName()%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= somePatient.getFirstName()%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= somePatient.getPatronymic()%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= somePatient.getIdSex().getSexTitle()%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= sdf.format(somePatient.getDateBirth())%>"></td>
                    <td> <input class="my-input" type="text" readonly placeholder="<%= somePatient.getPassport()%>"></td>
                    <td> <button type="submit" class="btn">View</button></td>
                </tr>
        </table>
    </form>     
    <%
            }
        }

    %>

</body>
</html>