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
@Entity(name = "com.mycompany.finalprojecthttt.models.NCCModel")
@Table(name = "nhacungcap")
public class NCCModel implements Serializable {

    @Id
    private int maNCC;
    @Column
    @Size(min = 1, max = 100, message = "Tên nhà cung cấp phải có từ 1 đến 100 ký tự")
    private String tenNCC;

    public int getMaNCC() {
        return maNCC;
    }

    public String getTenNCC() {
        return tenNCC;
    }

    public void setMaNCC(int maNCC) {
        this.maNCC = maNCC;
    }

    public void setTenNCC(String tenNCC) {
        this.tenNCC = tenNCC;
    }

    //Check foreign key
    public boolean check() {
        List<SachModel> a = SachDAO.getAll();
        List<NCCModel> b = NCCDAO.getAll();
        for (int i = 0; i < b.size(); i++) {
            for (int j = 0; j < a.size(); j++) {
                int a2 = a.get(j).getMaNCC();
                if (maNCC == a2) {
                    return true;
                }
            }
        }
        return false;
    }

}
