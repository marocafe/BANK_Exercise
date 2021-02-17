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

$yuan_number = $_POST["yuan_number"];
$prior_number = $_POST["prior_number"];
$transfer_money = $_POST["transfer_money"];
date_default_timezone_set('Asia/Tokyo');
$datetime = date("Y-m-d H:i:s");

if ($yuan_number == $prior_number){
    
    $errormsg = "正しく入力してください";
    $smarty->assign('errormsg', $errormsg);
    $smarty->display('announce.tpl');
    
} else {
    
    $INSERT_sql = "
                INSERT INTO `transaction`(CDSHITEN, CDnumber, timestamp, type, remarks, amount)
                VALUE ('138', '$yuan_number', '$datetime', 4, '口座番号： $prior_number に振込', $transfer_money);
                ";
    $mysqli->query($INSERT_sql);
    
    $INSERT_sql2 = "
                INSERT INTO `transaction`(CDSHITEN, CDnumber, timestamp, type, remarks, amount)
                VALUE ('138', '$prior_number', '$datetime', 3, '口座番号： $yuan_number から振込', $transfer_money);
                ";
    $mysqli->query($INSERT_sql2);
    
    $announce = "窓口振込が完了しました。";

    $smarty->assign('announce', $announce);
    $smarty->display('announce.tpl');
    
    $mysqli->close();
}

?>