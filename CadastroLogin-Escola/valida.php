<?php
	session_start();	
	
	include_once("conexao.php");	

    $emailPost = $_POST['emailLogin'];
    $passwordPost = $_POST['passwordLogin'];

	if((isset($emailPost)) && (isset($passwordPost))){
		$usuario = mysqli_real_escape_string($conn, $emailPost); 
		$senha = mysqli_real_escape_string($conn, $passwordPost);
		
		$senha = md5($senha);
			
		$result_usuario = "SELECT * FROM tbDiretor WHERE email = '$usuario' && senha = '$senha' LIMIT 1";
		$resultado_usuario = mysqli_query($conn, $result_usuario);
		$resultado = mysqli_fetch_assoc($resultado_usuario);
		
		if(isset($resultado)){
			$_SESSION['Diretor'] = "Diretor logado";
			header("Location: areaInternaDiretor.php");
		}else{	
			$_SESSION['loginErro'] = "Usuário ou senha Inválido";
			header("Location: index.php");
		}
	}else{
		$_SESSION['loginErro'] = "Usuário ou senha inválido";
		header("Location: index.php");
	}
?>