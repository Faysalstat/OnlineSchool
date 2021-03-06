package model;
// Generated Sep 25, 2020 1:27:29 AM by Hibernate Tools 4.3.1

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
 * Coursecontent generated by hbm2java
 */
@Entity
@Table(name = "coursecontent",
         catalog = "bahaushi_Onlineschooldb"
)
public class Coursecontent implements java.io.Serializable {

    private Integer id;
    private Courses courses;
    private String content;
    private String lectureUrl;
    private String lectureLength;
    private String status;

    public Coursecontent() {
    }

    public Coursecontent(Courses courses, String content, String lectureUrl, String lectureLength, String status) {
        this.courses = courses;
        this.content = content;
        this.lectureUrl = lectureUrl;
        this.lectureLength = lectureLength;
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
    @JoinColumn(name = "course_id")
    public Courses getCourses() {
        return this.courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    @Column(name = "content")
    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "lecture_url")
    public String getLectureUrl() {
        return this.lectureUrl;
    }

    public void setLectureUrl(String lectureUrl) {
        this.lectureUrl = lectureUrl;
    }

    @Column(name = "lecture_length", length = 50)
    public String getLectureLength() {
        return this.lectureLength;
    }

    public void setLectureLength(String lectureLength) {
        this.lectureLength = lectureLength;
    }

    @Column(name = "status", length = 100)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
