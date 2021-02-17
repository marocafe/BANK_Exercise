<?php

require '../smarty/libs/Smarty.class.php';

$smarty = new Smarty();

$smarty->template_dir = 'templates/';
$smarty->compile_dir  = 'templates_c/';
$smarty->cache_dir    = 'cache/';

$server = "localhost";
$userName = "root";
$password = "";
$dbName = "AIBANK";

$mysqli = new mysqli($server, $userName, $password,$dbName);


$number = $_POST["number"];
$transaction = $_POST["transaction"];
$remarks = $_POST["remarks"];
$money = $_POST["money"];
date_default_timezone_set('Asia/Tokyo');
$datetime = date("Y-m-d H:i:s");

$sql = "INSERT INTO `transaction`(CDSHITEN, CDnumber, timestamp, type, remarks, amount)
        VALUE ('138', '$number', '$datetime', $transaction, '$remarks', $money);
        ";
$mysqli->query($sql);

$announce = "入出金が完了しました。";

$smarty->assign('announce', $announce);
$smarty->display('announce.tpl');

$mysqli->close();

?>