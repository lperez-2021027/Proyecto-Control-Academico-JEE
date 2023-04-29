<%-- 
    Document   : index
    Created on : 22/08/2022, 10:19:08
    Author     : Luis Carlos Pérez
    Código técnico: IN5BM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="es_GT" />

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Listar estudiantes</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-kinal.css"/>
    </head>
    <body>
        <header>
            <h1>Control Estudiante</h1>
        </header>

        <jsp:include page="../WEB-INF/encabezado.jsp" />

        <main>
            <section id="accions" class="py-4">
                <div class="container-fluid text-center">
                    <div class="row">
                        <div class="col-12">
                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">Agregar estudiantes</a>
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar estudiante</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <form method="POST" action="${pageContext.request.contextPath}/ServletEstudiante" class="was-validated"> 
                            <div class="modal-body">
                                <!-- el atributo method define de que manera viajara la informacion en el protocolo http (Get, Post) -->

                                <div class="mb-3">
                                    <label for="nombre" class="col-form-label">Nombres:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" required> <!-- parametro name utilizado para el request del servlet -->
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="col-form-label">Apellidos:</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="col-form-label">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>

                                <div class="mb-3">
                                    <label for="telefono" class="col-form-label">Telefono:</label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono" required maxlength="8">
                                </div>

                                <div class="mb-3">
                                    <label for="saldo" class="col-form-label">Saldo:</label>
                                    <input type="number" class="form-control" id="saldo" name="saldo" required step="any" min="0" max="100000">
                                </div>

                                <input type="hidden" value="insertar" id="accion" name="accion">


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar</button> <!<!-- type="submit" indica que al dar click en el boton los campos input iran al servlet -->
                            </div>
                            <!<!-- englobar los div modal-footer y div modal-body en la etiqueta form -->
                        </form>
                            
                    </div>
                </div>
            </div>

            <!-- Tabla con listado de estudiantes -->
            <section id="estudiante">
                <div class="container-fluid mt-1 mb-5 pb-5">
                    <div class="row">
                        <div class="col-12 col-md-9">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Listado de estudiantes</h4>
                                </div>
                            </div>
                            <table class="table table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre completo</th>
                                        <th>Email</th>
                                        <th>Saldo</th>
                                        <th>Editar registros</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Implementar un ciclo for utilizadndo la etiqueta importada 'c' -->
                                    <c:forEach items="${data}" var="estudiante">
                                        <tr>
                                            <td>${estudiante.id}</td>
                                            <td>${estudiante.nombre} ${estudiante.apellido}</td>
                                            <td>${estudiante.email}</td>
                                            <td>${estudiante.saldo}</td>
                                            <td>    
                                                <a class="btn btn-warning" href="${pageContext.request.contextPath}/ServletEstudiante?accion=editar&id=${estudiante.id}">
                                                    <i class="fa fa-edit"></i> Editar
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletEstudiante?accion=eliminar&carne=${estudiante.id}">
                                                    <i class="far fa-trash-alt"></i> Eliminar
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="card text-center bg-success text-white mb-3">
                                <div class="card-body">
                                    <h3>Saldo total</h3>
                                    <h4>${saldoTotal}</h4>
                                </div>
                            </div>
                            <div class="card text-center bg-primary text-white mb-3">
                                <div class="card-body">
                                    <h3>Total de estudiantes:</h3>
                                    <h4>${totalEstudiantes}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <jsp:include page="../WEB-INF/pie-pagina.jsp"/>

        <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
        <script src="https://kit.fontawesome.com/04a0d4ff34.js" crossorigin="anonymous"></script>
    </body>

</html>

