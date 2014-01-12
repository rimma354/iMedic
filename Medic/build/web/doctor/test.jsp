<%-- 
    Document   : test
    Created on : Jan 9, 2014, 2:11:32 PM
    Author     : Rimma
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        
         
            InitialContext ic = new InitialContext();
             ExaminationFacadeLocal localExam = (ExaminationFacadeLocal) ic.lookup("java:comp/env/ejb/ExaminationRef");
            Collection <Examination> exams=localExam.findAll();
            for (Examination someExam: exams){
                 out.print(someExam.getIdExamination()+" "+someExam.getIdDoctorReception()+"!");
            }
        %>
    </body>
</html>
