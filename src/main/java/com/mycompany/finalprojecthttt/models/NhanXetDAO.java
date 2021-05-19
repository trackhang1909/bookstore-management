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
public class NhanXetDAO {
    
    public static List<NhanXetModel> getAll() {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<NhanXetModel> ls = sess.createQuery("select e from " + NhanXetModel.class.getName() + " e").list();
        sess.getTransaction().commit();
        return ls;
    }

    public static NhanXetModel get(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<NhanXetModel> ls = sess.createQuery("select e from " + NhanXetModel.class.getName() + " e where e.maNhanXet=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls.get(0);
    }
    
    public static List<NhanXetModel> gets(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<NhanXetModel> ls = sess.createQuery("select e from " + NhanXetModel.class.getName() + " e where e.maSach=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls;
    }

    public static void add(NhanXetModel model) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        sess.saveOrUpdate(model);
        sess.getTransaction().commit();
    }

    public static int delete(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        int num = sess.createQuery("delete from " + NhanXetModel.class.getName() + " where maNhanXet=:id")
                .setParameter("id", id).executeUpdate();
        sess.getTransaction().commit();
        return num;
    }
    
}
