<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Leader</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!--header -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header col-sm-9">
                    <a class="navbar-brand" href="#">Group5</a>
                    <form class="form-group">
                        <div class="col-xs-8" style="margin-top: 8px;">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Go!</button>
                                </span>
                            </div>
                        </div>
                    </form>
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
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Interaction Design</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <button type="button" class="btn btn-default" id="contactbtn">>> Assign now</button>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Database Engineering</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <button type="button" class="btn btn-default" id="contactbtn">>> Go</button>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-8">
                        <h3>Enterprise Web Software Development</h3>
                        <h5>Start time: 01-01-2016</h5>
                        <h5>End time: 01-03-2016</h5>
                        <h5>Course leader: John</h5>
                        <button type="button" class="btn btn-default" id="contactbtn">>> Go</button>
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
