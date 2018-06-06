</head>

<body class="fixed-nav sticky-footer bg-dark " id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-warning text-light fixed-top" id="mainNav">
        <a class="navbar-brand" href="User">System Monitor</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse bg-warning" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav " id="exampleAccordion">
                <li class="nav-item " data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a class="nav-link badge-danger" href="User">
                        <i class="fa fa-fw fa-dashboard"></i>
                        <span class="nav-link-text text-light">Events</span>
                    </a>
                </li>
               <!--
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                    <a class="nav-link" href="">
                        <i class="fa fa-fw fa-table"></i>
                        <span class="nav-link-text text-light">Admin</span>
                        <ul class="sidenav-second-level collapse" id="collapseComponents">
                        <li>
                            <a href="areas">Areas</a>
                        </li>
                        <li>
                            <a href="location">Location</a>
                        </li>
                    </ul>
                    </a>
                </li> -->
                <li class="nav-item active" data-toggle="tooltip" data-placement="right" title="Components">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                        <i class="fa fa-fw fa-wrench"></i>
                        <span class="nav-link-text text-light">Admin</span>
                    </a>
                    <ul class="sidenav-second-level  active" id="collapseComponents">
                        <li>
                            <a href="areas">Areas</a>
                        </li>
                        <li>
                            <a href="location">Location</a>
                        </li>
                        <li>
                            <a href="panels">Panel</a>
                        </li>
                        <li>
                            <a href="sensors">Sensors</a>
                        </li>
                    </ul>
                </li>
                <!--
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
                        <i class="fa fa-fw fa-file"></i>
                        <span class="nav-link-text text-light">Example Pages</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="collapseExamplePages">
                        <li>
                            <a href="login.html">Login Page</a>
                        </li>
                        <li>
                            <a href="register.html">Registration Page</a>
                        </li>
                        <li>
                            <a href="forgot-password.html">Forgot Password Page</a>
                        </li>
                        <li>
                            <a href="blank.html">Blank Page</a>
                        </li>
                    </ul>
                </li>-->
            </ul>
           
            <ul class="navbar-nav ml-auto">
               
               
                <li class="nav-item">
                    <h3>Ricardo Mayta</h3>                    
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out text-light"></i>Logout</a>
                </li>
            </ul>

        </div>
    </nav>