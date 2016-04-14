<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta charset="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Home </title>
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

                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">CMR</a></li>
                        <li><a href="#">Login</a></li> 
                        <li><a href="#">About Us</a></li> 
                    </ul>
                </div>
            </div>
        </nav>

        <!--end ofheader -->

        <!--main content-->
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-8"><div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="img/gre-uni.jpg" alt="..." id="img2">
                                    <div class="carousel-caption">
                                        welcome
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="img/gre-uni2.jpg" alt="..." id="img2">
                                    <div class="carousel-caption">

                                    </div>
                                </div>

                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div></div>

                    <div class="col-md-4">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                            Login</a>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <form class="form-horizontal" id="ContactForm" method="post" action="cmr_users">
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="name"></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="userName" name="txtUserName" placeholder="User name">

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="pwd"></label>
                                                <div class="col-sm-10"> 
                                                    <input type="password" class="form-control" id="pwd" name="txtPassword" placeholder="Password">

                                                </div>
                                            </div>
                                            <div class="form-group"> 
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <div class="checkbox">
                                                        <label><input type="checkbox"> Remember me</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group"> 
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button class="btn btn-default" id="contactbtn" name="act" value="btnLogin">Login</button>
                                                    <c:if test="${!empty(msg)}" >
                                                        <p style="color:red;">${msg}</p>
                                                    </c:if>
                                                </div>
                                            </div>
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
                <br>
                <br>
                <br>
                <br>

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