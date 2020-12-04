<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}" />
<!DOCTYPE>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                    <h2 >Online School Dashboard</h2>
                </nav>
               <div class="container" style="margin:auto;width:60%">
               <h2 style="text-align: center;">Teachers Profile</h2>
               <div style="width:300px;margin:auto">
                   <img id="propic" src="${base}/img/teachers/t-1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="200"
                   style="margin-bottom:20px;">
                   <form>
                       <input  type="file" id="fileSelect" />
                   </form>
                   <button style="margin-top:10px;" class="btn btn-success" onclick="uploadImage()" >Uplaod</button>
               </div>

                <form  action="${base}/dashboard/addteacherproile" method="POST" modelAttribute="teacher">
                	<div class="form-group">
                	<input type="hidden" name="image" id="propicimage" value="${teacher.image}">
                    	<label>First Name</label>
                    	<input type="text" class="form-control" name="firstName" value="${teacher.firstName}">
                    </div>
                    <div class="form-group">
                    	<label>Last Name</label>
                    	<input type="text" class="form-control" name="lastName" value="${teacher.lastName}">
                    </div>
                    <div class="form-group">
                    	<label>Occupation</label>
                    	<input type="text" class="form-control" name="occupation" value="${teacher.occupation}">
                    </div>
                    <div class="form-group">
                        <label>Designation</label>
                        <input type="text" class="form-control" name="designation" value="${teacher.designation}">
                    </div>
                    <div class="form-group">
                        <label>Instituite</label>
                        <input type="text" class="form-control" name="institude" value="${teacher.institude}">
                    </div>
                    <div class="form-group">
                    	<label>Details</label>
                    	<textarea class="form-control" rows="5" name="details">${teacher.details}</textarea>
                    </div>
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

        <!-- Menu Toggle Script -->
        <script type="text/javascript">
            if('${teacher.image}'!= null){
                document.getElementById('propic').src="${base}/img/teachers/" + '${teacher.image}';
            }
        </script>

        <script type="text/javascript">
            function uploadImage() {
                var formData = new FormData();
                var fileSelect = document.getElementById("fileSelect");

                if (fileSelect.files && fileSelect.files.length === 1) {
                    var file = fileSelect.files[0];
                    console.log(file);
                    formData.set("image", file, file.name);
                }
                console.log("Hello");
                var request = new XMLHttpRequest();
                console.log("Hello");
                request.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        var data = JSON.parse(this.responseText);
                        document.getElementById("propicimage").value = data.iname;
                        document.getElementById("propic").src = "${base}/img/teachers/" + data.iname;
                    }
                };
                request.open('POST', "${base}/dashboard/teacherprofileImageUpload", true);
                request.send(formData);
            }
            </script>

    </body>

</html>
