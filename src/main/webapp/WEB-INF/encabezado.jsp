<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Menú</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/carreras-tecnicas.jsp">Carreras técnicas</a>
                </li>
                <!<!-- Cuando se incluye el archivo en el index, es como si la direccion fuese en el index -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ServletEstudiante?accion=listar">Estudiantes</a> <!<!-- /estudiantes/estudiantes.jsp -->
                </li>
            </ul>
        </div>
    </div>
</nav>