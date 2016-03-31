<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta charset="viewport" content="width=device-width, initial-scale=1.0">-->
        <title>Assign to Course 
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
                    <form action="${pageContext.request.contextPath}/assign?act=add" method="post">
                        <div class="form-group">
                            <label for="id">Course ID</label>
                            <input type="text" value="${Course_id}" class="form-control" disabled> 
                        </div>
                        <div class="form-group">
                            <label for="Name">Course Leader</label>
                            <select name="CL_id" class="form-control">
                                <c:forEach items="${listAss}" var="m">
                                    <option value="${m.getCl_id()}">${m.getCl_id()}</option>
                                </c:forEach>
                            </select>
                        </div>
                       <div class="form-group">
                            <label for="name">Course Master</label>
                            <select name="CM_id" class="form-control">
                                <c:forEach items="${listAss}" var="m">
                                    <option value="${m.getCm_id()}">${m.getCm_id()}</option>
                                </c:forEach>
                            </select>
                        </div>
                       
                        <input type="submit" name="add" value="add" class="btn btn-default" id="contactbtn"/>
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
