<%-- 
    Document   : approveDLT
    Created on : Apr 11, 2016, 7:35:57 PM
    Author     : Bunn
--%>
<%@page import="cmr.entity.CMR_Approve"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
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

        <div class="jumbotron">
            <div class="panel panel-default">
                <div class="panel-heading">Feedback The CMR</div>
                <br/>
                <br/>
                <div class="panel-body">
                    <form action="approve" method="post">
                        <br/>
                        <select name="CMR_id" class="form-control">
                            <option value="${CMR_id}">${CMR_id}</option>
                          
                        </select>

                        <br/>
                        <br/>
                        <table class="table table-bordered">
                                        <tr class="active"></tr>
                                        <tr class="success">
                                            <td class="active">Commit</td>
                                            <td><input type="text" class="form-control" name="txtcomit" value="this cmr i have check"/></td>
                                        </tr>
                                        <tr class="success">
                                            <td class="success">action</td>
                                            <td><input type="text" class="form-control" name="txtaction" value="Action 1"/></td>
                                        </tr>
                                       
                        </table>
                        <br/>
                        <br/>
                        <button value="btnApprove" name="act" class="btn btn-primary" id="contactbtn">Approve CMR</button>
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




    </body>
</html>
