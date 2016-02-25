<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<div class="page-header no-margin no-padding">

    <img src="img/gre-uni.jpg" class="img-responsive" id="img">
</div>

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
                <li class="active"><a href="index.html"><span class="glyphicon glyphicon-home"
                                                              style="color:white;"></span> Home</a></li>

                <li>
                    <a href="#">School</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>Admin</a></li>
                <li>
                    <form class="form-inline ">
                        <div class="col-sm-13">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
									  <span class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									  </span>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>
        </div>

    </div>

</nav>

<!--end ofheader -->
<!--main content-->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-md-8">

                </div>

                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">Add New Course</div>
                        <div class="panel-body">
                            <form id="ContactForm" method="post" action="#">
                                <div class="form-group">
                                    <label for="Name">Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="John">
                                </div>
                                <div class="form-group">
                                    <label for="text">Start Time</label>
                                    <input type="time" class="form-control" id="staartTime" placeholder="12:00pm">
                                </div>
                                <div class="form-group">
                                    <label for="endtime">End Time</label>
                                    <input type="time" class="form-control" id="endTime" placeholder="12:00am">
                                </div>
                                <div class="form-group">
                                    <label for="year">Year</label>
                                    <input type="text" class="form-control" id="year" placeholder="John">
                                </div>
                                <button type="button" class="btn btn-default" id="contactbtn">Submit</button>
                            </form>
                        </div>
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
</html>
