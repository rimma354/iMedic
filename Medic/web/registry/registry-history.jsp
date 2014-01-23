<%@page import="com.medic.facade.local.ExaminationFacadeLocal"%>
<%@page import="com.medic.entity.AdditionalInfo"%>
<%@page import="com.medic.entity.MedicalCard"%>
<%@page import="com.medic.entity.Patient"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
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
            String historyId = request.getParameter("id");
            MedicalHistory history = null;
            InitialContext ic = new InitialContext();
            MedicalHistoryFacadeLocal localHistory = (MedicalHistoryFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalHistoryRef");
            Integer id = null;
            Examination examination = null;
            Collection<DoctorReception> receptions = null;
            if (historyId != null) {
                id = Integer.valueOf(historyId);
            }
            if (id != null) {
                history = localHistory.find(id);
                receptions = history.getDoctorReceptions();
            }
            Patient patient = history.getIdMedicalCard().getIdPatient();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat sdft = new SimpleDateFormat("dd-MM-yyyy 'at' hh:mm aaa");
            Doctor doctor = null;
            String doctorFIO = "";
        %>
        <%
            ExaminationFacadeLocal localExamination = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");
  
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
                                        doctor = someReception.getIdDoctor();
                                        doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                                %>
                                <tr>
                                    <td><%= sdf.format(someReception.getReceptionDate())%></td>
                                    <td><%= doctorFIO%></td>
                                    <td><%= examination.getComplaints()%></td>
                                    <td> <a href="registry-exam.jsp?id=<%=examination.getIdExamination()%>">View</a> </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <p align="right">
                            <a class="btn" href="registry-patient.jsp?id=<%=patient.getIdPatient()%>">Back to previous page</a>
                            <a href="#newExam" role="button" class="btn btn-primary" data-toggle="modal">New examination</a>
                        </p>

                        <div class="modal" id="newExam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" <%if (request.getParameter("docRec") == null) {%> style="display: none;"<%}%>>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Creating new examination</h4>
                            </div>
                            <form class="form-horizontal" method="POST">
                                <div class="modal-body">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputReception">Doctor reception</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputReception" name="reception" readonly style="width: 200px;" value="<%=request.getParameter("docRec")%>">
                                            <a href="#ckechReception" role="button" class="btn" data-toggle="modal">...</a>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputComplaints">Complaints</label>
                                        <div class="my-controls">
                                            <textarea rows="5" id="outputComplaints" name="complaints"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>

                        </div>

                        <div class="modal" id="ckechReception" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Check reception</h4>
                            </div>
                            <form class="form-horizontal" method="POST">
                                         <%                                    for (DoctorReception someReception : receptions) {
                                         doctor = someReception.getIdDoctor();
                                         doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                             
                                %>
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputReception" style="width:500px;">
                                            <%=doctorFIO+", "+sdft.format(someReception.getReceptionDate())%>
                                        </label>
                                        <div class="my-controls">
                                            <input type ="radio" id="outputReception" name="docRec" value="<%=someReception.getIdDoctorReception()%>">
                                        </div>


                                    </div>
                                        <%}%>
                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                        <button class="btn btn-primary" >Check</button>
                                        </form>
                                    </div>


                                </div>
                        </div >

                    </div>
                </div>
            </div>
    </body>
</html>
