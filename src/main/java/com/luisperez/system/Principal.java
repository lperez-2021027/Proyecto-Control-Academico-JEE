package com.luisperez.system;

/**
 *
 * @author Luis Carlos Pérez
 */

import com.luisperez.models.dao.EstudianteDaoImpl;


public class Principal {
    
    public static void main (String [] args){
        EstudianteDaoImpl estudianteDaoImpl = new EstudianteDaoImpl();
        System.out.println(estudianteDaoImpl.getAll());
        System.out.println(estudianteDaoImpl.getAll().size());
        /*for (int i = 0; i < estudianteDaoImpl.getAll().size(); i++) {
            
        }*/
    }
    
}
