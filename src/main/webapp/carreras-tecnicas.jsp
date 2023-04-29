<%-- 
    Document   : carreras-tecnicas
    Created on : 22/08/2022, 10:25:59
    Author     : Luis Carlos Pérez
    Código técnico: IN5BM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Carreras Técnicas</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./assets/css/hoja-estilo-kinal.css"/>
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css"/>
    </head>
    <body>
        <header>
            <h1>Carreras técnicas</h1>
        </header>
        <jsp:include page="./WEB-INF/encabezado.jsp" />

        <main>
            <section class="container-fluid p-5">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                        <div class="card" style="width: 18rem;">
                            <img src="./assets/images/mecanica.webp" class="card-img-top" alt="mecanica">
                            <div class="card-body">
                                <h5 class="card-title">Mécanica automotriz</h5>
                                <p class="card-text">Autoestudio Universidad Honda Japón, mecanismos servo
                                    asistidos, mecánica de motores diésel y gasolina, sistemas de
                                    ignición e inyección. Diagnóstico computarizado.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                        <div class="card" style="width: 18rem;">
                            <img src="./assets/images/electricidad industrial.webp" class="card-img-top" alt="electricidad-industrial">
                            <div class="card-body">
                                <h5 class="card-title">Electricidad industrial</h5>
                                <p class="card-text">Cableado estructurado, instalaciones eléctricas domiciliares,
                                    comerciales e industriales, soldadura exotérmica,
                                    transferencias eléctricas, motores eléctricos, automatización
                                    industrial, domótica, energías renovables.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                        <div class="card" style="width: 18rem;">
                            <img src="./assets/images/electronica.webp" class="card-img-top" alt="electronica">
                            <div class="card-body">
                                <h5 class="card-title">Electrónica industrial</h5>
                                <p class="card-text">Electrónica analógica, digital y de potencia, micro
                                    controladores, máquinas eléctricas, controladores lógicos
                                    programables, redes industriales, electroneumática, robótica.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 text-center">

                        <div class="card" style="width: 18rem;">
                            <img src="./assets/images/informatica.webp" class="card-img-top" alt="informatica">
                            <div class="card-body">
                                <h5 class="card-title">Electrónica industrial</h5>
                                <p class="card-text">Desarrollo de aplicaciones web y móviles con Java, Microsoft,
                                    Visual Studio, Oracle y diseño de redes informáticas con Cisco
                                    System.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <br>
                </div>
            </section>
        </main>

        <jsp:include page="./WEB-INF/pie-pagina.jsp" />
    </body>
</html>