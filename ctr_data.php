<?php
session_start();
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
//include "../Model/data.php";


$method = $_SERVER['REQUEST_METHOD']; 
//$model = new Data();
$data = "";
if (isset($_GET)) {
    $action = (!isset($_GET['action']) ? '' : $_GET['action']);
    $data = $_GET;
	
    switch ($action){
		default: 
            //echo json_encode("NOT ACTION GET");
        break;
    }
	

}
echo "============";
if (isset($_POST)){
    $action = (!isset($_POST['action']) ? '' : $_POST['action']);
    
    switch ($action){
        case 'getAll':
			/*$result = $model->getAll($_POST); 
			echo json_encode((array)$result);*/
            echo "eeeee";
        break;
    	default: 
            echo json_encode("NOT ACTION POST");
        break;
    }
}


?>