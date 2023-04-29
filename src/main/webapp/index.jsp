<%-- 
    Document   : index
    Created on : 22/08/2022, 10:19:08
    Author     : Luis Carlos Pérez
    Código técnico: IN5BM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Fundación Kinal</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-kinal.css"/>
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css"/>
    </head>
    <body>
        <header>
            <!-- Aquí va el encabezado de la página-->
            <h1>Centro Educativo Técnico Laboral KINAL</h1>
        </header>

        <!-- encabezado, importado -->
        <jsp:include page="./WEB-INF/encabezado.jsp" />
        
        <br>
        <div class="container-sm">
            <div class="row">
                <div class="col-12">
                    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" class="active"
                                    aria-current="true" aria-label="Slide 4"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active text-center" >
                                <video src="./assets/video/Cursos Tecnicos - Fundación Kinal - Guatemala.mp4" class="size-img" autoplay muted loop></video>
                            </div>
                            <div class="carousel-item" >
                                <img src="./assets/images/slider1.jpg" class="d-block w-100 size-img" alt="...">
                            </div>
                            <div class="carousel-item" >
                                <img src="./assets/images/slider2.jpg" class="d-block w-100 size-img" alt="...">
                            </div>
                            <div class="carousel-item" >
                                <img src="./assets/images/slider3.jpg" class="d-block w-100 size-img" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <main>
            <!--Aquí va a ir el contenido principal de la página-->
            <section class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-12 col-sm-12">
                        <p class="descripcion fs-3">
                            Kinal es un Centro Educativo privado, no lucrativo, dirigido a la
                            formación técnica profesional de jóvenes y adultos, de beneficio
                            colectivo y asistencia social en favor de los sectores más
                            necesitados de la comunidad.
                        </p>
                        <p class="descripcion fs-3">
                            Nuestro valor fundamental es enseñar a realizar el trabajo bien
                            hecho, que sea la base de la superación de alumnos y el medio para
                            servir a los demás.
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 pb-5">
                        <br>
                    </div>
                </div>
            </section>
        </main>

        <jsp:include page="./WEB-INF/pie-pagina.jsp" />

        <script type="text/javascript" src="./assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
