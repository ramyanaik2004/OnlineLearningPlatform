package model;

public class Course {

    private int id;
    private String title;
    private String description;
    private String duration;
    private String videoLink;

    public Course() {

    }

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getTitle() {

        return title;
    }

    public void setTitle(String title) {

        this.title = title;
    }

    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {

        this.description = description;
    }

    public String getDuration() {

        return duration;
    }

    public void setDuration(String duration) {

        this.duration = duration;
    }
    
    public String getVideoLink() {
        return videoLink;
    }
    
    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }
}