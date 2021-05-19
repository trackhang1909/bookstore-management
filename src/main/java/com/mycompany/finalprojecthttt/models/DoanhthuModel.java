package com.mycompany.finalprojecthttt.models;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity(name = "com.mycompany.finalprojecthttt.models.DoanhthuModel")
@Table(name = "doanhthu")
public class DoanhthuModel implements Serializable {
    @Id
    private int maDoanhthu;

    @Column
    private int maSach;

    @Column
    private int maTaiKhoan;

    @Column
    private int soLuong;

    @Column
    private int tongTien;
    
    @Column
    private String diachi;
    
    @Column
    private String sdt;
    
    public String getTenSach() {
        return SachDAO.get(maSach).getTenSach();
    }
    
    public String getTenTK() {
        return TaikhoanDAO.get(maTaiKhoan).getHoTen();
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public DoanhthuModel(int maSach, int maTaiKhoan, int soLuong, int tongTien, String diachi, String sdt) {
        this.maSach = maSach;
        this.maTaiKhoan = maTaiKhoan;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
        this.diachi = diachi;
        this.sdt = sdt;
    }

    public int getMaDoanhthu() {
        return maDoanhthu;
    }

    public void setMaDoanhthu(int maDoanhthu) {
        this.maDoanhthu = maDoanhthu;
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    public DoanhthuModel(int maSach, int maTaiKhoan, int soLuong, int tongTien) {
        this.maSach = maSach;
        this.maTaiKhoan = maTaiKhoan;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
    }

    public DoanhthuModel() {
    }

    
}