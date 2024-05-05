<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- 
	Librer�a: Bootstrap 5.3.3
 -->
 
 
<!--  ANTIGUO MENU
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/Inicio.jsp">Farma Plus</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Mantenimiento
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Clientes.jsp">Clientes</a></li>
            <li><a class="dropdown-item" href="#">Medicamentos</a></li>
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Proveedor.jsp">Proveedores</a></li>
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/empleado.jsp">Trabajadores</a></li>
            <li><a class="dropdown-item" href="#">Categorias</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/Vender.jsp">Ventas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/Inventario.jsp">Inventario</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Reportes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Ayuda</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
-->


<!-- NUEVA OPCI�N MEN� -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/Inicio.jsp">Farma Plus</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Mantenimiento
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Clientes.jsp">Clientes</a></li>
            <li><a class="dropdown-item" href="#">Medicamentos</a></li>
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Proveedor.jsp">Proveedores</a></li>
            <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/empleado.jsp">Trabajadores</a></li>
            <li><a class="dropdown-item" href="#">Categorias</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/Vender.jsp">Ventas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/Inventario.jsp">Inventario</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Reportes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Ayuda</a>
        </li>
      </ul>
      
      
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            ${empleado.getNom_usu()}
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
            <li style="text-align: center"><a class="dropdown-item">${empleado.getCorreo_emp()}</a></li>
            <li><hr class="dropdown-divider"></li>
            <li style="text-align: center">
            	<form class="dropdown-item" role="form" action="gestionAcceso" method="post">
        			<button class="btn btn-outline-success" type="submit" name="accion" value="Salir">Salir</button>
      			</form>
            </li>
          </ul>
        </li>
      
      </ul>
      
      
    </div>
  </div>
</nav>