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
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-EV-navbar-collapse-1">
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
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>Course Leader</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!--end of header -->
        <!--main content-->
        <div class="container">
            <div class="jumbotron">
                <div class="panel panel-default">
                    <div class="panel-heading">Add CMR</div>
                    <div class="panel-body">
                        <form action="cmr" method="post" >
                            <div class="form-group">
                                <label for="type">Type</label>
                                <input type="text" name="txtType" class="form-control" id="name" placeholder="Type of CMR" value="Type of CMR">
                            </div>
                            <div class="form-group">
                                <label for="docCode">Document Code</label>
                                <input type="text" name="txtDocCode" class="form-control" id="name" placeholder="Document Code of CMR" value="DC-001">
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="txtName" class="form-control" id="name" placeholder="Name of CMR" value="This is CMR name">
                            </div>
                            <div class="form-group">
                                <label for="link">Link</label>
                                <input type="text" name="txtLink" class="form-control" id="name" placeholder="Link of document" value="http://www.abc.com">
                            </div>
                            <div class="form-group">
                                <label for="cl_id">CL_ID</label>
                                <input type="text" name="txtClId" class="form-control" id="name" placeholder="cl001" value="cl001">
                            </div>
                            <div class="form-group">
                                <label for="cID">Course_ID</label>
                                <input type="text" name="txtCourseID" class="form-control" id="name" placeholder="courseID" value="comp_1640">
                            </div>
                            <div class="form-group">
                                <label for="static">Static</label>
                                <input type="text" name="txtStatic" class="form-control" id="name" placeholder="Yes or No" value="No">
                            </div>
                            
                            <button name="act" value="createCMR" class="btn btn-default" id="contactbtn">Create</button>
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
                </div>
            </div>
        </footer>
        <!--end of footer-->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
