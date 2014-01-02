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
            MedicalHistory history=null;
            InitialContext ic = new InitialContext();
            MedicalHistoryFacadeLocal localHistory = (MedicalHistoryFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalHistoryRef");
            Integer id = null;
            Examination examination=null;
            Collection <DoctorReception> receptions=null; 
            if (historyId != null) {
                id = Integer.valueOf(historyId);
            }
            if (id != null) {
                history=localHistory.find(id);
                receptions=history.getDoctorReceptions();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Doctor doctor=null;
            String doctorFIO="";
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

                <%
                    for (DoctorReception someReception : receptions) {
                        examination=someReception.getIdExamination();
                        doctor=someReception.getIdDoctor();
                        doctorFIO=doctor.getLastName()+" "+doctor.getFirstName()+" "+doctor.getPatronymic();
                %>
                <tr>
                    <td><%= sdf.format(someReception.getReceptionDate())%></td>
                    <td><%= doctorFIO %></td>
                    <td><%= examination.getComplaints()%></td>
                    <td> <a href="doctor-exam.jsp?id=<%=examination.getIdExamination()%>">View</a> </td>
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
