<%-- 
    Document   : join
    Created on : Jun 20, 2014, 1:35:27 PM
    Author     : hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="row">
                <div class="col-lg-3">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Music Social Network</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input id="search" type="search" class="form-control" placeholder="Search" >
                        </div>
                    </form>
                </div>
            </div>
        </div>   
        <div class="container">
            <div class="col-lg-3 loginArea">
                <form action="account" method="POST">        
                    <h3 id="usernamePassword">Email</h3>
                    <input type="text" class="form-control" name="txtEmail" value="admin@gmail.com">
                    <h3 id="usernamePassword">Password</h3>
                    <input type="password" class="form-control" name="txtPassword" value="admin">
                    <input type="checkbox" /><a>Remember Me</a>
                    <button class="btn btn-info span2" id="btnLogin" name="act" value="login">Login</button>  
                    <br/>
                    <c:if test="${!empty(msg)}" >
                        <p style="color:red;">${msg}</p>
                    </c:if>
                </form>
            </div>
            <div class="col-lg-9 signUp">
                <h2 id="tittleSignUp">Welcome!!</h2>
                <h5><b>We are connecting everyone,on everywhere!</b></h5>
                <h4 id="signupText">Sign Up for Social Music Network</h4>

                <form method="post" action="account">
                    <h5><input type="text" placeholder="Your Name" class="form-control" name="txtName"/></h5>
                    <h5><input type="text" placeholder="Your Email" class="form-control" name="txtEmail" /></h5>
                    <h5><input type="password" placeholder="Your Password" class="form-control" name="txtPassword"/></h5>

                    <button class="btn btn-success " id="btnRegister" name="act" value="register">Register</button>
                    <br/>
                    <c:if test="${!empty(msgR)}" >
                        <p style="color:red;">${msgR}</p>
                    </c:if>
                    <c:if test="${!empty(msgBlue)}" >
                        <p style="color:blue;">${msgBlue}</p>
                    </c:if>
                </form>
            </div>
        </div>
    </body>
</html>
