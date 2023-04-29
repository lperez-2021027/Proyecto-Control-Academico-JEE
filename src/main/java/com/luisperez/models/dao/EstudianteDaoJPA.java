package com.luisperez.models.dao;

/**
 *
 * @author Luis Carlos Pérez
 * @date 7/09/2022
 * @time 08:42:37
 *
 * Código técnico: IN5BM
 *
 */
import com.luisperez.db.ConexionPU;
import com.luisperez.models.domain.Estudiante;
import com.luisperez.models.idao.IEstudianteDAO;
import java.util.List;

public class EstudianteDaoJPA implements IEstudianteDAO {

    private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Estudiante> getAll() {
        return con.getEntityManager().createNamedQuery("Estudiante.findAll").getResultList();
    }

    @Override
    public int add(Estudiante estudiante) {
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(estudiante);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar insertar el siguiente registro : " + estudiante.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Estudiante estudiante) {
        int rows = 0;
        
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(estudiante);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int delete(Estudiante estudiante) {
        System.out.println(estudiante);
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin(); // Iniciando una transacción
            con.getEntityManager().remove(estudiante); // Se indica que se desea eliminar un registro 
            // el metodo remove requiere toda la información de un registro, no basta el id
            con.getEntityManager().getTransaction().commit(); // Cierra la transacción
            rows = 1; // Indicando que la sentencia se ejecuto sin problemas
        } catch (Exception e) {
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback(); // Regresar a todo lo anterior para conservar a como estaba la DB
        }
        return rows;
    }
    
    public Estudiante get(Estudiante estudiante) {
        return (Estudiante) con.getEntityManager().createNamedQuery("Estudiante.find").setParameter("id", estudiante.getId()).getSingleResult();
    }

}
