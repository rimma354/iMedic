<%@page import="com.medic.entity.Laboratory"%>
<%@page import="com.medic.entity.Diagnosis"%>
<%@page import="com.medic.facade.local.DiagnosisFacadeLocal"%>
<%@page import="com.medic.entity.Doctor"%>
<%@page import="com.medic.facade.local.LaboratoryReceptionFacadeLocal"%>
<%@page import="com.medic.entity.LaboratoryReception"%>
<%@page import="com.medic.entity.MedicalHistory"%>
<%@page import="com.medic.facade.local.MedicalHistoryFacadeLocal"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.entity.AdditionalInfo"%>
<%@page import="com.medic.facade.local.AdditionalInfoFacadeLocal"%>
<%@page import="com.medic.entity.MedicalCard"%>
<%@page import="com.medic.facade.local.MedicalCardFacadeLocal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.medic.entity.Patient"%>
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
                <h3>Medical card</h3>
            </header>
        </div>
        <%
            String patientId = request.getParameter("id");
            Patient patient = null;
            MedicalCard card = null;
            Collection<AdditionalInfo> additionalInfos = null;
            Collection<MedicalHistory> medicalHistories = null;
            Collection<LaboratoryReception> laboratoryReceptions = null;
            Collection<Diagnosis> diagnosis = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            LaboratoryReceptionFacadeLocal localLabRec = (LaboratoryReceptionFacadeLocal) ic.lookup("java:comp/env/ejb/LaboratoryReceptionRef");
            DiagnosisFacadeLocal localDiagnosis = (DiagnosisFacadeLocal) ic.lookup("java:comp/env/ejb/DiagnosisRef");
            Date examinationDate;
            Date analysisDate;
            String analysisDateStr;
            String analysisResult;
            String analysisTitle;
            Integer labRecId;
            Doctor doctor;
            Laboratory laboratory;
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String patientFIO = "";
            String doctorFIO = "";
            String laboratoryStr = " ";
            String birth = null;
            Integer id = null;
            if (patientId != null) {
                if (!"".equals(patientId)) {
                    id = Integer.valueOf(patientId);
                    patient = localPatient.find(id);
                    if (patient == null) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            Patient with such ID doesn't exist! <a href="doctor-search.jsp">Return back </a> and enter right ID.
        </div>
        <%
        } else {
            card = patient.getIdMedicalCard();
            if (card != null) {
                additionalInfos = card.getAdditionalInfos();
                medicalHistories = card.getMedicaHistories();
                laboratoryReceptions = localLabRec.findByIdCard(card);
                diagnosis = localDiagnosis.findByIdCard(card);
                patientFIO = patient.getLastName() + " " + patient.getFirstName() + " " + patient.getPatronymic();
                birth = sdf.format(patient.getDateBirth());

            }

        %>
        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" >Personal data</a></li>
                <li><a href="#tab2"data-toggle="tab" >Additional information</a></li>
                <li><a href="#tab3"data-toggle="tab" >Medical histories</a></li>
                <li><a href="#tab4"data-toggle="tab" >Analysis</a></li>
                <li><a href="#tab5"data-toggle="tab" >Diagnosis</a></li>

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
                                            <input type="text" id="outputFIO" readonly placeholder="<%=patientFIO%>">
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
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th width="20%">Factor</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Blood group</td>
                                    <td>
                                        <%
                                            for (AdditionalInfo someInfo : additionalInfos) {
                                                if (someInfo.getIdGroupInfo().getIdGroupInfo() == 2) {
                                                    out.print(someInfo.getDescription());
                                                }
                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>RH factor</td>
                                    <td> 
                                        <%
                                            for (AdditionalInfo someInfo : additionalInfos) {
                                                if (someInfo.getIdGroupInfo().getIdGroupInfo() == 5) {
                                                    out.print(someInfo.getDescription());
                                                }
                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr><td>Chronic illness</td><td><%
                                    for (AdditionalInfo someInfo : additionalInfos) {
                                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 3) {
                                            out.print(someInfo.getDescription() + "; ");
                                        }
                                    }
                                        %></td></tr>
                                <tr><td>Allergies</td><td><%
                                    for (AdditionalInfo someInfo : additionalInfos) {
                                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 1) {
                                            out.print(someInfo.getDescription() + "; ");
                                        }
                                    }
                                        %></td></tr>
                                <tr><td>Drug intolerance</td><td><%
                                    for (AdditionalInfo someInfo : additionalInfos) {
                                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 4) {
                                            out.print(someInfo.getDescription() + "; ");
                                        }
                                    }
                                        %></td></tr>
                                <tr><td>Vaccinations</td><td><%
                                    for (AdditionalInfo someInfo : additionalInfos) {
                                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 6) {
                                            out.print(someInfo.getDescription() + "; ");
                                        }
                                    }
                                        %></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane" id="tab3">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th width="13%">Opening date</th>
                                    <th width="15%">History type</th>
                                    <th>Description</th>
                                    <th  width="5%"></th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (MedicalHistory someHistory : medicalHistories) {
                                %>
                                <tr>
                                    <td><%= sdf.format(someHistory.getOpenningDate())%> </td>
                                    <td><%= someHistory.getIdHistoryType().getTypeTitle()%></td>
                                    <td><%= someHistory.getDescription()%></td>
                                    <td> <a href="doctor-history.jsp?id=<%=someHistory.getIdMedicalHistory()%>">View</a> </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div >
                </div>
                <div class="tab-pane" id="tab4">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th width="13%">Date</th>
                                    <th width="18%">Laboratory</th>
                                    <th width="25%">Title</th>
                                    <th>Result</th>
                                    <th width="30%">Appointment card</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                    for (LaboratoryReception someLabReception : laboratoryReceptions) {
                                        labRecId = someLabReception.getIdLaboratoryReception();
                                        laboratory = someLabReception.getIdLaboratory();
                                        if (laboratory != null) {
                                            laboratoryStr = laboratory.getLabTitle();
                                        } else {
laboratoryStr = "no record";
                                        }
                                        analysisDate = someLabReception.getAnalysisDate();
                                        analysisResult = someLabReception.getAnalysisResult();
                                        examinationDate = someLabReception.getIdExamination().getIdDoctorReception().getReceptionDate();
                                        doctor = someLabReception.getIdExamination().getIdDoctorReception().getIdDoctor();
                                        doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                                        if (analysisDate != null) {
                                            analysisDateStr = sdf.format(analysisDate);
                                        } else {
                                            analysisDateStr = "no record";
                                        }
                                        analysisTitle = someLabReception.getIdAnalysis().getAnalysisTitle();%>
                            <div class="modal" id="result<%=labRecId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h5 id="myModalLabel">Result of "<%=analysisTitle%>", by <%=analysisDateStr%></h5>
                                </div>
                                <div class="modal-body">
                                    <p><%=analysisResult%></p>
                                </div>
                            </div>
                            <tr>

                                <td <% if (analysisDate == null) { %> class="text-warning"<%}%> >
                                    <%=analysisDateStr%></td>
                                <td  <% if (laboratory == null) { %> class="text-warning"<%}%>><%=laboratoryStr%></td>
                                <td><%=analysisTitle%></td>
                                <td <% if (analysisResult == null) { %> class="text-warning"<%}%> ><% if (analysisResult != null) {%>
                                    <a href="#result<%=labRecId%>"  data-toggle="modal">view result</a>
                                    <% } else {
                                            out.print("no results");
                                        }%></td>
                                <td><%=doctorFIO + ", " + sdf.format(examinationDate)%></td>
                            </tr>

                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div >
                </div>
                <div class="tab-pane" id="tab5">
                    <div class="container" >
                        <table  class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Diagnosis</th>
                                    <th width="13%">Date</th>
                                    <th width=25%>Doctor</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%                                    for (Diagnosis someDiagnosis : diagnosis) {
                                        doctor = someDiagnosis.getIdExamination().getIdDoctorReception().getIdDoctor();
                                        doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                                        doctorFIO = doctor.getLastName() + " " + doctor.getFirstName() + " " + doctor.getPatronymic();
                                        examinationDate = someDiagnosis.getIdExamination().getIdDoctorReception().getReceptionDate();

                                %>
                                <tr>
                                    <td><%=someDiagnosis.getIdIllnesses().getIllnessesTitle()%></td>
                                    <td><%=sdf.format(examinationDate)%></td>
                                    <td><%=doctorFIO%></td>
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
        <% }
        } else {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            Your should fill in field before searching! <a href="doctor-search.jsp">Return back </a> and enter ID.
        </div>
        <%
                }
            }%>
    </body>
</html>