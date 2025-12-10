package com.library.project.vinhuni.entity;

public class NoiDungEmail {

    private String nguoiNhan;
    private String noiDung;
    private String tieuDe;
    private String fileDinhKem;

    public NoiDungEmail() {
    }

    public NoiDungEmail(String nguoiNhan, String noiDung, String tieuDe, String fileDinhKem) {
        this.nguoiNhan = nguoiNhan;
        this.noiDung = noiDung;
        this.tieuDe = tieuDe;
        this.fileDinhKem = fileDinhKem;
    }

    public String getNguoiNhan() {
        return nguoiNhan;
    }

    public void setNguoiNhan(String nguoiNhan) {
        this.nguoiNhan = nguoiNhan;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getFileDinhKem() {
        return fileDinhKem;
    }

    public void setFileDinhKem(String fileDinhKem) {
        this.fileDinhKem = fileDinhKem;
    }
}