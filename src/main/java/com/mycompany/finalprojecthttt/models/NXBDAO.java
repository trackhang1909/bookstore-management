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
public class NXBDAO {

    public static List<NXBModel> getAll() {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<NXBModel> ls = sess.createQuery("select e from " + NXBModel.class.getName() + " e").list();
        sess.getTransaction().commit();
        return ls;
    }

    public static NXBModel get(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<NXBModel> ls = sess.createQuery("select e from " + NXBModel.class.getName() + " e where e.maNXB=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls.get(0);
    }

    public static void add(NXBModel model) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        sess.saveOrUpdate(model);
        sess.getTransaction().commit();
    }

    public static int delete(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        int num = sess.createQuery("delete from " + NXBModel.class.getName() + " where maNXB=:id")
                .setParameter("id", id).executeUpdate();
        sess.getTransaction().commit();
        return num;
    }

}
