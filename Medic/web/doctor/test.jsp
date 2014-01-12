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
            String pa=request.getParameter("a");
            String pb=request.getParameter("b");
            String pAction=request.getParameter("action");

           out.print(pa+" !!!!!!!! ");
           out.print(pb+ " !!!!");
           
           if ("first".equals(pAction)){
               if (pa == null)
                   out.print("NULL");
                  else  {
                   if (pa.equals(""))
                   out.print("PUSTOE");
                   else 
                        out.print("!"+pa+"NONE");
                  
                     
           }}
             if ("second".equals(pAction)){
               if (pb == null)
                   out.print("NULL");
                  else  {
                   if (pb == "")
                   out.print("PUSTOE");
                   else 
                        out.print("!"+pb+"NONE");
                  
                     
           }}
        %>
        <form action='test.jsp' method="Post">
            <input type='text' name="a">
            <button type="submit" name="action" value="first" class="btn">sss</button>
        </form>
         <form action='test.jsp' method="GET">
            <input type="text" name="b">
            <button type="submit" name="action" value="second" class="btn">sss</button>
        </form>
    </body>
</html>
