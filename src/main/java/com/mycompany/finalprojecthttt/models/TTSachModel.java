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
@Entity(name = "com.mycompany.finalprojecthttt.models.TTSachModel")
@Table(name = "tinhtrangsach")
public class TTSachModel implements Serializable {

    @Id
    private int maTTS;
    @Column
    @Size(min = 1, max = 100, message = "Tình trạng sách phải có từ 1 đến 100 ký tự")
    private String tinhTrang;

    public int getMaTTS() {
        return maTTS;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setMaTTS(int maTTS) {
        this.maTTS = maTTS;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    //Check foreign key
    public boolean check() {
        List<SachModel> a = SachDAO.getAll();
        List<TTSachModel> b = TTSachDAO.getAll();
        for (int i = 0; i < b.size(); i++) {
            for (int j = 0; j < a.size(); j++) {
                int a2 = a.get(j).getMaTTS();
                if (maTTS == a2) {
                    return true;
                }
            }
        }
        return false;
    }

}
