<!--
    File    : dashboard.php
    Author  : Abhishek Nath
    Date    : 01-Jan-2015
    Desc    : Page for SPR tracking dashboard.
-->

<!--
    01-Jan-15   V1-01-00   abhishek   $$1   Created.
    17-Jul-15   V1-01-00   abhishek   $$2   File header comment added.
    24-Oct-16   V1-01-00   abhishek   $$3   generate body tag from sub-class of
                                            HTMLTemplate class.
-->

<?php
    /*ini_set('display_errors', 'On');
    error_reporting(E_ALL);*/

    require_once ('../inc/functions.inc.php');
    require_once ('../inc/mysql_functions.inc.php');
    require_once ('../inc/htmltemplate.php');

    // Create Database and required tables
    build_db();

    // Initialize session data
    session_start();

    // if not log in then redirect to login page.
    if(!isset($_SESSION['project-managment-username']))
        header("Location: ../user/login.php?redirect=../spr_tracking/dashboard.php");
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>PTC:Project Management</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css" />
        <link rel="stylesheet" type="text/css" href="../css/b-buttons.css" />
        <link rel="stylesheet" type="text/css" href="../css/spr_tracking_dashboard.css" />
        <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="../js/popup_input_dialog.js"></script>
        <script type="text/javascript" src="../js/functions.js"></script>
        <script type="text/javascript" src="../js/stupidtable.min.js?dev"></script>
        <script type="text/javascript" src="../js/jqry.js"></script>
        <script>
            $(document).ready(function(){
               $("table").fixMe();
               $(".up").click(function() {
                  $('html, body').animate({
                  scrollTop: 0
               }, 2000);
             });
            });

        </script>
    </head>
    <?php
        $htmlBody = new SPRTrackingHTML();

        echo $htmlBody->generateBody();
    ?>
</html>
