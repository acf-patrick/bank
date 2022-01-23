<?php
include("../assets/php/functions.php");

$amount = 0;
if (isset($_POST["amount"]))
    $amount = intval($_POST["amount"]);

/* still debugging */
insertLoan(
    intval($_POST["responsible"]), intval($_POST["client"]), floatval($_POST["amount"]),
    $_POST["loanDate"], $_POST["repaymentDate"], $_POST["repaymentMode"], $_POST["interestPaymentMode"],
    $_POST["paymentMode"], htmlspecialchars($_POST["comment"]), NULL, date("d-m-y"), NULL
);

// return to form page
header("location:../index.php");
?>