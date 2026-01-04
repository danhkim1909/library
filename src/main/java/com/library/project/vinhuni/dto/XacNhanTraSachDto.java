package com.library.project.vinhuni.dto;

import jakarta.validation.constraints.NotBlank;

public class XacNhanTraSachDto {
    private Integer tienPhat;
    private String lyDoPhat;
    private boolean daNopPhat;
    @NotBlank(message = "Ảnh không được để trống")
    private String anh;

    public Integer getTienPhat() {
        return tienPhat;
    }

    public void setTienPhat(Integer tienPhat) {
        this.tienPhat = tienPhat;
    }

    public String getLyDoPhat() {
        return lyDoPhat;
    }

    public void setLyDoPhat(String lyDoPhat) {
        this.lyDoPhat = lyDoPhat;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public boolean getDaNopPhat() {
        return daNopPhat;
    }

    public void setDaNopPhat(boolean daNopPhat) {
        this.daNopPhat = daNopPhat;
    }

}
