<?php
$usuario="root";
$contraseña="1qaw3ed";
/*try {
    $mbd = new PDO('mysql:host=localhost;dbname=ScriptNexarte', $usuario, $contraseña);
    //foreach($mbd->query('SELECT * from FOO') as $fila) {
      //  print_r($fila);
    //}
    $mbd = null;
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}*/


$servername = "localhost";
$username = "ingotech_prycts";
$password = "%Rs@D^g4$0hH";
$dbname = "ingotech_prycts";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


/* cambiar el conjunto de caracteres a utf8 */
if (!$conn->set_charset("utf8")) {
    //printf("Error cargando el conjunto de caracteres utf8: %s\n", $conn->error);
    exit();
} else {
    //printf("Conjunto de caracteres actual: %s\n", $conn->character_set_name());
}


?>


