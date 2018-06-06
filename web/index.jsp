<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="System of control Monitoring">
        <meta name="author" content="Group Tasami">
        <title>Tasami</title>
        <!-- Bootstrap core CSS-->
        <link href="Public/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="Public/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="Public/css/sb-admin.css" rel="stylesheet">

    </head>  
    <body class="bg-dark">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>
                <% String msg = (String) request.getAttribute("msgError");%>
                <div class="centrado">
                    <%if (msg != null) {
                            out.println(msg);
                        }%>
                    <div class="card-body">
                        <form action="logear" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input class="form-control" id="exampleInputEmail1" name="txtemail" type="email" value="rmayta@gmail.com" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input class="form-control" id="exampleInputPassword1" name="txtpassword" type="password" value="1234" placeholder="Password">
                            </div>
                            <div class="form-group">

                            </div>
                            <button  class="btn btn-primary btn-block">Login</button>
                        </form>
                        <div class="text-center">
                            <a class="d-block small mt-3" href="register.html">Register an Account</a>
                            <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    </body>

</html>
