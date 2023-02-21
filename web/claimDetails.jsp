<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "now" value = "<%= new java.util.Date()%>" />

<div class="d-flex flex-column gap-2 mb-3">
    <span>FNOL ID : ${fnolId}</span>
    <span>FNOL Created by : Anand Kumar</span>
    <span>
        FNOL Created at : <fmt:formatDate type = "date" value = "${now}" />
    </span>
</div>
<div class="gap-3 column-gap-4" style="display: grid; grid-template-columns: repeat(2, 1fr)">
    <button type="button" class="btn btn-primary w-100" onclick="getInsuranceDetails()">
        Check Insurance Validity
    </button>
    <button type="button" class="btn btn-primary w-100" onclick="getDMVDetails()">
        Check DMV Validity
    </button>

    <button type="button" class="btn btn-success w-100" onclick="updateStatus(${fnolId}, 2)">
        Approve
    </button>
    <button type="button" class="btn btn-danger w-100" onclick="updateStatus(${fnolId}, 4)">
        Reject
    </button>
</div>