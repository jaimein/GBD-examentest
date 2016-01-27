
<?php
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$ExamenId = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

//include 'conexion.php';

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
        $comp = ($intento >= $intentosMax);    
    if($comp == TRUE){
        echo "Ha realizado el numero maximo de intentos";
        echo "<a href='index.php?accion=lista'>Atras</a>";
    } else {
        echo "Ha usado ".$intento." de ".$intentosMax." intentos maximos.</br>";
        echo "<a href='index.php?accion=lista'>Atras</a>";
        echo "<a href='index.php?accion=hacer&id={$ExamenId}'>Realizar examen</a>";
    }
    

?>