/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 *
 * @author Trac Khang
 */
@Entity(name = "com.mycompany.finalprojecthttt.models.SachModel")
@Table(name = "sach")
public class SachModel implements Serializable {

    @Id
    private int maSach;
    @Column
    @Size(min = 1, max = 50, message = "Tên sách phải có từ 1 đến 50 ký tự và không trùng với danh sách")
    private String tenSach;
    @Column
    @Min(value = 1, message = "Mã loại sách phải có tối thiểu 1 ký tự khác 0")
    private int maLoaiSach;
    @Column
    @Min(value = 1, message = "Mã tác giả phải có tối thiểu 1 ký tự khác 0")
    private int maTacGia;
    @Column
    @Min(value = 1, message = "Giá tối thiểu là 1")
    private int gia;
    @Column
    @Min(value = 1, message = "Mã NXB phải có tối thiểu 1 ký tự khác 0")
    private int maNXB;
    @Column
    @Min(value = 4, message = "Năm xuất bản phải có tối thiểu 4 ký tự")
    private int namXB;
    @Column
    @Min(value = 1, message = "Trọng lượng tối thiểu là 1")
    private int trongLuong;
    @Column
    @Min(value = 2, message = "Số trang tối thiểu là 2")
    private int soTrang;
    @Column
    @Size(min = 5, max = 50, message = "Kích thước phải có từ 5 đến 50 ký tự")
    private String kichThuoc;
    @Column
    @Size(min = 6, max = 50, message = "Hình thức phải có từ 6 đến 50 ký tự")
    private String hinhThuc;
    @Column
    //@Size(min=5, max=100,message="Không được để trống hình ảnh")
    private String hinh1;
    @Column
    //@Size(min=5, max=100,message="Không được để trống hình ảnh")
    private String hinh2;
    @Column
    //@Size(min=5, max=100,message="Không được để trống hình ảnh")
    private String hinh3;
    @Column
    @Min(value = 1, message = "Mã nhà cung cấp phải có tối thiểu 1 ký tự khác 0")
    private int maNCC;
    @Column
    @Min(value = 1, message = "Mã tình trạng sách phải có tối thiểu 1 ký tự khác 0")
    private int maTTS;
    @Column
    @Size(min = 1, message = "Mô tả phải có ít nhất 1 ký tự")
    private String moTa;
    @Column
    @Min(value = 1, message = "Số lượng sách phải lớn hơn 0")
    private int soLuong;

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
    public String getLoaiSach(int id) {
        String loaiSach = LoaiSachDAO.get(id).getTenLoaiSach();
        return loaiSach;
    }

    public String getTacGia(int id) {
        String tacGia = TacGiaDAO.get(id).getTenTacGia();
        return tacGia;
    }

    public String getNXB(int id) {
        String nxb = NXBDAO.get(id).getTenNXB();
        return nxb;
    }

    public String getNCC(int id) {
        String ncc = NCCDAO.get(id).getTenNCC();
        return ncc;
    }

    public String getTTS(int id) {
        String tts = TTSachDAO.get(id).getTinhTrang();
        return tts;
    }

    public int getMaSach() {
        return maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public int getMaLoaiSach() {
        return maLoaiSach;
    }

    public int getMaTacGia() {
        return maTacGia;
    }

    public int getGia() {
        return gia;
    }

    public int getMaNXB() {
        return maNXB;
    }

    public int getNamXB() {
        return namXB;
    }

    public int getTrongLuong() {
        return trongLuong;
    }

    public int getSoTrang() {
        return soTrang;
    }

    public String getKichThuoc() {
        return kichThuoc;
    }

    public String getHinhThuc() {
        return hinhThuc;
    }

    public String getHinh1() {
        return hinh1;
    }

    public String getHinh2() {
        return hinh2;
    }

    public String getHinh3() {
        return hinh3;
    }

    public int getMaNCC() {
        return maNCC;
    }

    public int getMaTTS() {
        return maTTS;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public void setMaLoaiSach(int maLoaiSach) {
        this.maLoaiSach = maLoaiSach;
    }

    public void setMaTacGia(int maTacGia) {
        this.maTacGia = maTacGia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public void setMaNXB(int maNXB) {
        this.maNXB = maNXB;
    }

    public void setNamXB(int namXB) {
        this.namXB = namXB;
    }

    public void setTrongLuong(int trongLuong) {
        this.trongLuong = trongLuong;
    }

    public void setSoTrang(int soTrang) {
        this.soTrang = soTrang;
    }

    public void setKichThuoc(String kichThuoc) {
        this.kichThuoc = kichThuoc;
    }

    public void setHinhThuc(String hinhThuc) {
        this.hinhThuc = hinhThuc;
    }

    public void setHinh1(String hinh1) {
        this.hinh1 = hinh1;
    }

    public void setHinh2(String hinh2) {
        this.hinh2 = hinh2;
    }

    public void setHinh3(String hinh3) {
        this.hinh3 = hinh3;
    }

    public void setMaNCC(int maNCC) {
        this.maNCC = maNCC;
    }

    public void setMaTTS(int maTTS) {
        this.maTTS = maTTS;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

}
