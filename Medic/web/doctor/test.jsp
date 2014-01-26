<%-- 
    Document   : test
    Created on : Jan 9, 2014, 2:11:32 PM
    Author     : Rimma
--%>

<%@page import="com.medic.entity.Patient"%>
<%@page import="java.util.List"%>
<%@page import="com.medic.facade.local.PatientFacadeLocal"%>
<%@page import="com.medic.facade.local.SexFacadeLocal"%>
<%@page import="com.medic.entity.Sex"%>
<%@page import="com.medic.facade.local.ExaminationFacadeLocal"%>
<%@page import="java.util.Collection"%>
<%@page import="com.medic.entity.DoctorReception"%>
<%@page import="com.medic.entity.Examination"%>
<%@page import="com.medic.facade.local.MedicalHistoryFacadeLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.medic.entity.MedicalHistory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iMedic</title>
        <%@ include file="/jspf/link.jspf" %>
    </head>
    <body>
        <h1>Hello World!</h1>
       <%
        InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/PatientRef");
            MedicalHistoryFacadeLocal localHistory = (MedicalHistoryFacadeLocal) ic.lookup("java:comp/env/ejb/MedicalHistoryRef");
            List <MedicalHistory> med=localHistory.findByIdPat(1);
            for (MedicalHistory some:med){
                out.print(some.getDescription());
            }
       %>
    </body>
</html>
