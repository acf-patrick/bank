<?php

function getDataBase () {
    try {
        return new PDO("mysql:host=localhost:3306;dbname=bankinit;charset=utf8", "root", "", [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ]);
    } catch (Exception $e) {
        die ("Error : " . $e->getMessage());
    }
}

function insertLoan ($responsibleID, $clientID, $amount, $implementationDate, $repaymentEndDate, $repaymentFrequency, $benefitPaymentMethod, $capitalPaymentMethod, $remark, $refundMade, $createdAt, $updateAt) {
    $db = getDataBase();
        
    $pairs = [ 
        "responsible_id" => $responsibleID, 
        "client_id" => $clientID, 
        "amount" => $amount, 
        "implementation_date" => $implementationDate, 
        "repayment_end_date" => $repaymentEndDate, 
        "repayment_frequency" => $repaymentFrequency, 
        "benefit_payment_method" => $benefitPaymentMethod, 
        "capital_payment_method" => $capitalPaymentMethod, 
        "remark" => $remark, 
        "refund_made" => $refundMade, 
        "created_at" => $createdAt, 
        "update_at" => $updateAt
    ];
    $keys = array_keys($pairs);

    $request = "INSERT INTO loan(";
    foreach ($keys as $key)
        $request = "$request, $key";
    $request = "$request)";

    $request = "$request VALUES(";
    foreach ($keys as $key)
        $request = "$request, :$key";
    $request = "$request)";

// prepared request
    $req = $db->prepare($request);
    $req->execute($pairs);
}

?>