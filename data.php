<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

include "config/conex.php";

class Dashboard
{ 
    private $jsonData;
	public $conn;

    function __construct()
    {
		
        $this->conn = new Connect();

        $this->jsonData = array();
        $this->jsonData['success'] = false;
        $this->jsonData['message'] = "MENSAJE NO DEFINIDO";
		$this->fecha_hora_fin_llamada = date('Y-m-d H:i:s');
    }
	function getDiscipulos($data)
    { 
		if ($this->conn) {
			$SQL = "SELECT B.ID, B.NOMBRE, B.APELLIDO, B.IDENTIFICACION, B.CELULAR,  ";
			$SQL .= " (SELECT  CONCAT(CONCAT(A.NOMBRE, \" \"),A.APELLIDO) LIDER FROM DISCIPULOS A WHERE A.ID = B.LIDER_ID ) AS LIDER ";
            $SQL .= "  FROM DISCIPULOS B ";
			if ($data['filter'] != ''){
				$SQL .= "  WHERE ".$data['filter'];
			}
            
			$sth = $this->conn->prepare($SQL);
			$sth->execute();
			$row = $sth->fetchAll();
			if ($row == null){
				$this->jsonData['success'] = false;
                $this->jsonData['message'] = 'Sin datos';
			}else{
			    $this->jsonData['success'] = true;
                $this->jsonData['message'] = $row;
			}
		} else {
			$this->jsonData['success'] = false;
            $this->jsonData['message'] = "Error de conexion";
		}
		
        return $this->jsonData;
	}

	function getDiscipulo($data)
    { 
		if ($this->conn) {
			$SQL = "SELECT ID, NOMBRE, APELLIDO, IDENTIFICACION, EDAD, CELULAR, CORREO, GENERO, ";
			$SQL .= "ESTADO_CIVIL, LOCALIDAD, BARRIO, DIRECCION, ESCOLARIDAD, PROFESION, OCUPACION, TIEMPO_IGLESIA, TIEMPO_MINISTERIO, ASISTE_CELULA, ASISTE_GO, LIDER_ID, DIRIJE ";
			$SQL .= "FROM DISCIPULOS WHERE ID = ".$data['IDDIS'];
			
            
			$sth = $this->conn->prepare($SQL);
			$sth->execute();
			$row = $sth->fetchAll();
			if ($row == null){
				$this->jsonData['success'] = false;
                $this->jsonData['message'] = 'Sin datos';
			}else{
			    $this->jsonData['success'] = true;
                $this->jsonData['message'] = $row;
			}
		} else {
			$this->jsonData['success'] = false;
            $this->jsonData['message'] = "Error de conexion";
		}
		
        return $this->jsonData;
	}
	
	
	function setUsersMeses($data)
    { 
		if ($this->conn) {
		    $dataAux = "";
		    $meses = explode(",", $data['getMVal']);
		    for ( $a = 0; $a < $data['perm']; $a++){
		        $numMes = $a+1;
	            $dataAux .=", MES".$numMes." = ".$meses[$a];      
		    }  
		    
		    $SQL = "UPDATE PLAN_USER_HEAD SET NMESES = ".$data['perm']." ".$dataAux." ";
			$SQL .= "WHERE ID=".$data['idUser'];
			
			$sth = $this->conn->prepare($SQL);
			$sth->execute();
			if($sth->rowCount() > 0){
				$this->jsonData['success'] = true;
                $this->jsonData['message'] = 'OK';
			}else{
				$this->jsonData['success'] = false;
                $this->jsonData['message'] = 'Sin datos';
			}
		} else {
			$this->jsonData['success'] = false;
            $this->jsonData['message'] = "Error de conexion";
		}
		
        return $this->jsonData;
	}
	
	
	
	function addRetiro($data)
    { 
		if ($this->conn) {
		    
		    $SQL = "INSERT INTO RETIROS_PLAN (IDPLAN, VALOR, PAGO) VALUES ";
			$SQL .= "(".$data['idPlan'].",".$data['valor'].",0)";
			
			$sth = $this->conn->prepare($SQL);
			$sth->execute();
			if($sth->rowCount() > 0){
				$this->jsonData['success'] = true;
                $this->jsonData['message'] = 'OK';
			}else{
				$this->jsonData['success'] = false;
                $this->jsonData['message'] = 'Sin datos';
			}
		} else {
			$this->jsonData['success'] = false;
            $this->jsonData['message'] = "Error de conexion";
		}
		
        return $this->jsonData;
	}
	
	
	
	
}

?>