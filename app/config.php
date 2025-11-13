<?php
header('Content-Type: text/html; charset=UTF-8');
$cookie_secure = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on');




ini_set('session.cookie_httponly', 1);


$cookieParams = session_get_cookie_params();


session_set_cookie_params(
    $cookieParams['lifetime'],
    $cookieParams['path'] . '; samesite=Strict', 
    $cookieParams['domain'],
    $cookie_secure,
    true 
);



session_start();

define('UPLOAD_DIR', __DIR__ . '/uploads/portadas/'); 

$hostname = "db";       
$username = "admin";    
$password = "test";     
$db = "database"; 

$conn = new mysqli($hostname, $username, $password, $db);

if ($conn->connect_error) {
  die("Konexio errorea: " . $conn->connect_error);
}
$conn->set_charset("utf8");
?>