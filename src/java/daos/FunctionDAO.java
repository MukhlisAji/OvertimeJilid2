/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import tools.HibernateUtil;
/**
 *
 * @author Mukhlish
 */
public class FunctionDAO {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private Session session;
    private Transaction transaction;

    public FunctionDAO() {
    }

    public FunctionDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean insertOrUpdateOrDelete(Object object,
            boolean isDelete) {
        boolean result = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            if (isDelete) {
                session.delete(object);
            } else {
                session.saveOrUpdate(object);
            }
            result = true;
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    public boolean updateStatus(String Status, String oldStatus) {
        boolean result = false;

        String query = ("update Overtime set Status = '" + Status + "' where Status = '" + oldStatus + "' ");
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            System.out.println(query);
            session.createQuery(query);
            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    public List<Object> getDatas(Object entities, String key) {
        List<Object> rs = new ArrayList<>();
        String className = entities.getClass().getName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "From " + className;

        if (!key.equals("")) {
            query = getQuery(entities, key, query);
        }
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }

    public String getQuery(Object entities, String key, String query) {
        String className = entities.getClass().getName();
        query += " WHERE ";
        for (Object r : entities.getClass().getDeclaredFields()) {
            String field = r + "";
            if (!field.contains("UID") && !field.contains("List")) {
                field = field.substring(field.lastIndexOf(".") + 1);
                query += field + " LIKE '%" + key + "%' OR ";
            }
        }
        query = query.substring(0, query.lastIndexOf("OR")) + " ORDER BY 1";

        return query;
    }

    /**
     *
     * @param query
     * @return
     */
    public Object getById(Object table, Object id) {
        Object object = new Object();
        String className = table.getClass().getName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "FROM " + className + " where " + className.toLowerCase() + "Id =" + id;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

    public Object getByNIK(Object entities, Object NIK) {
        Object object = new Object();
        String className = entities.getClass().getName();
        className = className.substring(className.lastIndexOf(".") + 1);
        String query = ("From " + className + " WHERE NIK = " + "'" + NIK + "'");

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query)
                    .uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

    public Object login(Object entities, String nik) {
        Object object = new Object();
//        boolean result = false;
        String className = entities.getClass().getName();
        className = className.substring(className.lastIndexOf(".") + 1);
        String query = ("From " + className + " WHERE nik = '" + nik + "'");

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            transaction.commit();
//            System.out.println(query);
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
    
    public Object getMax(Object entities, Object field){
        Object object = new Object();
        String className = entities.getClass().getSimpleName();
        String query = ("SELECT Max("+ field +")+1 FROM " + className);

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
}
