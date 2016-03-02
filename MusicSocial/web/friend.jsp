<%-- 
    Document   : friend
    Created on : Jul 11, 2014, 4:58:32 PM
    Author     : Pham
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="msn.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <form class="navbar-form navbar-left" role="search" action="FriendServlet?act=searchuser" method="post">
                        <div class="form-group">
                            <input  id="search" type="text" name="name"  class="form-control" placeholder="Search"  />                            
                            <input class="btn-success" type="submit" name="searchuser" value="Search"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>  
        <div class="container">
            <div class="col-lg-8 ">              
                <c:forEach items="${listOfUsers}" var="u">
                    <c:if test="${u.getId() != 1}">
                        <div class="row padding">
                            <div class="col-lg-3 avartarUser">
                                <img src="images/avatar/batman.JPG" id="img">        
                            </div>
                            <div class="col-lg-9 userInformation" >  
                                <h3 id="userInfoAfterSearch"> ${u.getName()}</h3>  <br/>
                                    <form action="FriendServlet" method="post" >          
                                        <input type="hidden" name="userId" value="${u.getId()}"/>
                                        <c:if test="${u.getStatus() == 0}">
                                            <input type="submit" name="act" value="addfriend"/>
                                        </c:if>
                                        <c:if test="${u.getStatus() == 1}">
                                            <input type="submit" name="act" value="unfriend"/>
                                        </c:if>
                                        <c:if test="${u.getStatus() == 2}">
                                            <input type="submit" name="act" value="cancelrequest"/>
                                        </c:if>    
                                        <c:if test="${u.getStatus() == 3}">
                                            <input type="submit" name="act" value="confirmrequest"/>
                                        </c:if> 
                                    </form>                  

                            </div>
                        </div>
                    </c:if>
                </c:forEach>
              
            </div>
              <hr/>

        </div>    
    </body>
</html>
