<%-- 
    Document   : test
    Created on : 24-Mar-2016, 07:37:49
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test Add New CMR </title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="cmr" method="post">
            
            <input type="text" name="txtAcademicSession" value="testProc" class="form-control"/>
            <br/>
            <input type="text" name="txtCourse_id" value="comp_1661" class="form-control"/>
            <br/>
            <input type="text" name="txtCl_id" value="cl001" class="form-control"/>
            <br/>
            <input type="text" name="txtStudentCount" value="25" class="form-control"/>
            <br/>
            <button name="act" value="btnAddCMR" class="btn btn-default" id="contactbtn">Submit</button>
                <c:if test="${!empty(msgBlue)}" >
                    <p style="color:blue;">${msgBlue}</p>
                </c:if>
                <c:if test="${!empty(msgR)}" >
                    <p style="color:red;">${msgR}</p>
                </c:if>
        </form>
    </body>
</html>
