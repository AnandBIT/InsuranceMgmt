<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
    <head>
        <title>Employee Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Custom styles for this template -->
        <link href="css/header.css" rel="stylesheet">
        <!--<link href="css/carousel.css" rel="stylesheet">-->
    </head>
    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/StrutsEmpMgmt" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none" style="margin-right: 1rem">
                    <img src="https://www.exavalu.com/wp-content/themes/quincy/sds/assets/img/logo.png" width="150px" alt="Exavalu"></img>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <!--<li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>-->
                    <c:if test="${user.getRoleId()==1}">
                        <li><a href="LogFNOL" class="nav-link px-2 text-white">Log FNOL</a></li>
                        </c:if>
                        <c:if test="${user.getRoleId()>1}">
                        <li><a href="FetchPolicy" class="nav-link px-2 text-white">Fetch Policy</a></li>
                        <li><a href="FetchDMV" class="nav-link px-2 text-white">Fetch DMV</a></li>
                        </c:if>
                </ul>

                <div class="text-end d-flex align-items-center gap-1">

                    <span class="mx-2">
                        <c:if test="${user.roleId==1}">
                            ${user.getFirstName()} ${user.getLastName()}
                        </c:if>

                        <c:if test="${user.roleId==2}">
                            Underwriter
                        </c:if>

                        <c:if test="${user.roleId==3}">
                            Insurance Officer
                        </c:if>
                    </span>

                    <c:choose>
                        <c:when test="${user==null}">
                            <a href="login.jsp" class="text-decoration-none">
                                <button type="button" class="btn btn-outline-light me-2">Login</button>
                            </a>
                            <a href="SignUp" class="text-decoration-none">
                                <button type="button" class="btn btn-warning">Sign-up</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="Logout" class="text-decoration-none">
                                <button type="button" class="btn btn-outline-light me-2" >Log Out</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </header>