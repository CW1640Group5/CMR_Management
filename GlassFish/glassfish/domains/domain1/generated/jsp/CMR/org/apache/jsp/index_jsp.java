package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      response.setHeader("X-Powered-By", "JSP/2.3");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta charset=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>welcome</title>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"page-header no-margin no-padding\">\n");
      out.write("            <img src=\"img/gre-uni.jpg\" class=\"img-responsive\" id=\"img\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!--header -->\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-static-top \" role=\"navigation\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\"\n");
      out.write("                        data-target=\"#bs-EV-navbar-collapse-1\">\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"navbar-header navbar-inverse\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.html\">Group5</a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse navbar-right\" id=\"bs-EV-navbar-collapse-1\">\n");
      out.write("\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <li class=\"active\"><a href=\"index.html\"><span class=\"glyphicon glyphicon-home\"\n");
      out.write("                                                                      style=\"color:white;\"></span> Home</a></li>\n");
      out.write("\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">School</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\">Services</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span>Admin</a></li>\n");
      out.write("                        <li>\n");
      out.write("                            <form class=\"form-inline \">\n");
      out.write("                                <div class=\"col-sm-13\">\n");
      out.write("                                    <div class=\"input-group\">\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" placeholder=\"Search for...\">\n");
      out.write("                                        <span class=\"input-group-btn\">\n");
      out.write("                                            <button class=\"btn btn-default\" type=\"button\">Go!</button>\n");
      out.write("                                        </span>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!--end ofheader -->\n");
      out.write("        <!--main content-->\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"panel panel-default\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-sm-3 col-md-4\">\n");
      out.write("                            <form id=\"ContactForm\" method=\"post\" action=\"#\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"ContactName\">User Name</label>\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" id=\"userName\" placeholder=\"John\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"Password\">Password</label>\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" id=\"pwd\">\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" id=\"contactbtn\">Login</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--end of main content-->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--footer-->\n");
      out.write("        <footer class=\"site-footer\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"bottom-footer\">\n");
      out.write("                    <div class=\"col-md-5\">&copy Copyright of Danbliss Onass 2016</div>\n");
      out.write("                    <div class=\"col-md-7\">\n");
      out.write("                        <ul class=\"footer-nav\">\n");
      out.write("                            <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                            <li><a href=\"about.html\">About</a></li>\n");
      out.write("                            <li><a href=\"contact.html\">Contact</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("        <!--end of footer-->\n");
      out.write("        <script src=\"js/jquery.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
