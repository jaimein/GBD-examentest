
<?php
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$ExamenId = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

//include 'conexion.php';
//SELECT i.intentos, e.intentosMax FROM examen e, intentos i WHERE i.examen_id=e.id and e.id=1
// solicitar intentos en la tabla cliente
//    $query = "SELECT e.intentosMax, i.intentos "
//            . "FROM examen e LEFT JOIN intentos i "
//            . "ON i.examen_id = e.id "
//            . "WHERE e.id=? "
 //           . "AND i.users_id=?
//echo "Consulta 1";
    $query = "SELECT intentosMax "
            . "FROM examen "
            . "WHERE id=?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('i', $ExamenId);
    $stmt->execute();
    $stmt->bind_result($intentosMax);
    //echo "Consulta 1";
    
        // recuperamos la variable
    $stmt->fetch();
    
    
    echo "Consulta 2";
    echo $_SESSION['id'];
    $userId=$_SESSION['id'];
    echo $userId;
    echo gettype($userId);
    $query2 = "SELECT intentos "
            . "FROM intentos "
            . "WHERE users_id = '?' ";
    echo "Consulta 2.1";
    $stmt2 = $conexion->prepare($query2);
    echo "Consulta 2.2";
    
    $stmt2->bind_param('i', $userId);
    echo "Consulta 2.3";
    $stmt2->execute();
    echo "Consulta 2.4";
    $stmt2->bind_result($intentos);
    
    echo "Consulta 2fin";
    

    if(isset($intentos)){
        $intento=$intentos;
    } else {
        $intento="0";
    }
        $comp = ($intento <= $intentosMax);    
    if($comp == TRUE){
        echo "Ha realizado el numero maximo de intentos";
        echo "<a href='index.php?accion=lista'>Atras</a>";
    } else {
        echo "Ha usado ".$intento." de ".$intentosMax." intentos maximos.</br>";
        echo "<a href='index.php?accion=lista'>Atras</a>";
        echo "<a href='index.php?accion=hacer&id={$ExamenId}'>Realizar examen</a>";
    }
    

?>