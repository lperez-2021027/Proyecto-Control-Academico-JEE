<%-- 
    Document   : editar-estudiante
    Created on : 22/08/2022, 11:21:14
    Author     : Luis Carlos Pérez
    Código técnico: IN5BM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="es_GT" />

<!DOCTYPE html>
<html>
    <head>
        <title>Editar estudiante</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/css/hoja-estilo-kinal.css"/>
    </head>
    <body>
        <header>
            <h1>Editar Estudiante</h1>
        </header>
        <jsp:include page="../WEB-INF/encabezado.jsp" />

        <main> <!-- recomendable utilizar post -->
            <div class="container pb-5 pt-5">
                <div class="row">
                    <div class="col-1 col-md-2"></div>
                    <div class="col-10 col-md-8">

                        <!-- 
                        <div class="card bg-secondary text-light">
                            <div class="header text-center p-1">
                                <h4>Editar estudiante</h4>
                            </div>
                        </div>
                        -->


                        <form method="POST" action="${pageContext.request.contextPath}/ServletEstudiante" class="was-validated">

                            <div class="container pt-4 pb-4">   
                                <div class="row">
                                    <div class="col-4 text-center">
                                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletEstudiante?accion=listar">
                                            <i class="fa fa-arrow-left"></i> Regresar | Cancelar
                                        </a>
                                    </div>
                                    <div class="col-4 text-center">
                                        <button type="submit" class="btn btn-success">
                                            <i class="fas fa-check"></i> Guardar cambios
                                        </button>
                                    </div>
                                    <div class="col-4 text-center">
                                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletEstudiante?accion=eliminar&carne=${estudiante.id}">
                                            <i class="fa fa-trash-alt"></i> Eliminar alumno
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-b ody">
                                <!-- el atributo method define de que manera viajara la informacion en el protocolo http (Get, Post) -->
                                <div class="mb-3">
                                    <label for="id" class="col-form-label">Id:</label>
                                    <input type="text" class="form-control" id="id" name="id" value="${estudiante.getId()}" readonly="true"> <!-- parametro name utilizado para el request del servlet -->
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="col-form-label">Nombres:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" value="${estudiante.nombre}" required> <!-- parametro name utilizado para el request del servlet -->
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="col-form-label">Apellidos:</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" value="${estudiante.getApellido()}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="col-form-label">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${estudiante.getEmail()}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="telefono" class="col-form-label">Telefono:</label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono" value="${estudiante.telefono}" required maxlength="8">
                                </div>

                                <div class="mb-3">
                                    <label for="saldo" class="col-form-label">Saldo:</label>
                                    <input type="number" class="form-control" id="saldo" name="saldo"  required step="any" min="0" max="100000" value="${estudiante.getSaldo()}">
                                </div>

                                <input type="hidden" name="accion" value="actualizar">

                            </div>

                            <div class="modal-footer pt-3">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-6 text-center">
                                            <button type="submit" class="btn btn-success">
                                                <i class="fas fa-check"></i> Guardar cambios
                                            </button>
                                            <!-- 
                                            <a class="btn btn-succes" href="${pageContext.request.contextPath}/ServletEstudiante?accion=listar">
                                                <i class="fas fa-check"></i> Guardar cambiosssss
                                            </a> 
                                            -->
                                            
                                        </div>
                                        <div class="col-6 text-center">
                                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletEstudiante?accion=eliminar&carne=${estudiante.id}">
                                                <i class="fa fa-trash-alt"></i> Eliminar alumno
                                            </a>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <button type="button" class="btn btn-secondary p-2" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary p-2">Guardar</button> 
                            <!-- type="submit" indica que al dar click en el boton los campos input iran al servlet --> 
                        </form>
                    </div>

                    <div class="col-1 col-md-2"></div>
                </div>
            </div>
        </main>

        <jsp:include page="../WEB-INF/pie-pagina.jsp"/>

        <script type="text/javascript" src="../assets/js/bootstrap.bundle.js"></script>
        <script src="https://kit.fontawesome.com/04a0d4ff34.js" crossorigin="anonymous"></script>
    </body>
</html>
