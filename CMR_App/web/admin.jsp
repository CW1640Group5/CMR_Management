<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta charset="viewport" content="width=device-width, initial-scale=1.0">-->
        <title>Admin</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!--header -->
        <nav class="navbar navbar-inverse navbar-static-top " role="navigation">
            <div class="container-fluid">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-EV-navbar-collapse-1">

                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-header navbar-inverse">
                    <a class="navbar-brand" href="index.html">Group5</a>
                </div>

                <div class="collapse navbar-collapse navbar-right" id="bs-EV-navbar-collapse-1">

                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="index.html">
                                <span class="glyphicon glyphicon-home" style="color:white;"></span>
                                Home</a>
                        </li>

                        <li>
                            <a href="#">School</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${cmrUsers.getUserName()}</a></li>
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--end ofheader -->
        <!--main content-->

        <div class="container">
            <div class="jumbotron">
                <div class="panel panel-default">
                    <div class="panel-heading">Add New Course</div>
                    <div class="panel-body">
                        <form action="course" method="post" >
                            <div class="form-group">
                                <label for="id">Course ID</label>
                                <input type="text" name="txtcID" class="form-control" id="name" placeholder="comp_" 
                                       required data-validation-required-message="Please enter CourseID.">
                            </div>
                            <div class="form-group">
                                <label for="Name">Course Name</label>
                                <input type="text" name="txtcName" class="form-control" id="name" placeholder="Coursework Name" 
                                       required data-validation-required-message="Please enter Course Name.">
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea name="txtDescription" class="form-control" id="name" placeholder="Description" value="Description"  
                                          required data-validation-required-message="Please enter some Detail."></textarea>
                            </div>
                            <div class="form-group">
                                <label for="startTime">Start Time</label>
                                <input type="datetime" name="txtcStartDate" class="form-control" id="startTime" placeholder="MM/dd/yyyy" value="12/25/2016"
                                        required data-validation-required-message="Please enter StartTime">
                            </div>
                            <div class="form-group">
                                <label for="endTime">End Time</label>
                                <input type="datetime" name="txtcEndDate" class="form-control" id="endTime" placeholder="MM/dd/yyyy" value="12/25/2017"
                                        required data-validation-required-message="Please enter End Time.">
                            </div>
                            <button name="act" value="btnAddNewCourse" class="btn btn-primary" id="contactbtn">Submit</button>
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/assign" style="text-decoration: none;"> Asign to Course Leader</a>
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
        <script src="js/jqBootstrapValidation.js"></script>
    </body>
