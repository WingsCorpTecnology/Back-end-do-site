<?php
            session_start();

            if (!isset($_SESSION['Diretor'])) {
                $_SESSION['loginErro'] = "Usuário ou senha Inválido";
                header("Location: index.php");
                exit;
            }

?>