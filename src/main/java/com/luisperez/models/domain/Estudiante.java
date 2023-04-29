package com.luisperez.models.domain;

/**
 *
 * @author Luis Carlos Pérez
 * @date 30/08/2022
 * @time 08:55:00 Código técnico: IN5BM
 *
 */

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity // Notación para indicar que esta clase es una entidad en la DB
@Table(name = "estudiantes") // Nombre de la tabla en la DB

@NamedQueries({
    // No es una sentencia SQL, se hace referencia a la misma clase Estudiante
    @NamedQuery(name = "Estudiante.findAll", query =  "from Estudiante"), 
    @NamedQuery(name = "Estudiante.find", query = "from Estudiante where id = :id") // ':id' es un párametro que se debe setear
})

public class Estudiante implements Serializable{ // La clase viajará en protocolo http, por ello se implementa la clase Serializable

    private static final long SERIAL_VERSION_UID = 1L;
    
    @Id // Notación para llaver primaria (PK) en la DB
    @Column(name = "id") // Escribir el nombre de la columna como se ha declarado en MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Indica que el valor es generado de manera automatica (el tipo de estrategia indica de que manera se genera el valor)
    private int id;
    
    @Column // Si el nombre del atributo es igual al nombre de la tabla en la base de datos es innecesario el atributo 'name'
    private String nombre;
    
    @Column
    private String apellido;
    
    @Column
    private String email;
    
    @Column
    private String telefono;
    
    @Column
    private double saldo;

    public Estudiante() {
    }

    public Estudiante(int id) {
        this.id = id;
    }

    public Estudiante(String nombre, String apellido, String email, String telefono, double saldo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.saldo = saldo;
    }

    public Estudiante(int id, String nombre, String apellido, String email, String telefono, double saldo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.saldo = saldo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", email=" + email + ", telefono=" + telefono + ", saldo=" + saldo + '}';
    }
}
