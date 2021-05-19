/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Trac Khang
 */
@Entity(name = "com.mycompany.finalprojecthttt.models.NhanXetModel")
@Table(name = "nhanxet")
public class NhanXetModel implements Serializable {
    
    @Id
    private int maNhanXet;
    @Column
    private String nhanXet;
    @Column
    private int maSach;
    @Column
    private int maTaiKhoan;
    
    public String getTenTK() {
        Taikhoan tk = TaikhoanDAO.get(maTaiKhoan);
        return tk.getHoTen();
    }

    public int getMaNhanXet() {
        return maNhanXet;
    }

    public String getNhanXet() {
        return nhanXet;
    }

    public int getMaSach() {
        return maSach;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaNhanXet(int maNhanXet) {
        this.maNhanXet = maNhanXet;
    }

    public void setNhanXet(String nhanXet) {
        this.nhanXet = nhanXet;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }
    
}
