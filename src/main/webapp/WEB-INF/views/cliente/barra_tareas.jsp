<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="currentUri" value="${pageContext.request.requestURI}"/>

<aside class="sidebar">
    <div class="logo">
        <h1>GymFlow</h1>
        <p>Tu Gimnasio Digital</p>
    </div>

    <nav class="nav-menu">
        <a href="/ver-inicio" class="nav-item <c:if test='${fn:contains(currentUri, "inicio")}'>active</c:if>">
            <i class="fas fa-home"></i> Principal
        </a>
        <a href="/ver-anuncio" class="nav-item <c:if test='${fn:contains(currentUri, "anuncio")}'>active</c:if>">
            <i class="fas fa-users"></i> Publicidad
        </a>
        <a href="/ver-membresias" class="nav-item <c:if test='${fn:contains(currentUri, "membresias")}'>active</c:if>">
            <i class="fas fa-id-card"></i> Catálogo de membresías
        </a>
        <a href="/ver-contacto" class="nav-item <c:if test='${fn:contains(currentUri, "contacto")}'>active</c:if>">
            <i class="fas fa-envelope"></i> Contacto
        </a>
        <a href="/ver-productos" class="nav-item <c:if test='${fn:contains(currentUri, "productos")}'>active</c:if>">
            <i class="fas fa-shopping-bag"></i> Catálogo de productos
        </a>
        <a href="/ver-pagos" class="nav-item <c:if test='${fn:contains(currentUri, "pagos")}'>active</c:if>">
            <i class="fas fa-credit-card"></i> Pagos
        </a>
    </nav>
</aside>