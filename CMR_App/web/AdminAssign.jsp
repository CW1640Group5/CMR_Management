<!doctype html>
<%@page import="cmr.entity.AssignCourse"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta charset="viewport" content="width=device-width, initial-scale=1.0">-->
        <title>Assign to Course Leader</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!--header -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Group5</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <a href="index.html">
                            <span class="glyphicon glyphicon-home" style="color:white;"></span>
                            Home</a>
                    </li>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${cmrUsers.getUserName()}</a></li>
                    <li><a href="#">About Us</a></li> 
                    <li><a href="index.jsp">Logout</a></li>
                </ul>

            </div>
        </nav>
        <!--end ofheader -->
        <!--main content-->
        <div class="jumbotron">
            <div class="panel panel-default">
                <div class="panel-heading">Assign to Course leader</div>
                <div class="panel-body">
                    <form action="assign" method="post">
                        <div class="form-group">
                            <label for="id">Course ID</label>
                            <input type="text" name="txtCourseID" value="${Course_id}" class="form-control" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="Name">Course Leader</label>
                            <select name="cbCL_id" class="form-control">
                                    <option value="0">default</option>
                                    <option value="cl001">Ha</option>
                                    <option value="cl002">Giap</option>
                                    <option value="cl003">Ngo Tung Son</option>
                                    <option value="cl004">CL</option>
                            </select>                            
                        </div>
                       <div class="form-group">
                            <label for="name">Course Moderator</label>
                            <select name="cbCM_id" class="form-control">
                                <option value="0">default</option>
                                <option value="cm001">CM</option>
                                <option value="cm002">CM2</option>
                                <option value="cm003">Mr.H</option>
                                <option value="cm004">Mr.I</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="name">Faculty</label>
                            <select name="cbfac_id" class="form-control">
                                <option value="0">default</option>
                                <option value="fac001">Chi</option>
                                <option value="fac002">fac</option>
                                <option value="fac003">Ngo Tung Son</option>
                                <option value="fac004">Giap</option>
                            </select>
                        </div>
                       
                        <button value="btnAssign" name="act" class="btn btn-primary" id="contactbtn">Assign</button>
                        <br/>
                        <c:if test="${!empty(msgBlue)}" >
                            <p style="color:blue;">${msgBlue}</p>
                        </c:if>
                        <c:if test="${!empty(msgR)}" >
                            <p style="color:red;">${msgR}</p>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>

        <!--end of main content-->
        <!--footer-->
        <footer class="site-footer">
            <div class="container">

                <div class="bottom-footer">
                    <div class="col-md-5">&copy Copyright of Group 5</div>
                    <div class="col-md-7">
                        <ul class="footer-nav">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </footer>
        <!--end of footer-->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
</html>
