package model;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "contentfiles",
        catalog = "onlineschooldb"
)
public class ContentFiles {
    private Integer id;
    private Courses courses;
    private String fileName;
    private String fileUrl;

    public ContentFiles() {
    }

    public ContentFiles(Integer id,Courses courses, String file_name, String fileUrl) {
        this.id = id;
        this.courses=courses;
        this.fileName = fileName;
        this.fileUrl = fileUrl;
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
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Column(name = "file_url")
    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

}
