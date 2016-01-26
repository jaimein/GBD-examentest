
<?php
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$ExamenId = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

//include 'conexion.php';
//SELECT i.intentos, e.intentosMax FROM examen e, intentos i WHERE i.examen_id=e.id and e.id=1
// solicitar intentos en la tabla cliente
    $query = "SELECT e.intentosMax, i.intentos "
            . "FROM examen e LEFT JOIN intentos i "
            . "ON i.examen_id = e.id "
            . "where e.id=? ";
    //echo $query;
    //echo $ExamenId;
    //echo "Parte 1";
    $stmt = $conexion->prepare($query);
    
    //echo $query;
    //echo $ExamenId;
    //echo "Parte 2";
    
    $stmt->bind_param('i', $ExamenId);
    //echo $ExamenId;
    //echo $query;
    //echo "Parte 3";
    // ejecutamos la consulta
    $stmt->execute();
    $stmt->bind_result($intentosMax, $intentos);
    
    
    // recuperamos la variable
    $stmt->fetch();
    if(isset($intentos)){
        $intento=$intentos;
    } else {
        $intento="0";
    }
        
    echo "Ha usado ".$intento." de ".$intentosMax." intentos maximos.</br>";

    echo "<a href='index.php?accion=lista'>Atras</a>";
    echo "<a href='index.php?accion=hacer&id={$ExamenId}'>Realizar examen</a>";

?>