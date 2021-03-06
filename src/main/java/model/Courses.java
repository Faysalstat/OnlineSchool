package model;
// Generated Sep 6, 2020 12:05:52 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Courses generated by hbm2java
 */
@Entity
@Table(name = "courses",
         catalog = "bahaushi_Onlineschooldb"
)
public class Courses implements java.io.Serializable {

    private Integer id;
    private Teacher teacher;
    private String courseName;
    private String courseCode;
    private String category;
    private String courseLevel;
    private String duration;
    private Integer lecturesCount;
    private Integer quizCount;
    private String startingDate;
    private Integer studentCapacity;
    private Double price;
    private String courseSummary;
    private String requirements;
    private String image;
    private String status;

    public Courses() {
    }

    public Courses(String courseName, String courseCode) {
        this.courseName = courseName;
        this.courseCode = courseCode;
    }

    public Courses(Teacher teacher, String courseName, String courseCode, String category, String courseLevel, String duration, Integer lecturesCount, Integer quizCount, String startingDate, Integer studentCapacity, Double price, String courseSummary, String requirements, String image,String status) {
        this.teacher = teacher;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.category = category;
        this.courseLevel = courseLevel;
        this.duration = duration;
        this.lecturesCount = lecturesCount;
        this.quizCount = quizCount;
        this.startingDate = startingDate;
        this.studentCapacity = studentCapacity;
        this.price = price;
        this.courseSummary = courseSummary;
        this.requirements = requirements;
        this.image = image;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "taughtby")
    public Teacher getTeacher() {
        return this.teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Column(name = "course_name", nullable = false, length = 100)
    public String getCourseName() {
        return this.courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Column(name = "course_code", nullable = false, length = 40)
    public String getCourseCode() {
        return this.courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    @Column(name = "category", length = 40)
    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Column(name = "course_level", length = 40)
    public String getCourseLevel() {
        return this.courseLevel;
    }

    public void setCourseLevel(String courseLevel) {
        this.courseLevel = courseLevel;
    }

    @Column(name = "duration", length = 40)
    public String getDuration() {
        return this.duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Column(name = "lectures_count")
    public Integer getLecturesCount() {
        return this.lecturesCount;
    }

    public void setLecturesCount(Integer lecturesCount) {
        this.lecturesCount = lecturesCount;
    }

    @Column(name = "quiz_count")
    public Integer getQuizCount() {
        return this.quizCount;
    }

    public void setQuizCount(Integer quizCount) {
        this.quizCount = quizCount;
    }

    @Column(name = "starting_date", length = 10)
    public String getStartingDate() {
        return this.startingDate;
    }

    public void setStartingDate(String startingDate) {
        this.startingDate = startingDate;
    }

    @Column(name = "student_capacity")
    public Integer getStudentCapacity() {
        return this.studentCapacity;
    }

    public void setStudentCapacity(Integer studentCapacity) {
        this.studentCapacity = studentCapacity;
    }

    @Column(name = "price", precision = 10)
    public Double getPrice() {
        return this.price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Column(name = "course_summary")
    public String getCourseSummary() {
        return this.courseSummary;
    }

    public void setCourseSummary(String courseSummary) {
        this.courseSummary = courseSummary;
    }

    @Column(name = "requirements")
    public String getRequirements() {
        return this.requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    @Column(name = "image", length = 100)
    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    @Column(name = "status", length = 100)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
