<?php
include("../assets/php/functions.php");

$amount = 0;
if (isset($_POST["amount"]))
    $amount = floatval($_POST["amount"]);

/* still debugging */
insertLoan(
    intval($_POST["responsible"]), intval($_POST["client"]), floatval($_POST["amount"]),
    $_POST["loanDate"], $_POST["repaymentDate"], "", $_POST["interestPaymentMode"],
    $_POST["paymentMode"], htmlspecialchars($_POST["comment"]), NULL, $_POST["loanDate"], NULL
);
header("location:../index.php");
?>