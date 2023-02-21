<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <%@taglib prefix="s" uri="/struts-tags"%>
    <body class="text-center d-flex flex-column pt-0">
        <div class="w-100">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <main class="form-signin w-100 m-auto">
            <form action="Login" method="post">
                <img class="mb-4" src="https://www.mulesoft.com/sites/default/files/2020-12/Exavalu%20Logo.png" alt="" height="57">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating">
                    <input name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>

                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017-2023</p>
            </form>
        </main>
    </body>
</html>
