<%-- 
    Document   : AddNewCMR
    Created on : 10-Mar-2016, 08:16:38
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Add New CMR</title>
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


        <div class="container">
            <div class="row">
                <div class="container">
                    <div class="panel panel-default">
                        <div class="panel-heading"><b>Statistical Data</b></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form action="statisticData" method="post">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td class="success">Mean</td>
                                            <td class="success"><input type="text" class="form-control" name="txtMean" value="12"/></td>
                                        </tr>
                                        <tr>
                                            <td class="success">Median</td>
                                            <td class="success"><input type="text" class="form-control" name="txtMedian" value="15"/></td>
                                        </tr>
                                        <tr>
                                            <td class="success">Standard Deviation</td>
                                            <td class="success"><input type="text" class="form-control" name="txtStanDeviation" value="20"/></td>
                                        </tr>
                                        <tr>
                                            <td class="success">CW Data</td>
                                            <td class="success">
                                                <select class="form-control" name="cbAcademicSession">
                                                    <option>--Default--</option>
                                                    <option value="1">Coursework 1</option>
                                                    <option value="2">Coursework 2</option>
                                                    <option value="3">Exam</option>
                                                    <option value="4">Overall</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>

                                    <button name="act" value="btnAddStatisticData" class="btn btn-default" id="contactbtn">Submit</button>
                                    <a class="btn btn-default" href="addGradeDistributionData.jsp">Add Grade Distribution Data >></a>

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
            </div>
        </div>
    </div>

    <!--end of main content-->
    <!--footer-->
        <footer class="site-footer">
            <div class="container">
                <br>
                <br><br><br><br><br><br>
                <div class="bottom-footer">
                    <div class="col-md-5">&copy Copyright of Group 5</div>
                </div>
            </div>
        </footer>
        <!--end of footer-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
