
<?php
// coger el parámetro que nos permitirá identificar el registro
// isset() es una función PHP usado para verificar si una variable tiene valor o no
$id = isset($_GET['id']) ? $_GET['id'] : die('ERROR: Registro no encontrado.');

//include 'conexion.php';

if ($_POST) {
// escribir en la tabla cliente
    $query = "SELECT intentosMax "
            . "FROM examen "
            . "WHERE id=? ";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('i', $ExamenId);
}
    // ejecutamos la consulta
    $stmt->execute();
    $stmt->bind_result($intentosMax);
    // recuperamos la variable
    $stmt->fetch();

?>
<form action='index.php?accion=edita&id=<?php echo htmlspecialchars($id); ?>' method='post' border='0'>
    <table>
        <tr>
            <td>NIF:</td>
            <td><input type='text' name='nif' value="<?php echo htmlspecialchars($nif, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>Nombre:</td>
            <td><input type='text' name='nombre' value="<?php echo htmlspecialchars($nombre, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>1er Apellido</td>
            <td><input type="text" name='apellido1' value="<?php echo htmlspecialchars($apellido1, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>2º Apellido</td>
            <td><input type='text' name='apellido2' value="<?php echo htmlspecialchars($apellido2, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>email</td>
            <td><input type="text" name='email' value="<?php echo htmlspecialchars($email, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>Telefono</td>
            <td><input type='text' name='telefono' value="<?php echo htmlspecialchars($telefono, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>Usuario</td>
            <td><input type="text" name='usuario' value="<?php echo htmlspecialchars($usuario, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type='text' name='password' value="<?php echo htmlspecialchars($password, ENT_QUOTES); ?>" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type = "button"
           value = "Guarda"
           onclick = "formhash(this.form, this.form.password);" />
                <a href='index.php?accion=lista'>Volver a Inicio</a>
            </td>
        </tr>
    </table>
</form>



