<div class="fixed-bottom alert alert-danger alert-dismissible danger">
    <button type="button" class="btn-close danger" data-bs-dismiss="alert"></button>
    <strong>Error! </strong>
    <c:forEach var="error" items="${errors}">
        <ul>
            <li>${error} </li>
        </ul>
    </c:forEach>
</div>