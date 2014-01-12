<%@page import="com.medic.entity.Measure"%>
<%@page import="com.medic.facade.local.MeasureFacadeLocal"%>
<%@page import="com.medic.entity.Drugs"%>
<%@page import="com.medic.facade.local.DrugsFacadeLocal"%>
<%@page import="com.medic.entity.MedicalHistory"%>
<%@page import="java.util.Date"%>
<%@page import="com.medic.entity.Doctor"%>
<%@page import="com.medic.entity.LaboratoryReception"%>
<%@page import="com.medic.entity.Treatment"%>
<%@page import="com.medic.entity.Diagnosis"%>
<%@page import="com.medic.entity.Analysis"%>
<%@page import="java.util.Collection"%>
<%@page import="com.medic.entity.Examination"%>
<%@page import="com.medic.facade.local.ExaminationFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            String pExaminationID = request.getParameter("id");

            InitialContext ic = new InitialContext();
            ExaminationFacadeLocal localExamination = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");
            DrugsFacadeLocal localDrugs = (DrugsFacadeLocal) ic.lookup("java:comp/env/ejb/DrugsRef");
            MeasureFacadeLocal localMeasure = (MeasureFacadeLocal) ic.lookup("java:comp/env/ejb/MeasureRef");

            Integer examinationID = null;
            Examination examination = null;
            MedicalHistory history = null;
            Collection<Drugs> drugs = localDrugs.findAll();
            Collection<Measure> measures = localMeasure.findAll();
            Collection<Diagnosis> diagnosis = null;
            Collection<Treatment> treatment = null;
            Collection<LaboratoryReception> laboratoryReceptions = null;
            Doctor doctor = null;
            String doctorFIO = "";
            Date examinationDate = null;

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

            if (pExaminationID != null) {
                examinationID = Integer.valueOf(pExaminationID);
                examination = localExamination.find(examinationID);
                diagnosis = examination.getDiagnoses();
                treatment = examination.getTreatments();
                laboratoryReceptions = examination.getLaboratoryReceptios();
                doctor = examination.getIdDoctorReception().getIdDoctor();
                examinationDate = examination.getIdDoctorReception().getReceptionDate();
                doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                history = examination.getIdDoctorReception().getIdMedicalHistory();
            }


        %>
        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Analysis</a></li>
                <li><a href="#tab2" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Diagnosis</a></li>
                <li><a href="#tab3" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Treatment</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Title</th>
                                    <th>Result</th>
                                    <th>Appointment card</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                    for (LaboratoryReception someLabReception : laboratoryReceptions) {
                                %>
                                <tr>
                                    <td><%=sdf.format(someLabReception.getAnalysisDate())%></td>
                                    <td><%=someLabReception.getIdAnalysis().getAnalysisTitle()%></td>
                                    <td><%=someLabReception.getAnalysisResult()%></td>
                                    <td><%=doctorFIO + ", " + sdf.format(examinationDate)%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <p align="right">
                            <a class="btn" href="doctor-history.jsp?id=<%=history.getIdMedicalHistory()%>">Back to previous page</a>
                            <a href="#newAnalysis" role="button" class="btn btn-primary" data-toggle="modal">Direct to analysis</a>
                        </p>
                    </div >
                </div>
                <div class="tab-pane" id="tab2">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Doctor</th>
                                    <th width=50%>Diagnosis</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                    for (Diagnosis someDiagnosis : diagnosis) {
                                %>
                                <tr>
                                    <td><%=sdf.format(examinationDate)%></td>
                                    <td><%=doctorFIO%></td>
                                    <td><%=someDiagnosis.getIdIllnesses().getIllnessesTitle()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <p align="right">
                            <a class="btn" href="doctor-history.jsp?id=<%=history.getIdMedicalHistory()%>">Back to previous page</a>
                            <a href="#newDiagnosis" role="button" class="btn btn-primary" data-toggle="modal">Make a diagnosis</a>
                        </p>

                    </div>
                </div>
                <div class="tab-pane" id="tab3">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Doctor</th>
                                    <th>Drug</th>
                                    <th>Dosage</th>
                                    <th>Measure</th>
                                    <th>Quantity</th>
                                    <th>Duration</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (Treatment someTreatment : treatment) {

                                %>
                                <tr>
                                    <td><%=sdf.format(examinationDate)%></td>
                                    <td><%=doctorFIO%></td>
                                    <td><%=someTreatment.getIdDrug().getDrugTitle()%></td>
                                    <td><%=someTreatment.getDosage()%></td>
                                    <td><%=someTreatment.getIdMeasure().getMeasureTitle()%></td>
                                    <td><%=someTreatment.getQuantity()%></td>
                                    <td><%=someTreatment.getDuration()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <p align="right">
                            <a class="btn" href="doctor-history.jsp?id=<%=history.getIdMedicalHistory()%>">Back to previous page</a>
                            <a href="#newTreatment" role="button" class="btn btn-primary" data-toggle="modal">Prescribe treatment</a>
                        </p>
                        <div class="modal" id="newTreatment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Check reception</h4>
                            </div>
                            <form class="form-horizontal" method="POST">

                                <div class="control-group">
                                    <label class="my-control-label" for="outputDrug">Drug                           
                                    </label>
                                    <div class="my-controls">
                                        <select id="outputDrug" name="drug">

                                            <% for (Drugs someDrug : drugs) {%>
                                            <option value="<%=someDrug.getIdDrug()%>"><%=someDrug.getDrugTitle()%></option>
                                            <%}%>
                                        </select>

                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="my-control-label" for="outputDosage">Dosage                           
                                    </label>
                                    <div class="my-controls">
                                        <input type="text" id="outputDosage" name="dosage">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="my-control-label" for="outputMeasure">Measure                           
                                    </label>
                                    <div class="my-controls">
                                        <select id="outputMeasure" name="measure">
                                            <% for (Measure someMeasure : measures) {%>
                                            <option value="<%=someMeasure.getIdMeasure()%>"><%=someMeasure.getMeasureTitle()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="my-control-label" for="outputQuantity">Quantity                           
                                    </label>
                                    <div class="my-controls">
                                        <input type="text" id="outputQuantity" name="quantity">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="my-control-label" for="outputDuration">Duration                           
                                    </label>
                                    <div class="my-controls">
                                        <input type="text" id="outputDuration" name="duration">
                                    </div>
                                </div>
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
