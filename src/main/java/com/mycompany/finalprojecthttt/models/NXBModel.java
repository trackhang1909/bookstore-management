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
@Entity(name = "com.mycompany.finalprojecthttt.models.NXBModel")
@Table(name = "nxb")
public class NXBModel implements Serializable {

    @Id
    private int maNXB;
    @Column
    @Size(min = 1, max = 100, message = "Tên nhà xuất bản phải có từ 1 đến 100 ký tự")
    private String tenNXB;

    public int getMaNXB() {
        return maNXB;
    }

    public String getTenNXB() {
        return tenNXB;
    }

    public void setMaNXB(int maNXB) {
        this.maNXB = maNXB;
    }

    public void setTenNXB(String tenNXB) {
        this.tenNXB = tenNXB;
    }

    //Check foreign key
    public boolean check() {
        List<SachModel> a = SachDAO.getAll();
        List<NXBModel> b = NXBDAO.getAll();
        for (int i = 0; i < b.size(); i++) {
            for (int j = 0; j < a.size(); j++) {
                int a2 = a.get(j).getMaNXB();
                if (maNXB == a2) {
                    return true;
                }
            }
        }
        return false;
    }

}
