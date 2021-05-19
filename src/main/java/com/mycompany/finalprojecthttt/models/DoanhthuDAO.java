package com.mycompany.finalprojecthttt.models;

import java.util.List;

import com.mycompany.finalprojecthttt.hibernate.HibernateUtils;

import org.hibernate.Session;

public class DoanhthuDAO {
    public static List<DoanhthuModel> getAll() {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<DoanhthuModel> ls = sess.createQuery("select e from " + DoanhthuModel.class.getName() + " e").list();
        sess.getTransaction().commit();
        return ls;
    }

    public static DoanhthuModel get(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        List<DoanhthuModel> ls = sess.createQuery("select e from " + DoanhthuModel.class.getName() + " e where e.maDoanhthu=:id")
                .setParameter("id", id).list();
        sess.getTransaction().commit();
        return ls.get(0);
    }

    public static void add(DoanhthuModel model) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        sess.saveOrUpdate(model);
        sess.getTransaction().commit();
    }

    public static int delete(int id) {
        Session sess = HibernateUtils.getSessionFactory().getCurrentSession();
        sess.getTransaction().begin();
        int num = sess.createQuery("delete from " + DoanhthuModel.class.getName() + " where maDoanhthu=:id")
                .setParameter("id", id).executeUpdate();
        sess.getTransaction().commit();
        return num;
    }
}