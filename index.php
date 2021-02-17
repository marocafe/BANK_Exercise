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

$sql = "SELECT * FROM account_138";
$result = $mysqli -> query($sql);
$row_count = $result->num_rows;
while($row = $result->fetch_array(MYSQLI_ASSOC)){
    $rows[] = $row;
}

function typeprint($type){
    if($type == 1){
        $type = '普通預金';
        return $type;
    }elseif($type == 2){
        $type = '当座預金';
        return $type;
    }elseif($type == 3){
        $type = '定期預金';
        return $type;
    }elseif($type == 4){
        $type = '貯蓄預金';
        return $type;
    }
}

$smarty->assign('row_count', $row_count);
$smarty->assign('rows', $rows);

$smarty->display('top.tpl');

?>