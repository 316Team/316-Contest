<?php
$mysql_conf = array(
    'host'    => '127.0.0.1:3306', 
    'db'      => 'test', 
    'db_user' => 'root', 
    'db_pwd'  => 'joshua317', 
    );

$mysqli = new mysqli($mysql_conf['host'], $mysql_conf['db_user'], $mysql_conf['db_pwd']);
if ($mysqli->connect_errno) {
    die("could not connect to the database:\n" . $mysqli->connect_error);//诊断连接错误
}

$mysqli->close();
?>
