<%@page import="com.medic.facade.local.DoctorReceptionFacadeLocal"%>
<%@page import="com.medic.facade.local.ExaminationFacadeLocal"%>
<%@page import="com.medic.entity.Patient"%>
<%@page import="com.medic.entity.Doctor"%>
<%@page import="com.medic.entity.DoctorReception"%>
<%@page import="java.util.Collection"%>
<%@page import="com.medic.entity.Examination"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.medic.entity.MedicalHistory"%>
<%@page import="com.medic.facade.local.MedicalHistoryFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iMedic</title>
        <%@ include file="/jspf/link.jspf" %>
    </head>
    <body>
        <%@ include file="/jspf/navbar.jspf" %>
        <div class="container">
            <header>
                <h3>Medical card</h3>
            </header>
        </div>
        <%
            InitialContext ic = new InitialContext();

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat sdft = new SimpleDateFormat("dd-MM-yyyy 'at' hh:mm aaa");

            String pHistoryId = request.getParameter("id");
            String pDocReception = request.getParameter("reception");
            String pComplaints = request.getParameter("complaints");
            String pAction = request.getParameter("action");
            Integer historyId = null;
            Integer idDoctorReception = null;
            MedicalHistory history = null;
            DoctorReception checkedReception = null;
            Examination newExamination = null;
            Examination examination = null;
            Collection<DoctorReception> receptions = null;
            Collection<Examination> exams = null;
            Doctor doctor = null;
            Patient patient = null;

            String doctorFIO = null;

            MedicalHistoryFacadeLocal localHistory = (MedicalHistoryFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalHistoryRef");
            DoctorReceptionFacadeLocal localReception = (DoctorReceptionFacadeLocal) ic.lookup("java:comp/env/ejb/DoctorReceptionRef");
            ExaminationFacadeLocal localExamination = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");

            historyId = Integer.valueOf(pHistoryId);
            history = localHistory.find(historyId);
            receptions = history.getDoctorReceptions();
            patient = history.getIdMedicalCard().getIdPatient();
            if ("newExam".equals(pAction)) {
                if ((pComplaints.trim().isEmpty()) || (pDocReception==null)) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields.
        </div>
        <%    } else {
            idDoctorReception = Integer.valueOf(pDocReception);
            checkedReception = localReception.find(idDoctorReception);
            newExamination = new Examination(checkedReception, pComplaints);
            localExamination.create(newExamination);
            checkedReception.setIdExamination(newExamination);
            localReception.edit(checkedReception);
        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully added new examination.
        </div>
        <%
                }
            }
           
        %>

        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" >Examinations</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Doctor</th>
                                    <th width="50%">Complaints</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                    for (DoctorReception someReception : receptions) {
                                        examination = someReception.getIdExamination();
                                        if (examination != null) {
                                            doctor = someReception.getIdDoctor();
                                            doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                                %>
                                <tr>
                                    <td><%= sdf.format(someReception.getReceptionDate())%></td>
                                    <td><%= doctorFIO%></td>
                                    <td><%= examination.getComplaints()%></td>
                                    <td> <a href="doctor-exam.jsp?id=<%=examination.getIdExamination()%>">View</a> </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <p align="right">
                            <a class="btn" href="doctor-patient.jsp?id=<%=patient.getIdPatient()%>">Back to previous page</a>
                            <a href="#newExam" role="button" class="btn btn-primary" data-toggle="modal">New examination</a>

                        </p>

                        <div class="modal" id="newExam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Creating new examination</h4>
                            </div>
                            <div>
                                <form class="form-horizontal" method="POST"> 
                                    <div class="modal-body">
                                        <div class="alert alert-block">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <b>Attention! </b> All fields are mandatory.
                                        </div>
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputReception">Doctor reception </label>

                                            <div>
                                                <select id="outputReception" name="reception"  style="width:  520px;">
                                                   
                                                    <%  for (DoctorReception someReception : receptions) {
                                                            if (someReception.getIdExamination() == null) {
                                                                doctor = someReception.getIdDoctor();
                                                                doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();%>
                                                    <option value="<%=someReception.getIdDoctorReception()%>" <% if ((pDocReception != null) && (someReception.getIdDoctorReception() == Integer.valueOf(pDocReception))) {%> selected<%}%>><%=sdft.format(someReception.getReceptionDate())+ ", "+doctorFIO  %></option>
                                                    <%}
                                                        }%>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputComplaints">Complaints</label>
                                            <div>
                                                <textarea rows="9" id="outputComplaints" name="complaints" required style="width:  510px;"></textarea>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal" aria-hidden="true" formnovalidate>Close</button>
                                        <button type="submit" name="action" value="newExam" class="btn btn-primary">Save</button>
                                    </div>


                                </form>
                            </div>
                        </div>

                    </div >

                </div>
            </div>
        </div>

    </body>
</html>
