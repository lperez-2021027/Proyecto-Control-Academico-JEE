package com.luisperez.controllers;


/**
 *
 * @author Luis Carlos Pérez
 * @Date 31/08/2022
 * @Time 09:31:00
 *
 */

import com.luisperez.models.dao.EstudianteDaoImpl;
import com.luisperez.models.dao.EstudianteDaoJPA;
import com.luisperez.models.domain.Estudiante;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletEstudiante")
public class ServletEstudiante extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarEstudiante(request, response);
                    break;
                case "actualizar":
                    actualizarEstudiante(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarEstudiantes(request, response);
                    break;
                case "editar":
                    editarEstudiante(request, response);
                    break;
                case "eliminar":
                    eliminarEstudiante(request, response);
                    break;
            }
        }
    }
    
    private double calcularSaldoTotal(List<Estudiante> listaEstudiantes) {
        double saldoTotal = 0;
        for (Estudiante estudiante : listaEstudiantes) {
            saldoTotal += estudiante.getSaldo();
        }
        return saldoTotal;
    }
    
    private void actualizarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        
        Estudiante estudiante = new Estudiante(id, nombre, apellido, email, telefono, saldo);
        
        System.out.println(estudiante.toString());
        
        // int registrosActualizados = new EstudianteDaoImpl().update(estudiante);
        int registrosActualizados = new EstudianteDaoJPA().update(estudiante);
        
        listarEstudiantes(request, response);
    }
    
    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        
        Estudiante estudiante = new Estudiante(nombre, apellido, email, telefono, saldo);
        System.out.println(estudiante.toString());
        
        // -- Con jdbc --
        // int registrosInsertados = new EstudianteDaoImpl().add(estudiante);
        
        int registrosInsertados = new EstudianteDaoJPA().add(estudiante);
        System.out.println(registrosInsertados);
        
        listarEstudiantes(request, response);
    }

    private void listarEstudiantes(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // List<Estudiante> listaEstudiantes = new EstudianteDaoImpl().getAll();  // Se instancia la clase EstudianteDaoImpl y se llama a su método static: getAll()
        
        List<Estudiante> listaEstudiantes = new EstudianteDaoJPA().getAll(); // Listando con la nueva clase EstudianteDaoJPA
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaEstudiantes); // (nombre_parametro, array_list)
        sesion.setAttribute("totalEstudiantes", listaEstudiantes.size());
        sesion.setAttribute("saldoTotal", calcularSaldoTotal(listaEstudiantes));
        response.sendRedirect("estudiantes/estudiantes.jsp"); // Como respuestale se envia la direccion de la pagina web
    }
    
    private void editarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Recuperar el id del estudiante
        int idEstudiante = Integer.parseInt(request.getParameter("id"));
        
        // Crear objeto de tipo estudiante
        Estudiante estudiante = new EstudianteDaoImpl().get(new Estudiante(idEstudiante));
        System.out.println("Método editar, ok");
        
        System.out.println(estudiante.toString());
        
        // request.setAttribute("estudiante", estudiante);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("estudiante", estudiante); // (clave, valor)
        response.sendRedirect(request.getContextPath() + "/" + "estudiantes/editar-estudiante.jsp");
        
        // request.getRequestDispatcher("estudiantes/editar-estudiante.jsp");
        // response.sendRedirect("estudiantes/editar-estudiante.jsp"); 
    }
    
    private void eliminarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idEstudiante = Integer.parseInt(request.getParameter("carne")); // Almacenando el id & con vertir String a int
        //Estudiante estudiante = new Estudiante(idEstudiante); // Seteando el id en el modelo de datos
        // Variable para almacenar el valor retornado
        //int registrosEliminados = new EstudianteDaoImpl().delete(estudiante); // Enviando el id como parametro
        Estudiante estudiante = new EstudianteDaoJPA().get(new Estudiante(idEstudiante));
        int registrosEliminados = new EstudianteDaoJPA().delete(estudiante);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un erro al intentar eliminar el registro = " + estudiante.toString());
        }
        listarEstudiantes(request, response);
    }
}