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

	<title>Admin-View Course</title>
	<link rel="shortcut icon" href="${base}/img/favicon.png" type="image/png">
	<!-- Bootstrap core CSS -->
	<link href="${base}/css/dash/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="${base}/css/dash/css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

	<%
	User admin = (User) session.getAttribute("admin");
	if (admin == null || !admin.getUserRole().equals("ADMIN")) {
	response.sendRedirect("login");
}
%>

<div class="d-flex" id="wrapper">

	<!-- Sidebar -->
	<div class="bg-light border-right" id="sidebar-wrapper">
		<div class="sidebar-heading">Dashboard</div>
		<div class="list-group list-group-flush">
        	<a href="${base}/admin/dashboard" class="list-group-item list-group-item-action bg-light">Dashboard</a>
        	<a href="${base}/admin/addTeacher" class="list-group-item list-group-item-action bg-light">Add Teacher</a>
        	<a href="${base}/dashboard/mail" class="list-group-item list-group-item-action bg-light">Mail</a>
        	<a href="${base}/dashboard/logout" class="list-group-item list-group-item-action bg-light">Log Out</a>
        </div>
	</div>

	<!-- /#sidebar-wrapper -->

	<!-- Page Content -->
	<div id="page-content-wrapper">

		<div class="container">
			<h2>${domain.courses.courseName}</h2>
			<p>All Contents are listed here</p>
			<table class="table table-bordered" style="background-color:white;">
				<thead>
					<tr>
						<th>Sn</th>
						<th>Lectures</th>
						<th>url</th>
						<th>Length in Minute</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${domain.coursecontents.size() !=0}">
					<c:forEach var="content" items="${domain.coursecontents}"  varStatus="cntentstatus" >
					<tr>
						<td>${cntentstatus.index+1}</td>
						<td>Lecture ${content.id}</td>
						<td>${content.lectureUrl}</td>
						<td>${content.lectureLength} Minutes</td>
						<td>

							<a href="${base}/admin/deletecont/${content.id}">
								<button class="btn btn-danger">X</button>
							</a>


						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="5" style="font-weight:bolder;text-align:center;font-size:20px;"> No Content Yet</td>
			</tr>
		</c:otherwise>
	</c:choose>
</tbody>
</table>

<p>All Files are listed here</p>
			<table class="table table-bordered" style="background-color:white;">
				<thead>
					<tr>
						<th>Sn</th>
						<th>File Name</th>
						<th>Url</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${domain.coursefiles.size() !=0}">
					<c:forEach var="files" items="${domain.coursefiles}"  varStatus="cntentstatus" >
					<tr>
						<td>${cntentstatus.index+1}</td>
						<td>${files.fileName}</td>
						<td>
						   <a href="${base}/files/${files.fileUrl}" target="_blank">
						    View to click here
						   </a>
						</td>
						<td>
							<a href="${base}/admin/deleteFile/${files.id}">
								<button class="btn btn-danger">X</button>
							</a>


						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="5" style="font-weight:bolder;text-align:center;font-size:20px;"> No Content Yet</td>
			</tr>
		</c:otherwise>
	</c:choose>
</tbody>
</table>
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
