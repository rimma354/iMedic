<%@page import="com.medic.facade.local.GroupInfoFacadeLocal"%>
<%@page import="com.medic.entity.GroupInfo"%>
<%@page import="com.medic.facade.local.AdditionalInfoFacadeLocal"%>
<%@page import="com.medic.entity.AdditionalInfo"%>
<%@page import="com.medic.facade.AdditionalInfoFacade"%>
<%@page import="com.medic.entity.CardState"%>
<%@page import="com.medic.facade.local.CardStateFacadeLocal"%>
<%@page import="com.medic.facade.local.MedicalCardFacadeLocal"%>
<%@page import="com.medic.entity.MedicalCard"%>
<%@page import="com.medic.entity.Sex"%>
<%@page import="com.medic.facade.local.SexFacadeLocal"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
<%@page import="com.medic.entity.Patient"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
            String action = request.getParameter("action");
            InitialContext ic = new InitialContext();
            String card = request.getParameter("card");
            String sex = request.getParameter("sex");
            String outputNumber = request.getParameter("number");
            String outputBirth = request.getParameter("date");
            String lastName = request.getParameter("last");
            String firstName = request.getParameter("first");
            String patronymic = request.getParameter("patronymic");
            String outputTel = request.getParameter("tel");
            String outputAddress = request.getParameter("address");
            String outputPassport = request.getParameter("passport");

            String chronic = request.getParameter("chronic");
            String drug = request.getParameter("drug");
            String allergy = request.getParameter("allergy");
            String vaccination = request.getParameter("vaccination");
            String blood = request.getParameter("blood");
            String outputRH = request.getParameter("RH");

            SexFacadeLocal localSex = (SexFacadeLocal) ic.lookup("java:comp/env/ejb/SexRef");

            Sex idSex = null;
            int idPatient = 0;
            int intSex = 0;

            Date dateBirth = new Date();
            if ((card != null) && (card != "")) {
            }
            if ((sex != null) && (sex != "")) {
                if (sex.equals("Male")) {
                    intSex = 1;
                } else {
                    intSex = 2;
                }
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

            if ((outputBirth != null) && (outputBirth != "") && (outputBirth != "dd.mm.yyyy")) {
                SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
                dateBirth = format.parse(outputBirth);
            }
            Patient patient = null;
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");

            if ("save".equals(action)) {
                if ((idSex != null)) {
                    patient = new Patient.Builder(lastName, firstName, patronymic, idSex, dateBirth, outputTel, outputPassport, outputNumber).build();
                    localPatient.create(patient);
                    idSex.addPatient(patient);
                    localSex.edit(idSex);


        %>

        <div class="alert alert-block">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Attention!</h4>
            Added a new Patient - <%= patient.getLastName()%> <%= patient.getFirstName()%> <%= patient.getPatronymic()%> 
            <%= patient.getIdSex()%> <%= patient.getDateBirth()%> <%= patient.getTelephone()%> <%= patient.getPassport()%> <%= patient.getInsuranceNumber()%>
        </div>  
        <%
                    }
                }
                MedicalCard cardNew = null;
                MedicalCardFacadeLocal localMedicalCard = (MedicalCardFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalCardRef");
                int idState = 1;
                CardState cardState = null;
                CardStateFacadeLocal localCard = (CardStateFacadeLocal) ic.lookup("java:comp/env/ejb/CardStateRef");
                cardState = localCard.find(idState);

                if ("save".equals(action)) {
                    cardNew = new MedicalCard(patient, cardState);
                    localMedicalCard.create(cardNew);
                    patient.setIdMedicalCard(cardNew);
                    localPatient.edit(patient);
                }

                int idGroupInfoChronic = 3;
                GroupInfo groupInfoChronic = null;
                GroupInfoFacadeLocal localGroupInfo = (GroupInfoFacadeLocal) ic.lookup("java:comp/env/ejb/GroupInfoRef");
                groupInfoChronic = localGroupInfo.find(idGroupInfoChronic);
                AdditionalInfo addInfoNewChronic = null;
                AdditionalInfoFacadeLocal localaddInfo = (AdditionalInfoFacadeLocal) ic.lookup("java:comp/env/ejb/AdditionalInfoRef");
                if ((cardNew != null) && (chronic != null) && (chronic
                        != "")) {
                    addInfoNewChronic = new AdditionalInfo(cardNew, groupInfoChronic, chronic);
                    if (addInfoNewChronic != null) {
                        localaddInfo.create(addInfoNewChronic);
                        groupInfoChronic.addAdditionalInfo(addInfoNewChronic);
                        localGroupInfo.edit(groupInfoChronic);
                        cardNew.addMAdditionalInfo(addInfoNewChronic);
                        localMedicalCard.edit(cardNew);

                    }
                }
                int idGroupInfoDrug = 4;
                GroupInfo groupInfoDrug = null;
                groupInfoDrug = localGroupInfo.find(idGroupInfoDrug);
                AdditionalInfo addInfoNewDrug = null;
                if ((cardNew != null) && (drug != null) && (drug
                        != "")) {
                    addInfoNewDrug = new AdditionalInfo(cardNew, groupInfoDrug, drug);
                    if (addInfoNewDrug != null) {
                        localaddInfo.create(addInfoNewDrug);
                        groupInfoDrug.addAdditionalInfo(addInfoNewDrug);
                        localGroupInfo.edit(groupInfoDrug);
                        cardNew.addMAdditionalInfo(addInfoNewDrug);
                        localMedicalCard.edit(cardNew);
                    }
                }
                int idGroupInfoAllergy = 1;
                GroupInfo groupInfoAllergy = null;
                groupInfoAllergy = localGroupInfo.find(idGroupInfoAllergy);
                AdditionalInfo addInfoNewAllergy = null;
                if ((cardNew != null) && (allergy != null) && (allergy
                        != "")) {
                    addInfoNewAllergy = new AdditionalInfo(cardNew, groupInfoAllergy, allergy);
                    if (addInfoNewAllergy != null) {
                        localaddInfo.create(addInfoNewAllergy);
                        groupInfoAllergy.addAdditionalInfo(addInfoNewAllergy);
                        localGroupInfo.edit(groupInfoAllergy);
                        cardNew.addMAdditionalInfo(addInfoNewAllergy);
                        localMedicalCard.edit(cardNew);
                    }
                }
                int idGroupInfoVaccination = 6;
                GroupInfo groupInfoVaccination = null;
                groupInfoVaccination = localGroupInfo.find(idGroupInfoVaccination);
                AdditionalInfo addInfoNewVaccination = null;
                if ((cardNew != null) && (vaccination != null) && (vaccination
                        != "")) {
                    addInfoNewVaccination = new AdditionalInfo(cardNew, groupInfoVaccination, vaccination);
                    if (addInfoNewVaccination != null) {
                        localaddInfo.create(addInfoNewVaccination);
                        groupInfoVaccination.addAdditionalInfo(addInfoNewVaccination);
                        localGroupInfo.edit(groupInfoVaccination);
                        cardNew.addMAdditionalInfo(addInfoNewVaccination);
                        localMedicalCard.edit(cardNew);
                    }
                }
                int idGroupInfoBlood = 2;
                GroupInfo groupInfoBlood = null;
                groupInfoBlood = localGroupInfo.find(idGroupInfoBlood);
                AdditionalInfo addInfoNewBlood = null;
                if ((cardNew != null) && (blood != null) && (blood
                        != "")) {
                    addInfoNewBlood = new AdditionalInfo(cardNew, groupInfoBlood, blood);
                    if (addInfoNewBlood != null) {
                        localaddInfo.create(addInfoNewBlood);
                        groupInfoBlood.addAdditionalInfo(addInfoNewBlood);
                        localGroupInfo.edit(groupInfoBlood);
                        cardNew.addMAdditionalInfo(addInfoNewBlood);
                        localMedicalCard.edit(cardNew);
                    }
                }
                int idGroupInfoRH = 5;
                GroupInfo groupInfoRH = null;
                groupInfoRH = localGroupInfo.find(idGroupInfoRH);
                AdditionalInfo addInfoNewRH = null;
                if ((cardNew != null) && (outputRH != null) && (outputRH
                        != "")) {
                    addInfoNewRH = new AdditionalInfo(cardNew, groupInfoRH, outputRH);
                    if (addInfoNewRH != null) {
                        localaddInfo.create(addInfoNewRH);
                        groupInfoRH.addAdditionalInfo(addInfoNewRH);
                        localGroupInfo.edit(groupInfoRH);
                        cardNew.addMAdditionalInfo(addInfoNewRH);
                        localMedicalCard.edit(cardNew);
                    }
                }
            }
        %> 




        <div class="tabbable">
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#tab1" data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Personal data</a></li>
                <li><a href="#tab2"data-toggle="tab" class="calendar-cancel" onclick="calendar.hideCalendar()">Additional information</a></li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">

                    <form class="form-horizontal" action="">
                        <div class="container" >

                            <div class="row">
                                <div class="span4">
                                    <img src="../resources/img/foto.png" style="width:140px; heigth:140px;">

                                    <br><br>
                                    <!-----                     <div> 
                                                             <div class="control-group">
                                                                 <label class="my-control-label" for="card" >Medical card</label>
                                                                 <input type="text" id="card" name="card">
                                                             </div>
                                                         </div>--->
                                    <div>
                                        <label for="sex" >Sex</label>
                                        <select class="input-medium" id="sex" name="sex">
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="span8 ">
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputNumber" >Medical insurance number</label>
                                        <div class="my-controls">   
                                            <input type="text" id="inputNumber" name="number">
                                        </div>  
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputBirth">Date of birth</label>
                                        <div class="my-controls">
                                            <input type="text" name="date" id="inputBirth2" value="dd.mm.yyyy"/>
                                            <p> <script type="text/javascript" /> calendar.set("inputBirth2"); </script /></p>
                                        </div>
                                    </div>	

                                    <div class="control-group">
                                        <label class="my-control-label" for="inputLast">Last name</label>
                                        <div class="my-controls">
                                            <input type="text" id="inputLast"  name="last">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputFirst">First name</label>
                                        <div class="my-controls">
                                            <input type="text" id="inputFirst"  name="first">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputPatronymic">Patronymic</label>
                                        <div class="my-controls">
                                            <input type="text" id="inputPatronymic"  name="patronymic">
                                        </div>
                                    </div>      

                                    <div class="control-group">
                                        <label class="my-control-label" for="inputTel">Telephone number</label>
                                        <div class="my-controls">
                                            <input type="text" id="inputTel" name="tel">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="my-control-label" for="inputPassport">Passport number</label>
                                        <div class="my-controls">
                                            <input type="text" id="inputPassport" name="passport">
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="save" class="btn">Save</button>
                                </div>
                            </div>
                        </div >

                </div>

                <div class="tab-pane" id="tab2">


                    <div class="container" >

                        <div class="row">
                            <div class="span8 "style="margin-left: 200px;">
                                <div class="control-group">
                                    <label class="my-control-label" for="inputChronicDiseases" >Chronic illness</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputChronicDiseases" name="chronic">
                                    </div>
                                </div>	
                                <div class="control-group">
                                    <label class="my-control-label" for="inputDrugIntolerance">Drug intolerance</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputDrugIntolerance" name="drug">
                                    </div>
                                </div>	
                                <div class="control-group">
                                    <label class="my-control-label" for="inputAllergy">Allergies</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputAllergy" name="allergy">
                                    </div>
                                </div>	
                                <div class="control-group">
                                    <label class="my-control-label" for="inputVaccinations">Vaccinations</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputVaccinations" name="vaccination">
                                    </div>
                                </div>	
                                <div class="control-group">
                                    <label class="my-control-label" for="inputBloodGroup">Blood group</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputBloodGroup" name="blood">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="my-control-label" for="inputRHFactor">RH factor</label>
                                    <div class="my-controls">
                                        <input type="text" id="inputRHFactor" name="RH">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div >

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>