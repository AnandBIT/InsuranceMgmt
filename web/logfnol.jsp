<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test="${user == null}">
    <c:redirect url="login.jsp" />
</c:if>

<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <%@taglib prefix="s" uri="/struts-tags"%>
    <body class="text-center flex-column p-0">
        <div class="w-100">
            <jsp:include page="menu.jsp"></jsp:include>
            </div>
            <main class="form-signin w-100 m-auto">
                <form action="LogFNOL" method="post">
                    <h1 class="h3 mb-3 fw-normal">Please give accident info</h1>

                    <div class="form-floating">
                        <input name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com" value="${user.getEmail()}" readonly="true" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input name="policyNumber" type="text" class="form-control rounded-0" id="policyNumber" placeholder="Policy Number" required>
                    <label for="policyNumber">Policy Number</label>
                </div>
                <div class="form-floating">
                    <textarea rows="3" cols="15" name="description" class="form-control rounded-0" id="description" placeholder="Accident Description" required></textarea>
                    <label for="description">Description</label>
                </div>
                <div class="form-floating mb-3">
                    <input name="vehicleNumber" type="text" class="form-control rounded-top-0" id="vehicleNumber" placeholder="Vehicle Number" required>
                    <label for="vehicleNumber">Vehicle Number</label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Log FNOL</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017?2022</p>
            </form>
        </main>
    </body>
</html>
