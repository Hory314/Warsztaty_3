<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./../template/header.jsp"/>

<ol class="breadcrumb">
    <li class="breadcrumb-item active">Rozwiązania</li>
</ol>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Rozwiązania
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Utworzono</th>
                    <th>Zaktualizowano</th>
                    <th>Rozwiązanie</th>
                    <th>Zadanie</th>
                    <th>Dodał</th>
                </tr>
                </thead>

                <tfoot>
                <tr>
                    <th>Utworzono</th>
                    <th>Zaktualizowano</th>
                    <th>Rozwiązanie</th>
                    <th>Zadanie</th>
                    <th>Dodał</th>
                </tr>
                </tfoot>

                <tbody>
                <c:forEach items="${solutions}" var="solution">
                    <tr>
                        <td>${solution.created}</td>
                        <td>${solution.updated}</td>
                        <c:set var="shortDesc" value="${solution.description}" scope="request"/>
                        <%
                            String str = (String) request.getAttribute("shortDesc");
                            if (str.length() > 256)
                            {
                                str = str.substring(0, 255); // 256 pierwszych znaków
                            }

                            request.setAttribute("shortDesc", str);
                        %>
                        <td>${shortDesc}... <a style="float: right;" href="<c:url value="/solution?id=${solution.id}"/>">przejdź
                            do
                            rozwiązania »</a></td>
                        <td>
                            <a href="<c:url value="/exercise/${solution.exercise.title}?id=${solution.exercise.id}" />">${solution.exercise.title}</a>
                        </td>
                        <td>
                            <a href="<c:url value="/user/${solution.user.username}?id=${solution.user.id}&limit=3" />">${solution.user.username}</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>

        </div>
    </div>
</div>
<jsp:include page="./../template/footer.jsp"/>

<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item active">Rozwiązania zadań</li>
</ol>

<!-- Page Content -->
<h1>Rozwiązania zadań</h1>
<hr>
<!--<p>This is a great starting point for new custom pages.</p>-->${login_info}


<jsp:include page="../template/footer.jsp"/>--%>