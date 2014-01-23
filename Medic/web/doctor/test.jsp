<%-- 
    Document   : test
    Created on : Jan 9, 2014, 2:11:32 PM
    Author     : Rimma
--%>

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
            
            String pa=request.getParameter("a");
            String pb=request.getParameter("b");
            String pAction=request.getParameter("action");
            if (pb!=null){
            String paCheck=pb.trim();
            out.print(paCheck+"!");
            out.print(pb+"!");
            if (paCheck.isEmpty())
                out.print("eee");
                    }

        %>
        <form action='test.jsp' method="GET" >
            <input type='text' name="a" required>
                        <input type='text' name="b" required pattern="[A-Za-z-0-9]+\s[A-Za-z-'0-9]+"  title="firstname lastname" >
            <button type="submit" name="action" value="first" class="btn">sss</button>
        </form>
         <form action='test.jsp' method="GET">
            <input type="text" name="b">
            <button type="submit" name="action" value="second" class="btn">sss</button>
        </form>z
    </body>
</html>
