package Dao;

import Interfaces.IProducto;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.TblProductosusti;

public class ClassProductoImp implements IProducto {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("ES_Coila");

    public void RegistrarProducto(TblProductosusti producto) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(producto);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void ActualizarProducto(TblProductosusti producto) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(producto);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void EliminarProducto(TblProductosusti producto) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            TblProductosusti prod = em.find(TblProductosusti.class, producto.getIdproductosusti());
            if (prod != null) {
                em.remove(prod);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<TblProductosusti> ListadoProductos() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT t FROM TblProductosusti t", TblProductosusti.class).getResultList();
        } finally {
            em.close();
        }
    }

    public TblProductosusti BuscarProducto(TblProductosusti producto) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(TblProductosusti.class, producto.getIdproductosusti());
        } finally {
            em.close();
        }
    }
}