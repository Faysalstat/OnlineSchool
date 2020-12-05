package model;

import java.util.ArrayList;
import java.util.List;

public class CourseDomain {
    private Courses courses;
    private List<Coursecontent> coursecontents = new ArrayList();
    private List<ContentFiles> coursefiles = new ArrayList();

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public List<Coursecontent> getCoursecontents() {
        return coursecontents;
    }

    public void setCoursecontents(List<Coursecontent> coursecontents) {
        this.coursecontents = coursecontents;
    }

    public List<ContentFiles> getCoursefiles() {
        return coursefiles;
    }

    public void setCoursefiles(List<ContentFiles> coursefiles) {
        this.coursefiles = coursefiles;
    }
}
