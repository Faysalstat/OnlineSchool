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
        <link rel="stylesheet" href="${base}/css/custom.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                    <a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h2>Online School Dashboard</h2>
                </nav>

                <div class="container-fluid">
                    <!--<h1 class="mt-4">Add Course</h1>-->
                    <div class="container" style="width:70%;margin:auto">
                        <h2>Add a course</h2>
                        <form action="addcourse"  modelAttribute="course" method="POST">
                            <div class="form-group">
                                <label>Course Name:</label>
                                <!--<input type="hidden" name="teacher.user" value="$ {user}"/>-->
                                <input type="text" class="form-control" name="courseName" placeholder="Course Name">
                            </div>
                            <div class="form-group">
                                <label>Course Code</label>
                                <input type="text" class="form-control" name="courseCode" placeholder="Course Code">
                            </div>
                            <div class="form-group">
                                <label>Select Category:</label>
                                <select class="form-control" name="category">
                                    <option>Software & Programming</option>
                                    <option>Graphics and Editing</option>
                                    <option>Networking</option>
                                    <option>Database and data science</option>
                                    <option>Soft Skill</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Level:</label>
                                <select class="form-control" name="courseLevel">
                                    <option>Basic</option>
                                    <option>Intermediate</option>
                                    <option>Advanced</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Duration (in Hour)</label>
                                <input type="number" class="form-control" name="duration" placeholder="ex: 10 hour">
                            </div>
                            <div class="form-group">
                                <label>Starts from</label>
                                <input type="hidden" id="datevalue" name="startingDate" >
                                <input type="date" id="datepicker" onchange="formatedate()" name="startingDateString" value="2020-10-01"  class="form-control"  placeholder="pick a date">
                            </div>
                            <script>
                                function formatedate() {
                                    d = new Date(document.getElementById("datepicker").value);
                                    dt = d.getDate();
                                    mn = d.getMonth();
                                    yy = d.getFullYear();
                                    var months = [
                                        "Jan", "Feb", "Mar", "Apr",
                                        "May", "Jun", "Jul", "Aug",
                                        "Sept", "Oct", "Nov", "Dec"
                                    ];
                                    document.getElementById("datevalue").value = dt + " " + months[mn] + ", " + yy;
                                    console.log(dt + " " + months[mn] + ", " + yy);
                                }
                            </script>
                            <div class="form-group">
                                <label>Number of Lectures</label>
                                <input type="number" class="form-control" name="lecturesCount" >
                            </div>
                            <div class="form-group">
                                <label>Number of Quizzes</label>
                                <input type="number" class="form-control" name="quizCount">
                            </div>
                            <div class="form-group">
                                <label>Number of Students Capacity</label>
                                <input type="number" class="form-control" name="studentCapacity">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" name="price">
                                <input id="imagevalue" type="hidden" name="image" value="cu-1.jpg"/>
                            </div>
                            <div style="width:60%;margin:100px auto;border:1px solid black">
                                <div class="img-holder">
                                    <img src="${base}/img/course/cu-1.jpg" id="imgsrc" class="img-rounded upimg"/>
                                </div>
                                <div class="btn-holder" data-provides="fileupload">

                                    <input class="inputfile" type="file" id="fileSelect" >
                                    <label class=" btn btn-info " style="margin-top: 7px" for="fileSelect">Browse</label>
                                    <button class="btn btn-success" onclick="uploadImage();return false" >Uplaod</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Summery</label>
                                <textarea class="form-control" rows="5" name="courseSummary"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Requirements</label>
                                <textarea class="form-control" rows="5" name="requirements"></textarea>
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" type="submit" value="Submit" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <!--        <script src="css/dash/vendor/jquery/jquery.min.js"></script>
                <script src="css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
        <script>
            function uploadImage() {
                var formData = new FormData();
                var fileSelect = document.getElementById("fileSelect");
                if (fileSelect.files && fileSelect.files.length === 1) {
                    var file = fileSelect.files[0];
                    formData.set("image", file, file.name);
                }
                console.log("Hello");
                var request = new XMLHttpRequest();
                request.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        var data = JSON.parse(this.responseText);
                        document.getElementById("imagevalue").value = data.iname;
                        document.getElementById("imgsrc").src = "${base}/img/course/" + data.iname;
                    }
                };
                request.open('POST', '${base}/uploadcourseimage', true);
                request.send(formData);
            }
        </script>

    </body>

</html>
