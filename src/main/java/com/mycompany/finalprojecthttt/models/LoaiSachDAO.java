/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

import com.mycompany.finalprojecthttt.hibernate.HibernateUtils;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Trac Khang
 */
public class LoaiSachDAO {

    public static List<LoaiSachModel> getAll() {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<LoaiSachModel> ls = sess.createQuery("select e from " + LoaiSachModel.class.getName() + " e").list();
        sess.getTransaction().commit();
        return ls;
    }

    public static LoaiSachModel get(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<LoaiSachModel> ls = sess.createQuery("select e from " + LoaiSachModel.class.getName() + " e where e.maLoaiSach=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls.get(0);
    }

    public static void add(LoaiSachModel model) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        sess.saveOrUpdate(model);
        sess.getTransaction().commit();
    }

    public static int delete(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        int num = sess.createQuery("delete from " + LoaiSachModel.class.getName() + " where maLoaiSach=:id")
                .setParameter("id", id).executeUpdate();
        sess.getTransaction().commit();
        return num;
    }

}
