<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.medic.entity.Patient"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
        <title>iMedic</title>
        <%@ include file="/jspf/link.jspf" %>

    </head>
    <body>
        <%@ include file="/jspf/navbar.jspf" %>

        <div class="container">
            <header>
                <h3>Search patient</h3>
            </header>
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

        <%
            String patientLastName = request.getParameter("lastName");
            List<Patient> patients = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            if (patientLastName != null) {
                patients = localPatient.findByLastName(patientLastName);
        %>
        <table  class="table table-hover">
            <thead>
                <tr>
                    <th width="60">ID</th>
                    <th>Last name</th>
                    <th>First name</th>
                    <th>Patronymic</th>
                    <th>Sex</th>
                    <th>Date of birth</th>
                    <th>Passport</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>

                <%
                    for (Patient somePatient : patients) {
                %>
                <tr>
                    <td><%= somePatient.getIdPatient()%></td>
                    <td><%= somePatient.getLastName()%></td>
                    <td><%= somePatient.getFirstName()%></td>
                    <td><%= somePatient.getPatronymic()%></td>
                    <td><%= somePatient.getIdSex().getSexTitle()%></td>
                    <td><%= sdf.format(somePatient.getDateBirth())%></td>
                    <td><%= somePatient.getPassport()%></td>
                    <td> <a href="doctor-patient.jsp?id=<%=somePatient.getIdPatient()%>">View</a> </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }

        %>

    </body>
</html>