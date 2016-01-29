
<?php
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$ExamenId = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

//include 'conexion.php';

    if($_POST){
        $intento=  isset($_GET['intento']) ? $_GET['intento'] : die('ERROR: Intento no encontrado');
    switch ($_POST['accion'])
    {
      case 'atras':
          header("Location:index.php?action=lista");
        break;

      case 'hacer':
          sumaintentos($conexion, $ExamenId, $intento);
          header("Location:index.php?accion=hacer&id={$ExamenId}");
        break;
    }
}

    $query = "SELECT e.intentosMax, i.intentos, i.users_id "
            . "FROM examen e "
            . "LEFT JOIN intentos i ON i.examen_id = e.id "
            . "WHERE e.id =? AND i.users_id =?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('ii', $ExamenId, $_SESSION['id']);
    $stmt->execute();
    $stmt->bind_result($intentosMax, $intentos, $iduser);
    // recuperamos la variable
    $stmt->fetch();
    //echo $intentosMax;
    //echo $intentos;
    if(isset($intentos)){
        $intento=$intentos;
    } else {
        $intento="0";
    }
    

    echo "<form action='index.php?accion=prehacer&id={$ExamenId}&intento={$intento}' method=post>";
        $comp = ($intento >= $intentosMax);    
    if($comp == TRUE){
        echo "Ha realizado el numero maximo de intentos";
        echo "<input type=submit name=accion value=atras>";
        echo "</form>";
    } else {
        echo "Ha usado ".$intento." de ".$intentosMax." intentos maximos.</br>";
        echo "<input type=hidden name=intento value=.$intento.>";
        echo "<input type=submit name=accion value=hacer>";
        echo "<input type=submit name=accion value=atras>";
        echo "</form>";

    }
    

?>