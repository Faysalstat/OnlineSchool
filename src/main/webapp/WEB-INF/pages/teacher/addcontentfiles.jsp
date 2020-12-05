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

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Add Course</title>
        <link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">
        <!-- Bootstrap core CSS -->
        <link href="${base}/css/dash/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${base}/css/dash/css/simple-sidebar.css" rel="stylesheet">

    </head>

    <body>
        <%
            User admin = (User) session.getAttribute("admin");

            if (admin == null || !admin.getUserRole().equals("TEACHER")) {
                response.sendRedirect("login");
            }
        %>
        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading">Dashboard</div>
                <div class="list-group list-group-flush">
                    <a href="${base}/dashboard/teachers" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                    <a href="${base}/dashboard/addcourse" class="list-group-item list-group-item-action bg-light">Add Course</a>
                    <a href="${base}/dashboard/courses" class="list-group-item list-group-item-action bg-light">Courses</a>
                    <a href="${base}/dashboard/profile" class="list-group-item list-group-item-action bg-light">Profile</a>
                    <a href="${base}/dashboard/mail" class="list-group-item list-group-item-action bg-light">Mail</a>

                    <a href="${base}/admin/dashboard" class="list-group-item list-group-item-action bg-light">Admin</a>
                    <a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h2 style="text-aligh:center">Online School Dashboard</h2>
                </nav>

                <div class="container-fluid">
                    <h1 class="mt-4">Add Course Content files</h1>
                    <input  type="file" id="fileSelect" />
                    <button style="margin-top:10px;" class="btn btn-success" onclick="uploadFiles()" >Uplaod</button>
                <form action="${base}/dashboard/addcontentfiles"  modelAttribute="contentfile" method="POST">
                	<input type="number" style="display: none" name="courses.id" value="${course.id}">
                	<p id="alert" style="color:red;">*Only pdf file allowed</p>
                	<div class="form-group">
                		<label>File Name</label>
                		<input type="text" class="form-control" name="fileName">
                	</div>
                		<input id="fileurl" type="text" style="display: none" class="form-control" name="fileUrl">
                	<div class="form-group">
                		<input class="btn btn-primary" type="submit" value="Submit" >
                	</div>
                </form>

                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="${base}/css/dash/vendor/jquery/jquery.min.js"></script>
        <script src="${base}/css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



    </body>

    <script type="text/javascript">
                function uploadFiles() {
                    var formData = new FormData();
                    var fileSelect = document.getElementById("fileSelect");

                    if (fileSelect.files && fileSelect.files.length === 1) {
                        var file = fileSelect.files[0];
                        console.log(file);
                        formData.set("file", file, file.name);
                    }
                    console.log("Hello");
                    var request = new XMLHttpRequest();
                    console.log("Hello");
                    request.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            console.log(this.responseText);
                            var data = JSON.parse(this.responseText);
                            document.getElementById('fileurl').value = data.filename;
                            document.getElementById('alert').innerHTML="File Uploaded";
                            document.getElementById('alert').style.color = "green";

                        }
                    };
                    request.open('POST', "${base}/dashboard/contentfileUpload", true);
                    request.send(formData);
                }
                </script>

</html>
