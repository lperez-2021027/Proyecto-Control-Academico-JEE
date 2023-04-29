
package com.luisperez.db;

/**
 *
 * @author Luis Carlos Pérez
 * @date 7/09/2022
 * @time 08:27:05
 * 
 *Código técnico: IN5BM
 *
 */

import javax.persistence.Persistence;
import javax.persistence.EntityManager;

public class ConexionPU {
    private static final String PERSISTENCE_UNIT_NAME = "control_estudiante_pu"; // nombre asignado en el archivo persistence.xml
    private EntityManager entityManager;
    private static ConexionPU instance;
    
    private ConexionPU() {
        try {
            entityManager = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME).createEntityManager();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
    }
    
    public static ConexionPU getInstance() {
        if (instance == null) {
            instance = new ConexionPU();
        }
        return instance;
    }
    
    public EntityManager getEntityManager() {
        return entityManager; // Atributo que posee la conexión a la base de datos
    }
}
