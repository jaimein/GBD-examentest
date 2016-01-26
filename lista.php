        <h1>Listado de Examenes</h1>
        <?php
// incluir la conexión a la base de datos
 //       include 'conexion.php';
        $estado = isset($_GET['estado']) ? $_GET['estado'] : "";

// Elegir los datos que deseamos recuperar de la tabla
        $query = "SELECT e.id AS ExamenId, e.descripcion as Asignatura, c.descripcion as Curso "
                . "FROM examen e, cursos c "
                . "WHERE e.cursos_id=c.id ";
       // echo $query;
        if ($stmt = $conexion->prepare($query)) {
            if (!$stmt->execute()) {
                die('Error de ejecución de la consulta. ' . $conexion->error);
            }
// recoger los datos
            $stmt->bind_result($ExamenId, $Asignatura, $Curso);

// enlace a alta de cliente
            echo "<div>";
            echo "<a href='index.php?accion=altas'>Alta cliente</a>";
            echo "</div>";

//cabecera de los datos mostrados
            echo "<table>"; //start table
            //creating our table heading
            echo "<tr>";
            echo "<th>Curso</th>";
            echo "<th>Asignatura</th>";
            echo "</tr>";
//recorrido por el resultado de la consulta
            while ($stmt->fetch()) {
                echo "<tr>";
                echo "<td>$Curso</td>";
                echo "<td>$Asignatura</td>";
                echo "<td>";
// Este enlace es para ir a prehacer
                echo "<a href='index.php?accion=prehacer&id={$ExamenId}'>Realizar examen</a>";
                echo " / ";
// Este enlace es para borrar el registro y también se explicará más tarde
//                echo "<a href='javascript:borra_cliente(\"$id\")'> Elimina </a>";
                echo "</td>";
                echo "</tr>\n";
            }
            // end table
            echo "</table>";

            $stmt->close();
        } else {
            die('Imposible preparar la consulta. ' . $conexion->error);
        }
        ?>

