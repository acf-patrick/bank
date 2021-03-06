<?php
    try {
        $db = new PDO("mysql:host=localhost:3306;dbname=bankinit", "root", "", [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ]);
    } catch (Exception $e) {
        die ("Error : " . $e->getMessage());
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./assets/css/form.css">
    <title>Saisie d'un prêt</title>
</head>
<body>
    <main class="d-flex justify-content-center"><div class="wrapper">
    <div class="py-2 mb-3">
        <h2 class="text-light text-center">Formulaire de saisie d'un prêt</h2>
        <div class="underline"></div>
    </div>
    <form class="form container-fluid rounded p-2 p-md-3">
        <div class="row">
            <div class="col-md-6">
                <label for="client">Client</label>
                <select name="client" id="client" class="form-control reg-opacity" value="">
                <?php
                    $response = $db->query("SELECT company_name FROM client");
                    while ($data = $response->fetch())
                        echo "<option value=\"{$data["company_name"]}\">{$data["company_name"]}</option>";
                    $response->closeCursor();
                ?>
                </select>
            </div>
            <div class="col-md-6">
                <label for="resp">Responsable</label>
                <select name="choixresp" class="form-control reg-opacity" id="resp">
                <?php
                    $response = $db->query("SELECT first_name, last_name FROM responsible");
                    while ($data = $response->fetch())
                        echo "<option value=\"{$data["last_name"]}" . " " . "{$data["first_name"]}\">{$data["last_name"]}" . " " . "{$data["first_name"]}</option>";
                    $response->closeCursor();
                ?>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label class="sr-only" for="inlineFormInputGroup">Montant prêt</label>
                <div class="input-group mb-2">
                    <div class="input-group-prepend"><div class="input-group-text">Ar</div></div>
                    <input type="number" name="pret" class="form-control reg-opacity" id="inlineFormInputGroup" min="0" placeholder="Montant prêt">
                </div>
            </div>
            <div class="col-md-6">
                <label for="percentage">Pourcentage</label>
                <input type="number" name="pour" id="percentage" max="100" class="form-control reg-opacity">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="loanDate">Date du prêt</label>
                <input type="date" class="form-control reg-opacity" id="loanDate">
            </div>
            <div class="col-md-6">
                <label for="reimbursementDate">Date de remboursement</label>
                <input type="date" class="form-control reg-opacity" id="reimbursementDate">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="paymentMode">Mode de paiement du capital</label>
                <select name="paymentMode" id="paymentMode" class="form-control reg-opacity">
                <?php
                    $response = $db->query("SELECT label FROM payment_method");
                    $datas = $response->fetchAll($mode = PDO::FETCH_COLUMN);
                    foreach ($datas as $data)
                        echo "<option value=$data>$data</option>";
                    $response->closeCursor();
                ?>
                </select>
            </div>
            <div class="col-md-6">
                <label for="interestPaymentMode">Mode de paiement des intérêts</label>
                <select name="interestPaymentMode" id="interestPaymentMode" class="form-control reg-opacity">
                <?php
                    foreach ($datas as $data)
                        echo "<option value=$data>$data</option>";
                ?>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="reimbursementMode">Mode de remboursement</label>
                <select name="reimbursementMode" id="reimbursementMode" class="form-control reg-opacity">
                <?php
                    $response = $db->query("SELECT wording FROM repayment_frequency");
                    $datas = $response->fetchAll(PDO::FETCH_COLUMN);
                    foreach ($datas as $data)
                        echo "<option value=$data>$data</option>";
                    $response->closeCursor();
                ?>
                </select>
            </div>
            <div class="col-md-12">
                <label for="comment">Commentaire</label>
                <textarea name="comment" id="comment" rows="5" class="form-control reg-opacity" placeholder="Ajouter un commentaire..."></textarea>
            </div>
        </div>
        <div class="d-flex justify-content-between mt-3"><a href="#" class="note">Ajouter une note...</a><input type="submit" class="btn btn-secondary" value="Enregistrer"></div>
    </form>
    <div class="mt-3"><a href="./assets/html/list.html" class="btn btn-primary">Accéder à la liste des prêts</a></div>
    </div></main>
    
    <!-- <script src="bootstrap/js/jquery-3.6.0.min.js"></script> -->
    <script src="assets/css/bootstrap/js/bootstrap.js"></script>
</body>
</html>
