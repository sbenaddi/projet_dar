package model.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.bo.Avatar;
import model.bo.Utilisateur;
import utils.HibernateUtil;

public class UtilsDao {

	public Avatar saveAvatar(Avatar avatar) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(avatar);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return avatar;
	}

	public Utilisateur updateUser(Utilisateur user) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.saveOrUpdate(user);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return user;
		
	}

}
