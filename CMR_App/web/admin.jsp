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
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>Admin</a></li>
                    <li><a href="#">About Us</a></li> 
                </ul>

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
                                <label for="Name">Course ID</label>
                                <input type="text" name="txtcID" class="form-control" id="name" placeholder="C12345" value="c555">
                            </div>
                            <div class="form-group">
                                <label for="Name">Course Name</label>
                                <input type="text" name="txtcName" class="form-control" id="name" placeholder="Web Design" value="fagdhs">
                            </div>
                            <div class="form-group">
                                <label for="text">Start Time</label>
                                <input type="datetime" name="txtcStartDate" class="form-control" id="startTime" placeholder="MM/dd/yyyy" value="12/25/2016">
                            </div>
                            <div class="form-group">
                                <label for="endtime">End Time</label>
                                <input type="datetime" name="txtcEndDate" class="form-control" id="endTime" placeholder="MM/dd/yyyy" value="12/25/2017">
                            </div>
                            <button name="act" value="btnAddNewCourse" class="btn btn-default" id="contactbtn">Submit</button>
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
                    <div class="col-md-5">&copy Copyright of Danbliss Onass 2016</div>
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
    </body>
