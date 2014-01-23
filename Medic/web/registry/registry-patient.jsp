<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.medic.facade.local.DoctorReceptionFacadeLocal"%>
<%@page import="com.medic.entity.DoctorReception"%>
<%@page import="com.medic.facade.local.WorkTimeFacadeLocal"%>
<%@page import="com.medic.entity.WorkTime"%>
<%@page import="com.medic.facade.local.DoctorFacadeLocal"%>
<%@page import="com.medic.entity.Doctor"%>
<%@page import="com.medic.entity.HistoryType"%>
<%@page import="com.medic.facade.local.HistoryTypeFacadeLocal"%>
<%@page import="com.medic.facade.local.MedicalHistoryFacadeLocal"%>
<%@page import="com.medic.entity.Examination"%>
<%@page import="com.medic.facade.local.GroupInfoFacadeLocal"%>
<%@page import="com.medic.entity.GroupInfo"%>
<%@page import="com.medic.facade.local.CardStateFacadeLocal"%>
<%@page import="com.medic.entity.CardState"%>
<%@page import="com.medic.facade.local.SexFacadeLocal"%>
<%@page import="java.util.Date"%>
<%@page import="com.medic.entity.Sex"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.medic.entity.MedicalHistory"%>
<%@page import="com.medic.facade.local.AdditionalInfoFacadeLocal"%>
<%@page import="com.medic.facade.local.MedicalCardFacadeLocal"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Collection"%>
<%@page import="com.medic.entity.AdditionalInfo"%>
<%@page import="com.medic.entity.MedicalCard"%>
<%@page import="com.medic.entity.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
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
            String outputChronic = request.getParameter("chronic");
            String outputDrug = request.getParameter("drug");
            String outputAllergy = request.getParameter("allergy");
            String outputVaccination = request.getParameter("vaccination");
            String outputBlood = request.getParameter("blood");
            String outputRH = request.getParameter("RH");
            request.getParameterNames();
            Patient patient = null;
            MedicalCard card = null;
            Collection<AdditionalInfo> additionalInfos = null;
            Collection<MedicalHistory> medicalHistories = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            MedicalCardFacadeLocal localMedicalCard = (MedicalCardFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalCardRef");
            Integer id = null;
            String birth = "";
            String chronic = "";
            String drug = "";
            String allergy = "";
            String vaccination = "";
            String blood = "";
            String RH = "";

            if (patientId != null) {
                id = Integer.valueOf(patientId);
            }
            if (id != null) {
                patient = localPatient.find(id);
                card = patient.getIdMedicalCard();
                additionalInfos = card.getAdditionalInfos();
                medicalHistories = card.getMedicaHistories();

                for (AdditionalInfo someInfo : additionalInfos) {
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 1) {
                        allergy = someInfo.getDescription();
                    }
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 2) {
                        blood = someInfo.getDescription();
                    }
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 3) {
                        chronic = someInfo.getDescription();
                    }
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 4) {
                        drug = someInfo.getDescription();
                    }
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 5) {
                        RH = someInfo.getDescription();
                    }
                    if (someInfo.getIdGroupInfo().getIdGroupInfo() == 6) {
                        vaccination = someInfo.getDescription();
                    }
                }

                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                birth = sdf.format(patient.getDateBirth());
            }
            String action = request.getParameter("action");
            String idPatient = request.getParameter("idPatient");
            String cardMedical = request.getParameter("card");
            String sex = request.getParameter("sex");
            String outputNumber = request.getParameter("number");
            String outputBirth = request.getParameter("date");
            String lastName = request.getParameter("last");
            String firstName = request.getParameter("first");
            String patronymic = request.getParameter("patronymic");
            String outputTel = request.getParameter("tel");
            String outputAddress = request.getParameter("address");
            String outputPassport = request.getParameter("passport");

            int intPatient = 0;
            int intCard = 0;
            Sex idSex = null;
            if (patientId != null) {
                intPatient = Integer.parseInt(patientId);
            }
            patient = localPatient.find(id);

            if (patient != null) {
                intCard = patient.getIdMedicalCard().getIdMedicalCard();
            }

            int intSex = 0;
            Date dateBirth = new Date();

            if ((sex != null) && (sex != "")) {
                if (sex.equals("Male")) {
                    intSex = 1;
                } else {
                    intSex = 2;
                }
                SexFacadeLocal localSex = (SexFacadeLocal) ic.lookup("java:comp/env/ejb/SexRef");
                idSex = localSex.find(intSex);
            }
            if ((sex == "") || (outputNumber == "") || (outputBirth == "") || (lastName == "") || (firstName == "") || (patronymic == "") || (outputTel == "") || (outputPassport == "") || (outputBirth == "dd.mm.yyyy")) {

        %>

        <div class="alert alert-block">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Alert!</h4>
            Best check your self, you're not completed all the required fields!!!
        </div>

        <%            } else {
            if ("edit".equals(action)) {
                if ((outputBirth != null) && (!"".equals(outputBirth)) && (!"dd-mm-yyyy".equals(outputBirth))) {
                    SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                    dateBirth = format.parse(outputBirth);
                }

                if ((idSex != null)) {
                    patient = localPatient.find(intPatient);
                    patient.setDateBirth(dateBirth);
                    patient.setFirstName(firstName);
                    patient.setLastName(lastName);
                    patient.setPatronymic(patronymic);
                    patient.setIdSex(idSex);
                    patient.setTelephone(outputTel);
                    patient.setPassport(outputPassport);
                    patient.setInsuranceNumber(outputNumber);
                    localPatient.edit(patient);

        %>

        <div class="alert alert-block">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Attention!</h4>
            Edited a new Patient - <%= patient.getLastName()%> <%= patient.getFirstName()%> <%= patient.getPatronymic()%> 
            <%= patient.getIdSex()%> <%= patient.getDateBirth()%> <%= patient.getTelephone()%> <%= patient.getPassport()%> <%= patient.getInsuranceNumber()%>
        </div>  
        <%
                    }
                }

                int idState = 1;
                CardState cardState = null;
                CardStateFacadeLocal localCard = (CardStateFacadeLocal) ic.lookup("java:comp/env/ejb/CardStateRef");
                cardState = localCard.find(idState);
                MedicalCard cardNew = localMedicalCard.find(intCard);
                Collection<AdditionalInfo> additionalInfosNew = null;

                AdditionalInfo addInfoNewChronic = null;
                AdditionalInfoFacadeLocal localaddInfo = (AdditionalInfoFacadeLocal) ic.lookup("java:comp/env/ejb/AdditionalInfoRef");
                if ((cardNew != null) && (outputChronic != null) && (outputChronic
                        != "")) {

                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 3) {
                            out.print(someInfo.getDescription());
                            addInfoNewChronic = someInfo;
                            addInfoNewChronic.setIdMEdicalCard(cardNew);

                            if (addInfoNewChronic != null) {
                                localaddInfo.edit(addInfoNewChronic);
                            }
                        }
                    }
                }

                AdditionalInfo addInfoNewDrug = null;
                if ((cardNew != null) && (outputDrug != null) && (outputDrug
                        != "")) {
                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 4) {
                            out.print(someInfo.getDescription());
                            addInfoNewDrug = someInfo;
                            addInfoNewDrug.setIdMEdicalCard(cardNew);

                            if (addInfoNewDrug != null) {
                                localaddInfo.edit(addInfoNewDrug);
                            }
                        }
                    }
                }

                AdditionalInfo addInfoNewAllergy = null;
                if ((cardNew != null) && (outputAllergy != null) && (outputAllergy
                        != "")) {
                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 1) {
                            out.print(someInfo.getDescription());
                            addInfoNewAllergy = someInfo;
                            addInfoNewAllergy.setIdMEdicalCard(cardNew);

                            if (addInfoNewAllergy != null) {
                                localaddInfo.edit(addInfoNewAllergy);
                            }
                        }
                    }
                }

                AdditionalInfo addInfoNewVaccination = null;

                if ((cardNew != null) && (outputVaccination != null) && (outputVaccination
                        != "")) {
                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 6) {
                            out.print(someInfo.getDescription());
                            addInfoNewVaccination = someInfo;
                            addInfoNewVaccination.setIdMEdicalCard(cardNew);

                            if (addInfoNewVaccination != null) {
                                localaddInfo.edit(addInfoNewVaccination);
                            }
                        }
                    }
                }

                AdditionalInfo addInfoNewBlood = null;
                if ((cardNew != null) && (outputBlood != null) && (outputBlood
                        != "")) {
                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 2) {
                            out.print(someInfo.getDescription());
                            addInfoNewBlood = someInfo;
                            addInfoNewBlood.setIdMEdicalCard(cardNew);

                            if (addInfoNewBlood != null) {
                                localaddInfo.edit(addInfoNewBlood);
                            }
                        }
                    }
                }

                AdditionalInfo addInfoNewRH = null;
                if ((cardNew != null) && (outputRH != null) && (outputRH
                        != "")) {
                    additionalInfosNew = cardNew.getAdditionalInfos();
                    for (AdditionalInfo someInfo : additionalInfos) {
                        if (someInfo.getIdGroupInfo().getIdGroupInfo() == 5) {
                            out.print(someInfo.getDescription());
                            addInfoNewRH = someInfo;
                            addInfoNewRH.setIdMEdicalCard(cardNew);

                            if (addInfoNewRH != null) {
                                localaddInfo.edit(addInfoNewRH);
                            }
                        }
                    }
                }
            }

            Collection<MedicalHistory> history = null;
            Collection<HistoryType> types = null;
            MedicalHistoryFacadeLocal localHistory = (MedicalHistoryFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalHistoryRef");

            HistoryTypeFacadeLocal localHistoryType = (HistoryTypeFacadeLocal) ic.lookup("java:comp/env/ejb/HistoryTypeRef");
            types = localHistoryType.findAll();
            history = localHistory.findAll();
            String historyDescription = "";
            MedicalCard idMedicalCard = null;
            HistoryType idHistoryT = null;
            int idHistoryType = 0;
            String typeTitle = "";
            int idMedicalHistory = 0;
            String historyS = "";

            if ("save".equals(action)) {
                patient = localPatient.find(intPatient);
                idMedicalCard = patient.getIdMedicalCard();

                String outputHysType = request.getParameter("type");
                String outputDesc = request.getParameter("description");

                int intHysType = 0;

                if (outputHysType != null) {
                    intHysType = Integer.parseInt(outputHysType);
                }
                idHistoryT = localHistoryType.find(intHysType);
                if ("".equals(outputDesc) || "null".equals(idMedicalCard) || "null".equals(idHistoryT)) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields!
        </div>
        <%    } else {

            MedicalHistory medicalHistory = new MedicalHistory(idMedicalCard, idHistoryT, outputDesc);
            localHistory.create(medicalHistory);
            history = localHistory.findAll();
            idHistoryT.addMedicalHistory(history);
            localHistoryType.edit(idHistoryT);
            idMedicalCard.addMedicalHistory(medicalHistory);
            localMedicalCard.edit(idMedicalCard);

        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully added new Medical History!
        </div>
        <%            }
            }

            Collection<Doctor> doctors = null;
            DoctorFacadeLocal localDoctor = (DoctorFacadeLocal) ic.lookup("java:comp/env/ejb/DoctorRef");
            doctors = localDoctor.findAll();
            Collection<DoctorReception> receptions = null;
            DoctorReception newReception = null;
            DoctorReceptionFacadeLocal localReception = (DoctorReceptionFacadeLocal) ic.lookup("java:comp/env/ejb/DoctorReceptionRef");

            int idWorkTime = 0;
            Date dateMeet = new Date();
            String outputDateMeet = request.getParameter("date");
            if ("saveRec".equals(action)) {
                if ((outputDateMeet != null) && (!"".equals(outputDateMeet)) && (!"dd.mm.yyyy".equals(outputDateMeet))) {
                    SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
                    dateMeet = format.parse(outputDateMeet);
                }
                String outputTime = request.getParameter("time");
                if ((outputTime != null) && (outputTime != "")) {
                    idWorkTime = Integer.parseInt(outputTime);
                }
                int idHistoryNew = 0;
                int idDoctorNew = 0;
                Doctor idDoctor = null;
                MedicalHistory idNewHis = null;

                String outputIdHys = request.getParameter("historyS");
                idHistoryNew = Integer.parseInt(outputIdHys);
                idNewHis = localHistory.find(idHistoryNew);
                String outputIdDoctor = request.getParameter("doctors");
                idDoctorNew = Integer.parseInt(outputIdDoctor);
                idDoctor = localDoctor.find(idDoctorNew);

                dateMeet.setHours(idWorkTime);
                if ((idNewHis == null) || (idDoctor == null) || (outputDateMeet == "") || (outputDateMeet == "dd-mm-yyyy")) {
        %>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
            You didn't complete all required fields!
        </div>
        <%    } else {
            newReception = new DoctorReception(idNewHis, idDoctor, dateMeet);
            localReception.create(newReception);
            idNewHis.addDoctorReception(newReception);
            localHistory.edit(idNewHis);
            idDoctor.addDoctorReception(newReception);
            localDoctor.edit(idDoctor);

        %>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            You successfully added new Doctor Reception!
        </div>
        <%
                }
            }
        %> 

        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li <% if (action == null) {%> class="active"<%}%>><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Personal data</a></li>
                <li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Additional information</a></li>
                <li <% if (("saveRec".equals(action)) || ("save".equals(action)) || ("check".equals(action))) {%> class="active"<%}%> ><a href="#tab3"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Record to doctor</a></li>
                <li><a href="#tab4"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Record to laboratory</a></li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane  <% if (action == null) {%> active <%}%>" id="tab1">

                    <div class="container" >
                        <form class="form-horizontal">
                            <div class="row">
                                <div class="span4">
                                    <img src="../resources/img/foto.png" style="width:140px; heigth:140px;">
                                    <input type="hidden" name="id" value="<%=id%>">
                                    <div>
                                        <label class="my-control-label" for="idPatient" >ID</label>
                                        <input type="text" name="idPatient" id="idPatient" value="<%= patient.getIdPatient()%>">
                                    </div>
                                    <div>
                                        <label class="my-control-label" for="card" >Card</label>
                                        <input type="text" name="card" id="card" value="<%= patient.getIdMedicalCard().getIdMedicalCard()%>">
                                    </div>	
                                    <div>
                                        <label class="my-control-label" for="card" >Card state</label>
                                        <input type="text" id="card" value="<%= patient.getIdMedicalCard().getIdState().getStateTitle()%>">
                                    </div>	
                                    <div>
                                        <label class="my-control-label" for="sex" >Sex</label>
                                        <input type="text" name="sex" id="sex" value="<%= patient.getIdSex().getSexTitle()%>">
                                    </div>
                                </div>
                                <div class="span8 ">
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputNumber" >Medical insurance number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputNumber" name="number" value="<%= patient.getInsuranceNumber()%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputBirth">Date of birth</label>
                                        <div class="my-controls">
                                            <input type="text" name="date" id="outputBirth" value="<%= birth%>"/>
                                            <p> <script type="text/javascript" /> calendar.set("outputBirth"); </script/></p>
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputLast">Last name</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputLast" name="last" value="<%=patient.getLastName()%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputFirst">First name</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputFirst" name="first" value="<%=patient.getFirstName()%>">
                                        </div>
                                    </div> 
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputPatronymic">Patronymic</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputPatronymic" name="patronymic" value="<%=patient.getPatronymic()%>">
                                        </div>
                                    </div>    
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputTel">Telephone number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputTel"  name="tel" value="<%= patient.getTelephone()%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputPassport">Passport number</label>
                                        <div class="my-controls">
                                            <input type="text" id="outputPassport"  name="passport" value="<%= patient.getPassport()%>">
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="edit" class="btn">Edit</button>    
                                </div>
                            </div>
                        </form>
                    </div >
                </div>
                <div class="tab-pane" id="tab2">
                    <div class="container" >
                        <form class="form-horizontal" method="POST">
                            <div class="row">
                                <div class="span8" style="margin-left: 200px;">

                                    <input type="hidden" name="id" value="<%=id%>">

                                    <div class="control-group">
                                        <label class ="my-control-label" for="outputChronicDiseases" >Chronic illness</label>
                                        <div class ="my-controls">
                                            <input type="text" name="chronic" id="outputChronicDiseases" value="<%=chronic%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputDrugIntolerance">Drug intolerance</label>
                                        <div class="my-controls">
                                            <input type="text" name="drug" id="outputDrugIntolerance" value="<%=drug%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputAllergy">Allergies</label>
                                        <div class="my-controls">
                                            <input type="text" name="allergy" id="outputAllergy" value="<%=allergy%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputVaccinations">Vaccinations</label>
                                        <div class="my-controls">
                                            <input type="text" name="vaccination" id="outputVaccinations" value="<%=vaccination%>">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="outputBloodGroup">Blood group</label>
                                        <div class="my-controls">
                                            <input type="text" name="blood" id="outputBloodGroup" value="<%=blood%>">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="my-control-label" for="outputRHFactor">RH factor</label>
                                        <div class="my-controls">
                                            <input type="text" name="RH" id="outputRHFactor" value="<%=RH%>">
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="edit" class="btn">Edit</button> 
                                </div>
                            </div>
                        </form>
                    </div >
                </div>


                <div class="tab-pane <% if (("saveRec".equals(action)) || ("save".equals(action)) || ("check".equals(action))) {%> active<%}%>" id="tab3">
                    <div class="container">
                        <form class="form-horizontal" action="">
                            <div class="row">
                                <div class="span8 " style="margin-left: 200px;">
                                    <center>
                                        <input type="hidden" name="id" value="<%=id%>">
                                        <h3>Making an appointment to see a doctor</h3>
                                        <br></br>


                                        <div class="modal-body">
                                            <div class="control-group">
                                                <label class="my-control-label" for="outputHistory">Medical history</label>
                                                <div class="my-controls">
                                                    <input type="text" id="outputHistory" name="historyS" readonly style="width: 200px;" value="<%=request.getParameter("docRec")%>">
                                                    <a href="#ckechAppointment" role="button" class="btn" data-toggle="modal">...</a>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="modal" id="ckechAppointment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" <%if (!"save".equals(action)) {%> style="display: none;"<%}%>>
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 id="myModalLabel">Check appointment</h4>
                                            </div>
                                            <form class="form-horizontal" method="POST">
                                                <%                                    for (MedicalHistory someHistory : history) {
                                                        if (someHistory.getIdMedicalCard().getIdPatient().getIdPatient() == patient.getIdPatient()) {
                                                            historyDescription = someHistory.getDescription();
                                                            idMedicalHistory = someHistory.getIdMedicalHistory();

                                                %>
                                                <div class="control-group">
                                                    <label class="my-control-label" for="outputHistoryM" style="width:500px;">
                                                        <%=historyDescription%>
                                                    </label>
                                                    <div class="my-controls">
                                                        <input type ="radio" id="outputHistoryM" name="docRec" value="<%=idMedicalHistory%>">
                                                    </div>
                                                </div>
                                                <%}
                                                    }%>
                                                <div class="modal-footer">
                                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                                    <button class="btn btn-primary" name="action" value="check" >Check</button>
                                                    <a href="#newHis" role="button" class="btn btn-primary" data-toggle="modal">New history</a>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="modal" id="newHis" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 id="myModalLabel">Creating new history</h4>
                                            </div>
                                            <form class="form-horizontal" method="POST">
                                                <div class="modal-body">
                                                    <div class="control-group">
                                                        <label class="my-control-label" for="outputHistoryN">Types of Hystory</label>

                                                        <select name="type">
                                                            <%                                                                for (HistoryType someType : types) {
                                                                    idHistoryType = someType.getIdHistoryType();
                                                            %>

                                                            <option value="<%=someType.getIdHistoryType()%>"><%=someType.getTypeTitle()%> </option>
                                                            <%
                                                                }
                                                            %>   
                                                        </select>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="my-control-label" for="outputDescription">Description</label>
                                                        <div class="my-controls">
                                                            <textarea rows="5" id="outputDescription" name="description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                                    <button type="submit" name="action" value="save" class="btn btn-primary">Save</button>
                                                </div>
                                            </form>

                                        </div>        
                                        <div class="control-group">
                                            <label class="my-control-label" for="outputDoctors">Doctors</label>

                                            <select name="doctors">
                                                <%                                                                for (Doctor someDoctor : doctors) {
                                                        idHistoryType = someDoctor.getIdDoctor();
                                                %>

                                                <option value="<%=someDoctor.getIdDoctor()%>"><%=someDoctor.getLastName()%> </option>
                                                <%
                                                    }
                                                %>   
                                            </select>
                                        </div>
                                        <div class="control-group">  
                                            <label class="my-control-label" for="dateMeet">Date of appointment</label>
                                            <input type="text" name="date" id="dateMeet" value="dd-mm-yyyy" />
                                            <p> <script type="text/javascript"> calendar.set("dateMeet");</script></p>
                                        </div>
                                        <div class="control-group">  
                                            <label class="my-control-label" for="outputTime">Time of appointment</label> 

                                            <select name="time" id="outputTime">
                                                <%--                         <%                                                                for (WorkTime someWorkTime : workTime) {
                                                        idWorkTime = someWorkTime.getIdTime();
                                                %>

                                            <option value="<%=someWorkTime.getIdTime()%>"><%=someWorkTime.getWorkTime()%> </option>
                                            <%
                                                }
                                            %>   ---%>

                                                <option value="8">8-00</option>
                                                <option value="9">9-00</option>
                                                <option value="10">10-00</option>
                                                <option value="11">11-00</option>
                                                <option value="12">12-00</option>
                                                <option value="13">13-00</option>
                                                <option value="14">14-00</option>
                                                <option value="15">15-00</option>
                                                <option value="16">16-00</option>
                                                <option value="17">17-00</option>
                                                <option value="18">18-00</option>
                                            </select>
                                        </div>

                                        <button type="submit" name="action" value="saveRec" class="btn btn-primary">Save</button>

                                    </center>
                                </div>
                            </div>
                        </form>              
                    </div >
                </div>


                <div class="tab-pane" id="tab4">
                    <div class="container" >
                        <form class="form-horizontal" action="">
                            <div class="row">
                                <div class="span8 " style="margin-left: 200px;">
                                    <center>
                                        <h3>Making an appointment to see a laboratory</h3>
                                        <br></br>
                                        <%
                                        %>                               


                                    </center>
                                </div>
                            </div>
                        </form>               
                    </div>
                </div>
            </div>
        </div>                            
    </body>
</html>