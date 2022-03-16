<?php

include("./functions.php");

$db = getDataBase();

$loan = $db->query("SELECT responsible_id, amount, created_at, repayment_end_date FROM loan")->fetchAll(PDO::FETCH_OBJ);
$responsible = $db->query("SELECT first_name, last_name FROM responsible")->fetchAll(PDO::FETCH_OBJ);

foreach ($loan as &$obj) {
    $field = $responsible[$obj->responsible_id];
    $obj->responsible = $field->first_name . ' ' . $field->last_name;
}

echo json_encode($loan);

?>
