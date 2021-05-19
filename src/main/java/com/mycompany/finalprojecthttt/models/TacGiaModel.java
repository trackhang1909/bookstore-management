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
@Entity(name = "com.mycompany.finalprojecthttt.models.TacGiaModel")
@Table(name = "tacgia")
public class TacGiaModel implements Serializable {

    @Id
    private int maTacGia;
    @Column
    @Size(min = 1, max = 100, message = "Tên tác giả phải có từ 1 đến 100 ký tự")
    private String tenTacGia;

    public int getMaTacGia() {
        return maTacGia;
    }

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setMaTacGia(int maTacGia) {
        this.maTacGia = maTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    //Check foreign key
    public boolean check() {
        List<SachModel> a = SachDAO.getAll();
        List<TacGiaModel> b = TacGiaDAO.getAll();
        for (int i = 0; i < b.size(); i++) {
            for (int j = 0; j < a.size(); j++) {
                int a2 = a.get(j).getMaTacGia();
                if (maTacGia == a2) {
                    return true;
                }
            }
        }
        return false;
    }
}
