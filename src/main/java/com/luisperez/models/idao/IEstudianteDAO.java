package com.luisperez.models.idao;

import com.luisperez.models.domain.Estudiante;
import java.util.List;

/**
 *
 * @author Luis Carlos Pérez
 * @date 30/08/2022
 * @time 08:55:00
 * Código técnico: IN5BM
 * 
 */
public interface IEstudianteDAO {
    
    /*
        Métodos abstractos
    */
    
    // Listar todos los registros
    public List<Estudiante> getAll();
    
    // Insertar un registro
    public int add(Estudiante estudiante);
    
    // Actualizar un registro
    public int update(Estudiante estudiante);
    
    // Eliminar un registro
    public int delete(Estudiante estudiante);
}
