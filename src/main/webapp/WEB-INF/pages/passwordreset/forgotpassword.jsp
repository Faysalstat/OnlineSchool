<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE html>
<html lang="en">
 <head>
        <title>Reset Password</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .btn{
                width: 100px;
            }
            .loginsection{
                    width:45%;
                    margin:100px auto;

                    border:1px solid black;
                    padding:30px;
            }
        </style>

    </head>
    <body>

        <div class="container">
            <div class="loginsection">
                <h1 style="font-weight: bolder;text-align: center">Reset Password</h1>
                <hr style="height:5px;" />
                <form action="${base}/auth/sendtoken" method="post" modelAttribute="user">
                    <div class="form-group">
                        <label>Please Give your Email Address:</label>
                        <input type="text" name="email"  class="form-control" />
                    </div>
                    <div class="form-group">
                        <input name="submit" type="submit" value="Reset" class="btn btn-success"/>
                    </div>
                </form>
            </div>

        </div>
    </body>
</html>