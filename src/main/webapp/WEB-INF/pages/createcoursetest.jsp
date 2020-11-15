<%-- 
    Document   : createcoursetest
    Created on : Sep 3, 2020, 12:03:41 AM
    Author     : Faysal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container" style="width:70%;margin:auto">
            <h2>Create Course For test Purpose</h2>
            <form action="addcourse" modelAttribute="course" method="POST">
                <div class="form-group">
                    <label>Course Name:</label>
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
                <div style="width:50%;margin:100px auto;">
                    <div class="img-holder">
                        <img src="img/course/cu-1.jpg" id="imgsrc"   class="img-rounded upimg"/>
                    </div>
                    <div class="btn-holder" data-provides="fileupload">
                        
                        <input class="inputfile" type="file" id="fileSelect" style="width:0">
                        <label class=" btn btn-info " for="fileSelect">Browse</label>
                        <button class="btn btn-success" onclick="uploadImage();return false" >Uplaod</button>
                    </div>
                </div>
                <div class="form-group">
                    <label>Lecturer</label>
                    <input type="text" class="form-control" name="taughtby">
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
                    <input type="submit" value="Submit" >
                </div>


            </form>
        </div>
    </body>

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
                    document.getElementById("imagevalue").value = data.image;
                    document.getElementById("imgsrc").src = "img/course/" + data.image;
                }
            };
            request.open('POST', 'uploadcourseimage', true);
            request.send(formData);
        }
    </script>
</html>
