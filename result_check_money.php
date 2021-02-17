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
    
$sql = "SELECT * FROM `transaction` WHERE CDnumber = '$number';";

$result = $mysqli -> query($sql);
$row_count = $result->num_rows;
while($row = $result->fetch_array(MYSQLI_ASSOC)){
    $rows[] = $row;
}

$sum_money = 0;
foreach($rows as $a) {
    if ($a['type'] == 1 or $a['type'] == 3){
        $sum_money = $sum_money + $a['amount'];
    } elseif ($a['type'] == 2 or $a['type'] == 4){
        $sum_money = $sum_money - $a['amount'];
    }
}

function typeprint($type){
    if($type == 1){
        $type = '窓口入金';
        return $type;
    }elseif($type == 2){
        $type = '窓口出金';
        return $type;
    }elseif($type == 3){
        $type = '振込入金';
        return $type;
    }elseif($type == 4){
        $type = '振込出金';
        return $type;
    }
}

$smarty->assign('row_count', $row_count);
$smarty->assign('rows', $rows);
$smarty->assign('sum_money', $sum_money);
$smarty->display('check.tpl');

$mysqli->close();

?>