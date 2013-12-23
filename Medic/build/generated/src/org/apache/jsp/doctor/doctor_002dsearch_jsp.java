package org.apache.jsp.doctor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.medic.entity.Patient;
import java.util.List;
import com.medic.facade.PatientFacadeLocal;
import javax.naming.InitialContext;

public final class doctor_002dsearch_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("        <title>iMedic</title>\r\n");
      out.write("        <link href=\"../resources/css/style.css\" rel=\"stylesheet\" type=\"text/css\"> \r\n");
      out.write("        <script src=\"../resources/js/jquery-latest.js\"></script>\r\n");
      out.write("        <script src=\"../resources/js/bootstrap.js\"></script>\r\n");
      out.write("        <script src=\"../resources/js/date.js\"></script>\r\n");
      out.write("        <link href=\"../resources/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"navbar navbar-inverse navbar-static-top\">\r\n");
      out.write("            <nav class=\"navbar-inner\">\r\n");
      out.write("                <a href=\"../index.html\" class=\"brand\">iMedic</a>\r\n");
      out.write("                <ul class=\"nav\">\r\n");
      out.write("                    <li class=\"divider-vertical\"></li>\t\r\n");
      out.write("                    <li class=\"dropdown\">\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Registry<b class=\"caret\"></b></a>\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"../registry/new-patient.jsp\">Create new patient card</a></li>\r\n");
      out.write("                            <li><a href=\"../registry/registry-search.jsp\">Search patient</a></li>\r\n");
      out.write("                            <li><a href=\"../registry/doctors-schedule.jsp\">Doctors schedule</a></li>\r\n");
      out.write("                            <li><a href=\"../registry/laboratories-schedule.jsp\">Laboratories schedule</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"dropdown\">\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Doctor<b class=\"caret\"></b></a>\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"../doctor/doctor-search.jsp\">Search patient</a></li>\r\n");
      out.write("                            <li><a href=\"../doctor/doctor-reception.jsp\">Receptions</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"dropdown\">\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Laboratory<b class=\"caret\"></b></a>\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"../laboratory/laboratory-search.jsp\">Search patient</a></li>\r\n");
      out.write("                            <li><a href=\"../laboratory/laboratory-reception.jsp\">Receptions</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"dropdown\">\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Admin<b class=\"caret\"></b></a>\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"#\">Edit doctor's schedule</a></li>\r\n");
      out.write("                            <li><a href=\"#\">Edit laboratory's  schedule</a></li>\r\n");
      out.write("                            <li><a href=\"#\">Edit DB doctors</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </nav>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <header>\r\n");
      out.write("                <h1>Medical card</h1>\r\n");
      out.write("            </header>\r\n");
      out.write("            <style>\r\n");
      out.write("                .my-control-label {\r\n");
      out.write("                    float: left;\r\n");
      out.write("                    width: 250px;\r\n");
      out.write("                    padding-top: 5px;\r\n");
      out.write("                    text-align: left;\t\r\n");
      out.write("                }\r\n");
      out.write("                .my-controls {\r\n");
      out.write("                    margin-left: 270px;\r\n");
      out.write("                }\r\n");
      out.write("            </style> \r\n");
      out.write("        </div> \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\" >\r\n");
      out.write("            <form class=\"form-horizontal\" action=\"doctor-patient.jsp\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"span8 \" style=\"margin-left: 200px;\">\r\n");
      out.write("                            <div class=\"control-group\">\r\n");
      out.write("                                <label class=\"my-control-label\" for=\"inputSearch\" >Searching patient by id</label>\r\n");
      out.write("                                <div class=\"my-controls\">\r\n");
      out.write("                                    <input type=\"text\" name=\"id\"> <button type=\"submit\" class=\"btn\">Search</button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\t\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div >\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\" >\r\n");
      out.write("            <form class=\"form-horizontal\" action=\"doctor-search.jsp\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"span8 \" style=\"margin-left: 200px;\">\r\n");
      out.write("                            <div class=\"control-group\">\r\n");
      out.write("                                <label class=\"my-control-label\" for=\"inputSearch\" >Searching patient by last name</label>\r\n");
      out.write("                                <div class=\"my-controls\">\r\n");
      out.write("                                    <input type=\"text\" name=\"lastName\"> <button type=\"submit\" class=\"btn\">Search</button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\t\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div >\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            String patientLastName = request.getParameter("lastName");
            List<Patient> patients = null;
            InitialContext ic = new InitialContext();
            PatientFacadeLocal localPatient = (PatientFacadeLocal) ic.lookup("java:comp/env/ejb/LocalRef");
            if (patientLastName != null) {
                patients = localPatient.findByLastName(patientLastName);
               for (Patient somePatient: patients){
                  out.print( somePatient.getPassport());
               }
            }

        
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
