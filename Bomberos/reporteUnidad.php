<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Mantenedor</title>


    <link rel ="stylesheet" href="css/style.css" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

  </head>

<body  background="images/fondofichaintranet.jpg">

    <br>
    <nav class="navbar navbar-default nav-stacked  navbar-pills" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="Mantenedor.php" class="navbar-brand" href="#">Sistema Bomberos</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Bomberos <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="CrearFicha.php">Crear</a></li>
              <li><a href="buscarBombero.php">Buscar</a></li>
            </ul>
          </li>
        </ul>

        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Unidades <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="crearUnidades.php">Crear</a></li>
              <li><a href="buscarUnidades.php">Buscar Unidades</a></li>
              <li><a href="reporteUnidad.php">Reporte</a></li>
              <li><a href="bitacoraUnidad.php">Bitacora</a></li>
              <li><a href="buscarBitacora.php">Buscar Bitacora</a></li>

            </ul>
          </li>
        </ul>

        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Inventario <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="crearInventario.php">Crear</a></li>
              <li><a href="buscarInventario.php">Buscar </a></li>
              <li><a href="reporteInventario.php">Reporte </a></li>


            </ul>
          </li>
        </ul>

        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Despacho <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="centraldeAlarma.php">Central de Alarma</a></li>

            </ul>
          </li>
        </ul>

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <button class="btn btn-default" style="width: 150px;" style="margin-top: 400px"> <a href="crearUsuario.php" style="text-decoration:none;color:black;">Crear Usuario</a> </button>

        <br>
        <br>
        <button class="btn btn-danger" style="width: 150px;" style="margin-top: 400px"> <a href="controlador/CerrarSesion.php" style="text-decoration:none;color:black;">Cerrar Sesion</a> </button>





      </div><!-- /.navbar-collapse -->
    </nav>

  <div class = "cuerpo" style="
    margin-left: 20%;
    float: left;
    width: 75%;
    padding-left: 5%;
    padding-top: -100%;
    margin-top: -600px;
    margin-bottom: -1000px;
    ">

<style>

#transparencia{
    opacity: .85;
    -moz-opacity: .85;
    filter: alpha(opacity=85);

}

</style>
<?php
    // unir vista con el modelo sin pasar por un controlador
    require_once("model/Data.php");
    $data = new Data();

?>

<div style="width: 800px" style="height: 900px">
    <div class="jumbotron" style="border-radius: 70px 70px 70px 70px" id="transparencia">
      <div class="container">

      <div class="form-group" style="margin-left:50px;">

        <span><h5 style="font-weight:bold;">Reporte Unidades</h5></span>

        Unidad:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="cboUnidades" style="width: 180px;" >
            <?php
                $unidad = $data->readUnidadesVehiculos();
                foreach ($unidad as $u) {
                    echo "<option value='".$u->getIdUnidad()."'>";
                        echo $u->getNombreUnidad();
                    echo"</option>";
                }
            ?>
        </select>
        <br><br>
        Fecha Inicio:&nbsp;&nbsp;<input type="date" value="<?php echo date('Y-m-d'); ?>" name="txtfechainicio" style="width: 180px;">  /
        Fecha Termino: <input type="date" value="<?php echo date('Y-m-d');?>" name="txtfechafinal" style="width: 180px;">
        <br><br>


        <input type="submit" name="btnbuscar" value="Buscar Reporte" class="btn button-primary" style="width: 150px;"> <span ></span>



    <!--    Tipo Servicio:
        <select  name="cboTiposDeServicios" style="width: 180px;">
       <?php
/*

        $listado = $data->readTiposDeServicios();
        foreach($listado as $o => $objeto){
        ?>
        <option value="<?php echo $objeto->getId_tipo_servicio(); ?>"><?php echo $objeto->getCodigo_tipo_servicio(); ?></option>
        <?php
      }*/
        ?>
      </select> -->
        <br><br>


        <table class="table table-striped">
            <thead>
              <tr>
                <th>Tipo Servicio</th>
                <th>Reponsable</th>
                <th>Fecha</th>
                <th>Maquinista</th>
                <th>Observaciones</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>John</td>
                <td>Doe</td>
                <td>john@example.com</td>
                <td>sadsda</td>
              </tr>

            </tbody>
          </table>









     </div>
   </div>
 </div>
</div>
</div>

<script src="javascript/borrarVariablesEnSesionAlCargarPagina.js"></script>

  </body>
</html>
