<%@page import="com.medic.facade.local.AnalysisFacadeLocal"%>
<%@page import="com.medic.facade.local.LaboratoryReceptionFacadeLocal"%>
<%@page import="com.medic.facade.local.DiagnosisFacadeLocal"%>
<%@page import="com.medic.facade.local.DiagnosisFacadeLocal"%>
<%@page import="com.medic.entity.Illnesses"%>
<%@page import="com.medic.facade.local.IllnessesFacadeLocal"%>
<%@page import="com.medic.facade.local.TreatmentFacadeLocal"%>
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
            String pExaminationId = request.getParameter("id");
            String pDrugId = request.getParameter("drug");
            String pMeasureId = request.getParameter("measure");
            String pDosage = request.getParameter("dosage");
            String pQuantity = request.getParameter("quantity");
            String pDuration = request.getParameter("duration");
            String pAction = request.getParameter("action");
            String pIllnessesId = request.getParameter("illness");
            String pAnalysisId = request.getParameter("analysis");

            InitialContext ic = new InitialContext();
            ExaminationFacadeLocal localExamination = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");
            DrugsFacadeLocal localDrugs = (DrugsFacadeLocal) ic.lookup("java:comp/env/ejb/DrugsRef");
            MeasureFacadeLocal localMeasure = (MeasureFacadeLocal) ic.lookup("java:comp/env/ejb/MeasureRef");
            TreatmentFacadeLocal localTreatment = (TreatmentFacadeLocal) ic.lookup("java:comp/env/ejb/TreatmentRef");
            IllnessesFacadeLocal localIllness = (IllnessesFacadeLocal) ic.lookup("java:comp/env/ejb/IllnessesRef");
            DiagnosisFacadeLocal localDiagnosis = (DiagnosisFacadeLocal) ic.lookup("java:comp/env/ejb/DiagnosisRef");
            LaboratoryReceptionFacadeLocal localLaboratoryReception = (LaboratoryReceptionFacadeLocal) ic.lookup("java:comp/env/ejb/LaboratoryReceptionRef");
            AnalysisFacadeLocal localAnalysis = (AnalysisFacadeLocal) ic.lookup("java:comp/env/ejb/AnalysisRef");

            Integer idExamination = null;

            Integer idDrug = null;
            Integer idMeasure = null;
            Double dosage = null;
            Double quantity = null;
            Integer duration = null;
            Integer idIllness = null;
            Integer idAnalysis = null;

            Examination examination = null;
            MedicalHistory history = null;
            Treatment newTreatment = null;
            Diagnosis newDiagnosis = null;
            Analysis newAnalysis = null;
            LaboratoryReception newLaboratoryReception = null;
            Drugs checkedDrug = null;
            Measure checkedMeasure = null;
            Illnesses checkedIllness = null;
            Analysis checkedAnalysis = null;

            Collection<Drugs> drugs = localDrugs.findAll();
            Collection<Measure> measures = localMeasure.findAll();
            Collection<Illnesses> illnesses = localIllness.findAll();
            Collection<Analysis> analyses = localAnalysis.findAll();

            Collection<Diagnosis> diagnosis = null;
            Collection<Treatment> treatments = null;
            Collection<LaboratoryReception> laboratoryReceptions = null;
            Doctor doctor = null;
            String doctorFIO = "";
            Date examinationDate = null;

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

            idExamination = Integer.valueOf(pExaminationId);
            examination = localExamination.find(idExamination);
            diagnosis = examination.getDiagnoses();
            treatments = examination.getTreatments();
            laboratoryReceptions = examination.getLaboratoryReceptios();
            doctor = examination.getIdDoctorReception().getIdDoctor();
            examinationDate = examination.getIdDoctorReception().getReceptionDate();
            doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
            history = examination.getIdDoctorReception().getIdMedicalHistory();

            if ("newTreatment".equals(pAction)) {
                if ("".equals(pDrugId) || "".equals(pMeasureId) || "".equals(pDosage) || "".equals(pQuantity) || "".equals(pDuration)) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields!
        </div>
        <%    } else {
            try {
                dosage = Double.valueOf(pDosage);
                quantity = Double.valueOf(pQuantity);
                duration = Integer.valueOf(pDuration);
                idDrug = Integer.valueOf(pDrugId);
                checkedDrug = localDrugs.find(idDrug);
                idMeasure = Integer.valueOf(pMeasureId);
                checkedMeasure = localMeasure.find(idMeasure);
                newTreatment = new Treatment(examination, checkedDrug, checkedMeasure, dosage, quantity, duration);
                localTreatment.create(newTreatment);
                checkedDrug.addTreatment(newTreatment);
                localDrugs.edit(checkedDrug);
                checkedMeasure.addTreatment(newTreatment);
                localMeasure.edit(checkedMeasure);
                examination.addTreatment(newTreatment);
                localExamination.edit(examination);
        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully prescribed new treatment!
        </div>
        <%
        } catch (NumberFormatException e) {
        %>
        <div class="alert  alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>Fields "quantity","duration","dosage" should be numeric. Check them.
        </div>
        <%
                }
            }}

            if ("newAnalysis".equals(pAction)) {
                if ("".equals(pAnalysisId)) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields!
        </div>
        <%    } else {
            idAnalysis = Integer.valueOf(pAnalysisId);
            checkedAnalysis = localAnalysis.find(idAnalysis);
            newLaboratoryReception = new LaboratoryReception(examination, checkedAnalysis);
            localLaboratoryReception.create(newLaboratoryReception);
            examination.addLaboratoryReception(newLaboratoryReception);
            localExamination.edit(examination);
            checkedAnalysis.addLaboratoryReception(newLaboratoryReception);
            localAnalysis.edit(checkedAnalysis);
        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully direct patient to new analysis!
        </div>
        <%                }
            }
            if ("newDiagnosis".equals(pAction)) {
                if ("".equals(pIllnessesId)) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields!
        </div>
        <%    } else {
            idIllness = Integer.valueOf(pIllnessesId);
            checkedIllness = localIllness.find(idIllness);
            newDiagnosis = new Diagnosis(examination, checkedIllness);
            localDiagnosis.create(newDiagnosis);
            checkedIllness.addDiagnosis(newDiagnosis);
            localIllness.edit(checkedIllness);
            examination.addDiagnosis(newDiagnosis);
            localExamination.edit(examination);

        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully made new diagnosis!
        </div>
        <%                }
            }
        %>
        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li <% if ("newAnalysis".equals(pAction) || (pAction == null)) {%> class="active"<%}%>><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Analysis</a></li>
                <li <% if ("newDiagnosis".equals(pAction)) {%> class="active"<%}%>><a href="#tab2" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Diagnosis</a></li>
                <li <% if ("newTreatment".equals(pAction)) {%> class="active"<%}%>><a href="#tab3" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Treatment</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane  <% if ("newAnalysis".equals(pAction) || (pAction == null)) {%>active<%}%>"   id="tab1">
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

                                    <td <% if (someLabReception.getAnalysisDate() == null) { %> class="text-warning"<%}%> ><% if (someLabReception.getAnalysisDate() != null) {
                                            out.print(sdf.format(someLabReception.getAnalysisDate()));
                                        } else {
                                            out.print("no record");
                                        }%></td>
                                    <td><%=someLabReception.getIdAnalysis().getAnalysisTitle()%></td>
                                    <td <% if (someLabReception.getAnalysisResult() == null) { %> class="text-warning"<%}%> ><% if (someLabReception.getAnalysisResult() != null) {
                                            out.print(someLabReception.getAnalysisResult());
                                        } else {
                                            out.print("no results");
                                        }%></td>
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
                        <div class="modal" id="newAnalysis" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Direct to analysis</h4>
                            </div>
                            <div>
                                <form class="form-horizontal" method="POST">
                                    <div class="modal-body">
                                        <div class="control-group">
                                            <label class="my-control-label" for="outputAnalysis">Analysis title                           
                                            </label>
                                            <div class="my-controls">
                                                <select id="outputAnalysis" name="analysis">
                                                    <% for (Analysis someAnalysis : analyses) {%>
                                                    <option value="<%=someAnalysis.getIdAnalysis()%>"><%=someAnalysis.getAnalysisTitle()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                        <button class="btn btn-primary" type="submit" name="action" value="newAnalysis">Save</button>
                                    </div>  </form>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="tab-pane  <% if ("newDiagnosis".equals(pAction)) {%>active<%}%>" id="tab2">
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
                        <div class="modal" id="newDiagnosis" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 id="myModalLabel">Making a diagnosis</h4>
                            </div><div>
                                <form class="form-horizontal" method="POST">
                                    <div class="modal-body">
                                        <div class="control-group">
                                            <label class="my-control-label" for="outputIllness">Illness                           
                                            </label>
                                            <div class="my-controls">
                                                <select id="outputIllness" name="illness">
                                                    <% for (Illnesses someIllness : illnesses) {%>
                                                    <option value="<%=someIllness.getIdIllness()%>"><%=someIllness.getIllnessesTitle()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                        <button class="btn btn-primary" type="submit" name="action" value="newDiagnosis">Save</button>
                                    </div></form>
                            </div> </div>
                    </div>
                </div>

                <div class="tab-pane <% if ("newTreatment".equals(pAction)) {%> active<%}%>" id="tab3">
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
                                    for (Treatment someTreatment : treatments) {

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
                                <h4 id="myModalLabel">Prescribing treatment</h4>
                            </div><div>
                                <form class="form-horizontal" method="POST">
                                    <div class="modal-body">
                                        <div class="alert alert-block">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <b>Attention! </b> All fields are mandatory.
                                        </div>
                                        <div class="control-group ">
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
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputDosage">Dosage                           
                                            </label>
                                            <div class="my-controls">
                                                <input type="text" id="outputDosage" name="dosage" required pattern="\d+(\.\d{1,2})?" title="integer/fractional (ex.: 1 or 1.0 or 1.00)">
                                            </div>
                                        </div>
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputMeasure">Measure                           
                                            </label>
                                            <div class="my-controls">
                                                <select id="outputMeasure" name="measure" >
                                                    <% for (Measure someMeasure : measures) {%>
                                                    <option value="<%=someMeasure.getIdMeasure()%>"><%=someMeasure.getMeasureTitle()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputQuantity">Quantity (times/day)                           
                                            </label>
                                            <div class="my-controls">
                                                <input type="text" id="outputQuantity" name="quantity" required pattern="^[0-9]+$"  title="only integer number">
                                            </div>
                                        </div>
                                        <div class="control-group ">
                                            <label class="my-control-label" for="outputDuration">Duration (days)                          
                                            </label>
                                            <div class="my-controls">
                                                <input type="text" id="outputDuration" name="duration" required pattern="^[0-9]+$"  title="only integer number">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal" aria-hidden="true" formnovalidate>Close</button>
                                        <button class="btn btn-primary" type="submit" name="action" value="newTreatment" >Save</button>
                                    </div>     </form>
                            </div> </div>


                    </div>
                </div >


            </div>
        </div>
    </body>
</html>
