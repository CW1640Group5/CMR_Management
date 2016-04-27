<%-- 
    Document   : AddNewCMR
    Created on : 10-Mar-2016, 08:16:38
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Show CMR</title>
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

        <!--end of header -->
        <!--main content-->

        <form action="cmr" method="post">
            <c:forEach items="${listOfCMR}" var="n">
                <div class="container">
                    <div class="card">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Course Monitoring Report</div>
                                <div class="panel-body">

                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr class="active"></tr>
                                            <tr class="success">
                                                <td class="active">Academic Session</td>
                                                <td><input type="text" class="form-control" value="${n.getAcademicSession()}" name="txtAcademicSession" readonly="true"/></td>
                                            </tr>
                                            <tr class="success">
                                                <td class="success">Course Code + tittle</td>
                                                <td><input type="text" class="form-control" value="${n.getCourse_id()}" name="txtCourse_id" readonly="true"/></td>
                                            </tr>
                                            <tr class="success">
                                                <td class="success">Course Leader</td>
                                                <td><input type="text" class="form-control" value="${n.getCL_id()}" name="txtCl_id" readonly="true"/></td>
                                            </tr>
                                            <tr class="success">
                                                <td class="success">Student Count</td>
                                                <td><input type="text" class="form-control" value="${n.getStudentcount()}" name="txtStudentCount" readonly="true"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Statistical Data</div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td class="success"></td>
                                                <td class="success">Cw1</td>
                                                <td class="success">CW2</td>
                                                <td class="success">Exam</td>
                                                <td class="success">Overall</td>
                                            </tr>
                                            <tr>
                                                <td class="success">Mean</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMeanCW1()}" name="txtMeanCW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMeanCW2()}" name="txtMeanCW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMeanExam()}" name="txtMeanExam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMeanOverall()}" name="txtMeanOverall" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="success">Median</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMedianCW1()}" name="txtMedianCW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMedianCW2()}" name="txtMedianCW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMedianExam()}" name="txtMedianExam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getMedianOverall()}" name="txtMedianOverall" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="success">Standard Deviation</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getSDCW1()}" name="txtSDCW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getSDCW2()}" name="txtSDCW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getSDExam()}" name="txtSDExam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getSDOverall()}" name="txtSDOverall" readonly="true"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="container">
                            <div class="panel panel-default">
                                <div class="panel-heading">Grade Distribution</div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td class="success"></td>
                                                <td class="success">0-39</td>
                                                <td class="success">40-69</td>
                                                <td class="success">70-89</td>
                                                <td class="success">90+</td>
                                            </tr>
                                            <tr>
                                                <td class="success">CW1</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC0_39CW1()}" name="txt0_39CW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC0_39CW2()}" name="txt0_39CW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC0_39Exam()}" name="txt0_39Exam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC0_39Overall()}" name="txt0_39Overall" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="success">CW2</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC40_69CW1()}" name="txt40_69CW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC40_69CW2()}" name="txt40_69CW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC40_69Exam()}" name="txt40_69Exam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC40_69Overall()}" name="txt40_69Overall" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="success">EX</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC70_89CW1()}" name="txt70_89CW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC70_89CW2()}" name="txt70_89CW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC70_89Exam()}" name="txt70_89Exam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC70_89Overall()}" name="txt70_89Overall" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="success">Overral</td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC90_CW1()}" name="txt90_CW1" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC90_CW2()}" name="txt90_CW2" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC90_Exam()}" name="txt90_Exam" readonly="true"/>
                                                </td>
                                                <td class="success">
                                                    <input type="text" class="form-control" value="${n.getC90_Overall()}" name="txt90_Overall" readonly="true"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button name="act" value="btnApprove" class="btn btn-primary" id="contactbtn">Approve</button>
                    <c:if test="${!empty(msgBlue)}" >
                        <p style="color:blue;">${msgBlue}</p>
                    </c:if>
                    <c:if test="${!empty(msgR)}" >
                        <p style="color:red;">${msgR}</p>
                    </c:if>
                </div>
            </c:forEach>
        </form>

        <!--end of main content-->
        <!--footer-->
        <footer class="site-footer">
            <div class="container">
                <div class="bottom-footer">
                    <div class="col-md-5">&copy Copyright of Group 5</div>
                </div>
            </div>
        </footer>
        <!--end of footer-->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jqBootstrapValidation.js"></script>
    </body>
</html>
