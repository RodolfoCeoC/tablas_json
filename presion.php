<?php

$server = "localhost";
$user = "root";
$pass = "";
$bd = "presion_arterial";

//Creamos la conexión
$conexion = mysqli_connect($server, $user, $pass,$bd)
or die("Ha sucedido un error inexperado en la conexion de la base de datos");

//generamos la consulta
$sql = "SELECT * FROM clinica
        INNER JOIN pacientes
        WHERE clinica.cod_clin = pacientes.cod_clin_fk";


mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result = mysqli_query($conexion, $sql)) die();


$clinica = array(); //creamos un array


while($row = mysqli_fetch_array($result))

{   /* Tablas */

	//Clinica
	$cod_clin=$row['cod_clin'];
	$Nombre_clinica=$row['Nombre_clinica'];
	$Nombre_Med=$row['Nombre_Med'];
	$Especialidad=$row['Especialidad'];

	//Paciente
	$Num_Pac=$row['Num_Pac'];
	$Nombre_Pac=$row['Nombre_Pac'];
    $Edad=$row['Edad'];
    $Genero=$row['Genero'];
    $Fecha_ingreso=$row['Fecha_ingreso'];
	$Sistolica_mmHg=$row['Sistolica_mmHg'];
    $Diastolica_mmHg=$row['Diastolica_mmHg'];
	$cod_clin_fk=$row['cod_clin_fk'];

	

                     
	                    //Clinica
	$clinica[] = array('cod_clin'=> $cod_clin,'Nombre_clinica'=> $Nombre_clinica, 'Nombre_Med'=> $Nombre_Med, 'Especialidad'=> $Especialidad,
	                   //Paciente
					   'Num_Pac'=> $Num_Pac, 'Nombre_Pac'=> $Nombre_Pac, 'Edad'=> $Edad, 'Genero'=> $Genero,'Fecha_ingreso'=> $Fecha_ingreso, 
					   'Sistolica_mmHg'=> $Sistolica_mmHg, 'Diastolica_mmHg'=> $Diastolica_mmHg,'cod_clin_fk'=> $cod_clin_fk);
					   
					}



//desconectamos la base de datos
$close = mysqli_close($conexion) 
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");
  

//Creamos el JSON
$json_string = json_encode($clinica);
echo $json_string;

?>