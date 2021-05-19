/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import com.mycompany.finalprojecthttt.hibernate.HibernateUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;
import javax.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author deptr
 */
public class TaikhoanDAO {

    public static Taikhoan get(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<Taikhoan> ls = sess.createQuery("select e from " + Taikhoan.class.getName() + " e where e.maTaiKhoan=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls.get(0);
    }

    public static Taikhoan getAccount(String tenDangNhap, String matKhau) throws SQLException {
//        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
//        session.getTransaction().begin();
//        
//
//        List<Taikhoan> account = (List<Taikhoan>) session.getNamedQuery("Taikhoan.findByAccount").setParameter("tenDangNhap", tenDangNhap).setParameter("matKhau", matKhau).list();
//
//        session.getTransaction().commit();
//        if (account.size() > 0){
//            return account.get(0);
//        } else {
//            return null;
//        }
        Statement stmt;
        ResultSet rs;
        ArrayList<Taikhoan> list;
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fphttt?useSSL=false&serverTimezone=UTC", "root", "")) {

            list = new ArrayList<>();
            stmt = con.createStatement();

            rs = stmt.executeQuery("select maTaiKhoan, hoTen, gioiTinh, tenDangNhap, matKhau, role from taikhoan where tenDangNhap = '" + tenDangNhap + "' and matKhau = '" + matKhau + "'");
            while (rs.next()) {

                Taikhoan acc = new Taikhoan();

                acc.setMaTaiKhoan(rs.getInt(1));
                acc.setHoTen(rs.getString(2));
                acc.setGioiTinh(rs.getInt(3));
                acc.setTenDangNhap(rs.getString(4));
                acc.setMatKhau(rs.getString(5));
                acc.setRole(rs.getInt(6));

                list.add(acc);
            }
            rs.close();
            stmt.close();
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list.get(0);
        }
    }

    public static boolean findTenDangNhap(String tenDangNhap) {

        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();

        List<Taikhoan> account = (List<Taikhoan>) session.getNamedQuery("Taikhoan.findByTenDangNhap").setParameter("tenDangNhap", tenDangNhap).list();

        session.getTransaction().commit();

        if (account.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static void addAccount(Taikhoan tk) throws SQLException {

        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();

        session.saveOrUpdate(tk);

        session.getTransaction().commit();
    }
}
