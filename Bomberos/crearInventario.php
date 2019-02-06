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

  <?php
/*
require_once("model/Data.php");
require_once("model/Tbl_Usuario.php");
$dataUsuario= new Data();
session_start();
if($_SESSION["usuarioIniciado"]!=null){
  $u=$_SESSION["usuarioIniciado"];
  if($dataUsuario->verificarSiUsuarioTienePermiso($u,1)==0){
    header("location: paginaError.php");
  }
}*/
?>

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
    margin-top: -650px;
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

<div style="width: 800px" style="height: 400px">
    <div class="jumbotron" style="border-radius: 70px 70px 70px 70px" id="transparencia">
      <div class="container">

      <div class="form-group" style="margin-left:50px;">
        <span><h5 style="font-weight:bold;">Inventario</h5></span>

        <form action="controlador/CrearMaterialMenor.php" method="post">



          Nombre Material: &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="txtnombreMaterial" id="txtnombreMaterial" required style="width:575px;"><br><br>

          Entidad a Cargo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <select name="cboEntidadACargo" id="cboEntidadACargo" onchange="actualizarComboBox()" style="width:230px;">
               <?php
                   $entiPropietaria = $data->getEntidadACargo();
                   foreach ($entiPropietaria as $ep) {
                       echo "<option value='".$ep->getIdEntidadACargo()."'>";
                           echo utf8_encode($ep->getNombreEntidadACargo());
                       echo"</option>";
                   }
               ?>
           </select>

          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ubicacion Fisica:
           <select name="cboxUbicacion" id="cboxUbicacion" style="width:195px;">
             <?php
             $ubicacionesFisicas = $data->getUbicacionFisica(1);
             foreach ($ubicacionesFisicas as $ubi) {
               echo "<option value='".$ubi->getIdUbicacionFisica()."'>";
               echo utf8_encode($ubi->getNombreUbicacionFisica());
               echo"</option>";
             }
             ?>

           </select>
           <br><br>



          Marca: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="txtmarca" required style="width:230px;">

          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Color:
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input Type="text" name="txtColor" required style="width:195px;"><br><br>

           Proveedor: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="txtProveedor"required style="width:230px;">

           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           Estado:
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <select name="cboEstadoMaterial" id="cboEstadoMaterial" style="width:195px;">
             <?php
              $estados = $data->getEstadosInventario();
              foreach ($estados as $e) {
                  echo "<option value='".$e->getId_estado_material_menor()."'>";
                      echo utf8_encode($e->getNombre_estado_material_menor());
                  echo"</option>";
              }
             ?>
           </select>

           <br><br>

           Fecha de Caducidad:
           <input type="date" name="txtCaducidad" style="width:230px;" >

           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           No aplica:
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="checkbox" name="checknoaplica" style="width:100px;height:25px;">

           <br><br>


           Cantidad:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="number" name="txtcantidadMaterial" style="width:150px;">

           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           Medida: <input type="number" name="numMedida" required style="width:100px;"> /

          <select name="cboxMedida">
            <?php
             $medidas = $data->getMedidas();
             foreach ($medidas as $me) {
                 echo "<option value='".$me->getIdUnidadMedida()."'>";
                     echo utf8_encode($me->getNombreUnidadMedida());
                 echo"</option>";
             }
            ?>



          </select>


           <br><br>

          <center> <input type="submit" name="btncrear" value="Crear Material" class="btn button-primary" style="width: 150px;" onclick="msg()"> <span ></span>
              <!--     <button class="btn button-primary" style="width: 150px;"> <a href="Mantenedor.php" style="text-decoration:none;color:black;">Volver</a> </button>-->

          </center>


        </form>


      </div>



     </div>
   </div>
 </div>
</div>

<script src="javascript/JQuery.js"></script>

<script type="text/javascript">


                      function actualizarComboBox(){
                           var val= document.getElementById("cboEntidadACargo").value;

                           $.ajax({
                             url: "buscarUbicacionFisica.php",
                             type: "POST",
                             data:{"datos":val}
                           }).done(function(data) {
                             console.log(data);
                             $('#cboxUbicacion')
                             .find('option')
                             .remove()
                             .end();
                             $('#cboxUbicacion').append(data);

                           });


                         }



                         function msg(){
                           var message = document.getElementById("txtnombreMaterial").value;
                           alert("Creando material menor: "+ message);
                         }



                  $("form").submit(function(){
                    alert("Operación exitosa");
                    });





</script>

  </body>
</html>
