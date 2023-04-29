package com.luisperez.models.dao;

/**
 *
 * /**
 *
 * @author Luis Carlos Pérez
 * @date 30/08/2022
 * @time 11:43:00 Código técnico: IN5BM
 *
 *
 */

import com.luisperez.models.domain.Estudiante;
import com.luisperez.models.idao.IEstudianteDAO;
import com.luisperez.db.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class EstudianteDaoImpl implements IEstudianteDAO{

    private static final String SQL_SELECT = "select id, nombre, apellido, email, telefono, saldo from estudiantes";
    private static final String SQL_SELECT_BY_ID = "select id, nombre, apellido, email, telefono, saldo from estudiantes where id = ?";
    private static final String SQL_DELETE = "delete from estudiantes where id = ?";
    private static final String SQL_INSERT = "insert into estudiantes (nombre, apellido, email, telefono, saldo) values (?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "update estudiantes set nombre=?, apellido=?, email=?, telefono=?, saldo=? where id = ?";
    
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Estudiante estudiante = null;
    private List<Estudiante> listaEstudiantes = new ArrayList<>();
    
    @Override
    public List<Estudiante> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery(); // Para sentencias de tipo SELECT
            
            while (rs.next()) {
                estudiante = new Estudiante(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("email"), rs.getString("telefono"), rs.getDouble("saldo"));
                listaEstudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return listaEstudiantes;
    }

    @Override
    public int add(Estudiante estudiante) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            // pstmt = con.prepareStatement("insert into estudiantes (nombre, apellido, email, telefono, saldo) values (" + estudiante.getNombre() + ")"); No se recomienda concatenar
            pstmt = con.prepareStatement(SQL_INSERT);
            pstmt.setString(1, estudiante.getNombre());
            pstmt.setString(2, estudiante.getApellido());
            pstmt.setString(3, estudiante.getEmail());
            pstmt.setString(4, estudiante.getTelefono());
            pstmt.setDouble(5, estudiante.getSaldo());
            
            rows = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Se produjo un erro al intentar insertar el siguiente registro : " + estudiante.toString());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }
    
    public Estudiante get(Estudiante estudiante) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, estudiante.getId());
            rs = pstmt.executeQuery(); // Para sentencias de tipo SELECT
            
            while (rs.next()) {
                estudiante = new Estudiante(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("email"), rs.getString("telefono"), rs.getDouble("saldo"));
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return estudiante;
    }

    @Override
    public int update(Estudiante estudiante) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, estudiante.getNombre());
            pstmt.setString(2, estudiante.getApellido());
            pstmt.setString(3, estudiante.getEmail());
            pstmt.setString(4, estudiante.getTelefono());
            pstmt.setDouble(5, estudiante.getSaldo());
            pstmt.setInt(6, estudiante.getId());
            System.out.println(pstmt.toString());
            
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            System.err.println("Se produjo un erro al intentar actualizar el siguiente registro " + estudiante.toString());
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    @Override
    public int delete(Estudiante estudiante) {
        int rows = 0; // Variable que alamacenará la cantidad de lineas afectadas por la sentencia SQL
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, estudiante.getId()); // Determinando el id correpondiente al registro a eliminar
            System.out.print(pstmt.toString());
            rows = pstmt.executeUpdate(); // Si se logra eliminar un registro el valor retornado sera de 1 o >1
        } catch (SQLException e) {
            System.err.println("se produjo un erro al intentar eliminar el registro con el id" + estudiante);
            e.printStackTrace(System.out);
        } catch (Exception e){
            e.printStackTrace(System.out);
        }
        return rows;
    }
}