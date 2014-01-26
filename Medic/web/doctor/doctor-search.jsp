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
            <form class="form-horizontal" action="doctor-search.jsp" >

                <div class="control-group">
                    <label class="my-control-label" for="inputSearch" >Searching patient by id</label>
                    <div class="my-controls">
                        <input type="text" name="id" required pattern="^[0-9]+$"  title="only integer number"> <button type="submit"  name="action" value="searchById" class="btn">Search</button>
                    </div>
                </div>	
            </form>
        </div>

        <div class="container" >
            <form class="form-horizontal" action="doctor-search.jsp" >
                <div class="control-group">
                    <label class="my-control-label" for="inputSearch" >Searching patient by last name</label>
                    <div class="my-controls">
                        <input type="text" name="lastName" required pattern="^[a-zA-Z]+$" title="only latin "> <button type="submit" name="action"  value="searchByLastName" class="btn">Search</button>
                    </div>
                </div>	
            </form>
        </div>
        <br>
        <%
            String patientLastName = request.getParameter("lastName");
            String patientId = request.getParameter("id");
            String pAction = request.getParameter("action");
            Integer id = null;
            Patient patient = null;
            List<Patient> patients = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            if ("searchByLastName".equals(pAction)) {
                if ((patientLastName != null) && (!"".equals(patientLastName)) && (!patientLastName.trim().isEmpty())) {
                    patients = localPatient.findByLastName(patientLastName);
                    if (!patients.isEmpty()) {
        %>
        <div class="container" >
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
        </div>
        <%
        } else {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            There are no patients with such last name.
        </div>
        <%
            }
        } else {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            Your should fill in field before searching!
        </div>
        <%
                }
            }


        %>
        <%    if ("searchById".equals(pAction)) {
                if ((patientId != null) && (!"".equals(patientId))) {
                    try {
                        id = Integer.parseInt(patientId);
                        patient = localPatient.find(id);
                        if (patient != null) {
        %>
        <div class="container" >
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

                    <tr>
                        <td><%= patient.getIdPatient()%></td>
                        <td><%= patient.getLastName()%></td>
                        <td><%= patient.getFirstName()%></td>
                        <td><%= patient.getPatronymic()%></td>
                        <td><%= patient.getIdSex().getSexTitle()%></td>
                        <td><%= sdf.format(patient.getDateBirth())%></td>
                        <td><%= patient.getPassport()%></td>
                        <td> <a href="doctor-patient.jsp?id=<%=patient.getIdPatient()%>">View</a> </td>
                    </tr>

                </tbody>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            There are no patients with such ID.
        </div>
        <%
            }
        } catch (NumberFormatException e) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            ID should be a numeric.
        </div>
        <%
            }

        } else {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            Your should fill in field before searching!
        </div>
        <%
                }
            }

        %>

    </body>
</html>