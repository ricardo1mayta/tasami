
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
</script>

<script type="text/javascript">

    var auto_refresh = setInterval(
            function ()
            {
                $('#tablaeventos').load('ajaxEventos').fadeIn("slow");
            }, 1000); // autorefresh the content of the div after
    //every 10000 milliseconds(10sec)

</script>
<style>
    #audio{
        display: none
    }
    .bg-purpure{
        background-color: #FF00FF;
    }
    .bg-red2{
        background-color:#FF0000;
    }
</style>
<%@include file="../includes/menu1.jsp" %>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.html">Monitoreo</a>
            </li>
            <li class="breadcrumb-item active">Eventos</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Welcome</h1><a href="panel"> panel</a>

                <div id="tablaeventos"></div>

            </div>
        </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <audio id="audio" controls>
                    <source type="audio/mp3" src="./Public/audio/alarma.mp3">
                </audio>
                <small>Copyright © Your Website 2018</small>
                <a href="./Public/audio/alarma.mp3" target="_blank"> Pincha aquí para oir la música. </a>
            </div>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="myModal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Location</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">Map</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu1">Photo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu2">Descriptions</a>
                        </li>
                    </ul>



                    <div class="tab-content">
                        <div class="tab-pane container active" id="home"><img src="./Public/imagen/mapas/demo3.png" width="100%"></div>
                        <div class="tab-pane container fade" id="menu1"><img src="./Public/imagen/mapas/photo1.jpg" width="100%"></div>
                        <div class="tab-pane container fade" id="menu2">
                            <div class="card mb-4 box-shadow">
                                fdokjdsklf<br>
                                 fdokjdsklf<br>
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br> 
                                  fdokjdsklf<br>vv 
                                  fdokjdsklf<br>v
                            </div>
                           

                        </div>
                    </div>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" >Dispositivo</button>
                </div>

            </div>
        </div>
    </div>
    

    <%@include file="../includes/scrips.jsp" %>  

    <%@include file="../includes/fin.jsp" %> 


