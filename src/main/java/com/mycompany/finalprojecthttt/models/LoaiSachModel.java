/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Trac Khang
 */
@Entity(name = "com.mycompany.finalprojecthttt.models.LoaiSachModel")
@Table(name = "loaisach")
public class LoaiSachModel implements Serializable {

    @Id
    private int maLoaiSach;
    @Column
    @Size(min = 1, max = 100, message = "Tên loại sách phải có từ 1 đến 100 ký tự")
    private String tenLoaiSach;

    public int getMaLoaiSach() {
        return maLoaiSach;
    }

    public String getTenLoaiSach() {
        return tenLoaiSach;
    }

    public void setMaLoaiSach(int maLoaiSach) {
        this.maLoaiSach = maLoaiSach;
    }

    public void setTenLoaiSach(String tenLoaiSach) {
        this.tenLoaiSach = tenLoaiSach;
    }

    //Check foreign key
    public boolean check() {
        List<SachModel> a = SachDAO.getAll();
        List<LoaiSachModel> b = LoaiSachDAO.getAll();
        for (int i = 0; i < b.size(); i++) {
            for (int j = 0; j < a.size(); j++) {
                int a2 = a.get(j).getMaLoaiSach();
                if (maLoaiSach == a2) {
                    return true;
                }
            }
        }
        return false;
    }

}
