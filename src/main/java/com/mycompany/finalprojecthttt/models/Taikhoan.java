/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author deptr
 */
@Entity
@Table(name = "taikhoan", catalog = "fphttt", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"tenDangNhap"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Taikhoan.findAll", query = "SELECT t FROM Taikhoan t"),
    @NamedQuery(name = "Taikhoan.findByMaTaiKhoan", query = "SELECT t FROM Taikhoan t WHERE t.maTaiKhoan = :maTaiKhoan"),
    @NamedQuery(name = "Taikhoan.findByHoTen", query = "SELECT t FROM Taikhoan t WHERE t.hoTen = :hoTen"),
    @NamedQuery(name = "Taikhoan.findByGioiTinh", query = "SELECT t FROM Taikhoan t WHERE t.gioiTinh = :gioiTinh"),
    @NamedQuery(name = "Taikhoan.findByTenDangNhap", query = "SELECT t FROM Taikhoan t WHERE t.tenDangNhap = :tenDangNhap"),
    @NamedQuery(name = "Taikhoan.findByMatKhau", query = "SELECT t FROM Taikhoan t WHERE t.matKhau = :matKhau"),
    @NamedQuery(name = "Taikhoan.findByRole", query = "SELECT t FROM Taikhoan t WHERE t.role = :role")})
public class Taikhoan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "maTaiKhoan", nullable = false)
    private Integer maTaiKhoan;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "hoTen", nullable = false, length = 100)
    private String hoTen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gioiTinh", nullable = false)
    private int gioiTinh;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "tenDangNhap", nullable = false, length = 100)
    private String tenDangNhap;
    @Basic(optional = false)
    @NotNull
    @Size(min = 6, max = 100, message = "Mật khẩu phải lớn hơn 6 kí tự")
    @Column(name = "matKhau", nullable = false, length = 100)
    private String matKhau;
    @Basic(optional = false)
    @NotNull
    @Column(name = "role", nullable = false)
    private int role;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maTaiKhoan")
//    private Collection<Nhanxet> nhanxetCollection;

    public Taikhoan() {
    }

    public Taikhoan(Integer maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public Taikhoan(Integer maTaiKhoan, String hoTen, int gioiTinh, String tenDangNhap, String matKhau, int role) {
        this.maTaiKhoan = maTaiKhoan;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.role = role;
    }

    public Integer getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(Integer maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public int getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(int gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

//    @XmlTransient
//    public Collection<Nhanxet> getNhanxetCollection() {
//        return nhanxetCollection;
//    }
//
//    public void setNhanxetCollection(Collection<Nhanxet> nhanxetCollection) {
//        this.nhanxetCollection = nhanxetCollection;
//    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maTaiKhoan != null ? maTaiKhoan.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Taikhoan)) {
            return false;
        }
        Taikhoan other = (Taikhoan) object;
        if ((this.maTaiKhoan == null && other.maTaiKhoan != null) || (this.maTaiKhoan != null && !this.maTaiKhoan.equals(other.maTaiKhoan))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.finalprojecthttt.models.Taikhoan[ maTaiKhoan=" + maTaiKhoan + " ]";
    }

}
