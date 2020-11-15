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
                </div>
            </div>

            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

               <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h2>Online School Dashboard</h2>
                </nav>

                <div class="container-fluid">
                    <h1 class="mt-4">Profile</h1>
                    <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                    <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID which will toggle the menu when clicked.</p>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="css/dash/vendor/jquery/jquery.min.js"></script>
        <script src="css/dash/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

    </body>

</html>
