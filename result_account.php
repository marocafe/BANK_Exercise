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


$deposit_type = $_POST["deposit_type"];
$name_full = $_POST["name_full"];
$name_kana = $_POST["name_kana"];
date_default_timezone_set('Asia/Tokyo');
$datetime = date("Y-m-d H:i:s");

$number="";
for($i=0;$i<7;$i++) {
    $number.=mt_rand(0,9);
}


if ( !preg_match("/^[ァ-ー]+$/u", $name_kana) ) {
    
    $errormsg = "正しく入力してください";
    $smarty->assign('errormsg', $errormsg);
    $smarty->display('announce.tpl');
    
} else {

    $sql = "INSERT INTO account_138(number, type, name_full, name_kana, create_date, flg_active)
            VALUE ('$number','$deposit_type','$name_full','$name_kana', '$datetime', 1);
            ";
                
    $mysqli->query($sql);
    
    $announce = "口座開設が完了しました。";
    
    
    
    $smarty->assign('announce', $announce);
    $smarty->display('announce.tpl');
    $mysqli->close();
    
}

?>