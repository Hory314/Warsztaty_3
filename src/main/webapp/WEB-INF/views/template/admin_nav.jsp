<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="sidebar navbar-nav">


    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/index.html"/>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Books</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <%--<h6 class="dropdown-header">Login Screens:</h6>--%>
            <a class="dropdown-item" href="<c:url value="/book/form"/>">Add</a>
            <a class="dropdown-item" href="<c:url value="/book/list"/>">List</a>

            <%--<a class="dropdown-item" href="forgot-password.html">Forgot Password</a>--%>
            <%--<div class="dropdown-divider"></div>--%>
            <%--<h6 class="dropdown-header">Other Pages:</h6>--%>
            <%--<a class="dropdown-item" href="404.html">404 Page</a>--%>
            <%--<a class="dropdown-item active" href="blank.html">Blank Page</a>--%>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/charts.html"/>">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/tables.html"/>">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>
</ul>
