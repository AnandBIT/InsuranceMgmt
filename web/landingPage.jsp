<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test="${user == null}">
    <c:redirect url="login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link href="css/header.css" rel="stylesheet">-->
        <link rel="stylesheet" href="css/all.min.css">
        <link rel="stylesheet" href="css/reset-min.css">
        <link rel="stylesheet" href="css/algolia-min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/docs.min.css">
        <link rel="stylesheet" href="css/index.css">
        <title>Insurance Claim Management</title>
    </head>

    <jsp:include page="menu.jsp"></jsp:include>

        <main class="px-4 py-2">
            <div id="myMsg"></div>
            <div class="pt-2 table-responsive" style="max-height: 30vh">
                <table
                    class="table table-bordered border-primary rounded table-hover"
                    >
                    <thead class="table-dark">
                        <tr class="align-middle">
                            <th scope="col">FNOL Id</th>
                            <th scope="col">Policy Holder's Email</th>
                            <th scope="col">Policy Number</th>
                            <th scope="col">Description</th>
                            <th scope="col">Vehicle Number</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider border-primary">
                    <c:forEach var="fnol" items="${fnolList}">
                        <tr>
                            <th scope="row">${fnol.getFnolId()}</th>
                            <td>${fnol.getEmail()}</td>
                            <td>${fnol.getPolicyNumber()}</td>
                            <td>${fnol.getDescription()}</td>
                            <td>${fnol.getVehicleNumber()}</td>
                            <td>
                                <div>
                                    <c:choose>
                                        <c:when test="${user.getRoleId()>1}">
                                            <c:choose>
                                                <c:when test="${fnol.getStatus()==2 && user.getRoleId()==3}">
                                                    <a href="#" onclick="sanctionClaim(event, ${fnol.getFnolId()}, 3)">
                                                        Sanction
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="GetClaimDetails" class='<c:if test="${fnol.getStatus()==4}">link-danger</c:if>' onclick="fetchClaimDetails(event, ${fnol.getFnolId()})">
                                                        ${fnol.getStatusInfo()}
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${fnol.getStatus()==4}">
                                                    <span class="text-danger">
                                                        ${fnol.getStatusInfo()}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${fnol.getStatusInfo()}
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="display: grid; grid-template-columns: repeat(2, 1fr); grid-auto-rows: 50vh;" class="d-none gap-2 my-2" id="verificationBox">
            <div id="claimDetails" class="text-bg-dark p-5 d-flex flex-column justify-content-center">

            </div>
            <div class="d-flex flex-column gap-2 text-bg-dark p-2">
                <div id="insuranceDetails" class="text-bg-light overflow-scroll p-2 flex-grow-1 flex-shrink-0" style="flex-basis: 50%">

                </div>
                <div id="dmvDetails" class="text-bg-light overflow-scroll p-2 flex-shrink-1">

                </div>
            </div>
        </div>

    </main>
    <script>
        function fetchClaimDetails(event, fnolId) {
            event.preventDefault();
            verificationBox.classList.remove('d-none');
            fetch('GetClaimDetails?fnolId=' + fnolId).then(res => res.text()).then(data => {
                claimDetails.innerHTML = data;
            });
        }

        function getInsuranceDetails() {
            fetch('GetInsuranceDetails').then(res => res.text()).then(data => {
                insuranceDetails.innerHTML = data;
            });
        }

        function getDMVDetails() {
            fetch('GetDMVDetails').then(res => res.text()).then(data => {
                dmvDetails.innerHTML = data;
            });
        }

        function updateStatus(fnolId, status) {
            fetch('UpdateStatus?status=' + status + '&fnolId=' + fnolId).then(res => res.text()).then(data => {
                myMsg.innerHTML = data;
            });
        }

        function sanctionClaim(event, fnolId, status) {
            event.preventDefault();
            fetch('SanctionClaim?status=' + status + '&fnolId=' + fnolId).then(res => res.text()).then(data => {
                myMsg.innerHTML = data;
            });
        }
    </script>