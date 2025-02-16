package Dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.TblUsuariosusti;

public class ClassUsuarioImp {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("ES_Coila");

    public TblUsuariosusti validarUsuario(String usuario, String password) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT u FROM TblUsuariosusti u WHERE u.usuariosusti = :usuario AND u.passwordsusti = :password", TblUsuariosusti.class)
                     .setParameter("usuario", usuario)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
}