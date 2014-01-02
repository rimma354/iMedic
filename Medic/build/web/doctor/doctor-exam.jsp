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
            String examinationID = request.getParameter("id");
            InitialContext ic = new InitialContext();
            ExaminationFacadeLocal localExamination = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");
            Integer id = null;
            Examination examination = null;
            Collection<Diagnosis> diagnosis = null;
            Collection<Treatment> treatment = null;
            Collection<LaboratoryReception> laboratoryReceptions = null;
            Doctor doctor=null;
            String doctorFIO="";
            Date examinationDate=null;
            if (examinationID != null) {
                id = Integer.valueOf(examinationID);
            }
            if (id != null) {
                examination = localExamination.find(id);
                diagnosis = examination.getDiagnoses();
                treatment = examination.getTreatments();
                laboratoryReceptions = examination.getLaboratoryReceptios();
                doctor=examination.getIdDoctorReception().getIdDoctor();
                examinationDate=examination.getIdDoctorReception().getReceptionDate();
                doctorFIO=doctor.getLastName()+" "+doctor.getFirstName()+" "+doctor.getPatronymic();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

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

                                <%
            for (LaboratoryReception someLabReception:laboratoryReceptions){
                                %>
                                <tr>
                                    <td><%=sdf.format(someLabReception.getAnalysisDate())%></td>
                                    <td><%=someLabReception.getIdAnalysis().getAnalysisTitle()%></td>
                                    <td><%=someLabReception.getAnalysisResult()%></td>
                                    <td><%=doctorFIO+", "+sdf.format(examinationDate)%></td>
                                </tr>
                                <%
            }
                                %>
                            </tbody>
                        </table>
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

                    </div >
                </div>
            </div>
        </div>

    </body>
</html>
