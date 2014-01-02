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
            Collection <MedicalHistory> medicalHistories=null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            String patientFIO = "";
            Integer id = null;
            if (patientId != null) {
                id = Integer.valueOf(patientId);
            }
            if (id != null) {
                patient = localPatient.find(id);
                card = patient.getIdMedicalCard();
                additionalInfos = card.getAdditionalInfos();
                medicalHistories=card.getMedicaHistories();
            }
            patientFIO = patient.getLastName() + " " + patient.getFirstName() + " " + patient.getPatronymic();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String birth = sdf.format(patient.getDateBirth());
        %>
        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Personal data</a></li>
                <li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Additional information</a></li>
                <li><a href="#tab3"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Medical histories</a></li>
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
                        <form class="form-horizontal">
                            <div class="row">
                                <div class="span8 "style="margin-left: 200px;">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputChronicDiseases" >Chronic illness</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputChronicDiseases" readonly placeholder="<%
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
                                                for (AdditionalInfo someInfo : additionalInfos) {
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
    <table  class="table table-hover">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>History type</th>
                    <th>Opening date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>

                <%
                    for (MedicalHistory someHistory : medicalHistories) {
                %>
                <tr>
                    <td><%= someHistory.getDescription()%></td>
                    <td><%= someHistory.getIdHistoryType().getTypeTitle()%></td>
                    <td></td>
                    <td> <a href="doctor-history.jsp?id=<%=someHistory.getIdMedicalHistory()%>">View</a> </td>
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