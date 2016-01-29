
<?php



echo "examen";
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$ExamenId = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

obtenerpregunta($conexion, $ExamenId);
//obteneropciones($idPregunta, $conexion);










#################################################################################################################
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no


//include 'conexion.php';

//if ($_POST) {
// escribir en la tabla cliente
 //   $query = "INSERT INTO seleciones "
 //           . "(id, users_id, intentos_id, examen_id, preguntas_id, opciones_id) "
 //           . "VALUES "
 //           . "('', ?, ?, ?, ?, ?)"
 //           . "WHERE id = ?";
 //   $stmt = $conexion->prepare($query);
  //  $stmt->bind_param('iiiiii', $_SESSION['id'], $_POST['users_id'], 
 //           $_POST['intentos_id'], $_POST['examen_id'], $_POST['preguntas_id'], 
//            $_POST['opciones_id']);
  //  if ($stmt->execute()) {
 //       echo "Registro actualizado";
 //   } else {
 //       echo 'Error al actualizar.';
 //   }
//}

?>
