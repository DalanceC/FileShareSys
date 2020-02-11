package com.hhit.bean;

public class FileSource {
    private Integer id;

    private String fileId;

    private String type;

    private String filePath;

    private String fileName;

    private String memberId;

    private String uploadTime;

    private String description;

    //查询文件的时候带上上传者（用户）的名字
    private Member member;

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId == null ? null : fileId.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId == null ? null : memberId.trim();
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime == null ? null : uploadTime.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @Override
    public String toString() {
        return "FileSource{" +
                "id=" + id +
                ", fileId='" + fileId + '\'' +
                ", type='" + type + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileName='" + fileName + '\'' +
                ", memberId='" + memberId + '\'' +
                ", uploadTime='" + uploadTime + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    public String toString2() {
        return "FileSource{" +
                "id=" + id +
                ", fileId='" + fileId + '\'' +
                ", type='" + type + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileName='" + fileName + '\'' +
                ", memberId='" + memberId + '\'' +
                ", uploadTime='" + uploadTime + '\'' +
                ", description='" + description + '\'' +
                '}' + "Member{" +
                "id=" + member.getId() +
                ", memberId='" + member.getMemberId() + '\'' +
                ", memberName='" + member.getMemberName() + '\'' +
                ", memberPassword='" + member.getMemberPassword() + '\'' +
                ", trueName='" + member.getTrueName() + '\'' +
                ", sex='" + member.getSex() + '\'' +
                ", email='" + member.getEmail() + '\'' +
                ", headImg='" + member.getHeadImg() + '\'' +
                '}';
    }
}