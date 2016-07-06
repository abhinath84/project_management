<?php
	/*ini_set('display_errors', 'On');
	error_reporting(E_ALL);*/
	
	$imagesPath = "../images";
	
    $homeURL = "../index.php";
	
	$sprTrackingDashboardURL = "../spr_tracking/dashboard.php";
	$sprTrackingNewSPRURL = "../spr_tracking/entry.php";
	$sprTrackingSearchURL = "../spr_tracking/search.php";
	$sprTrackingSubmitStatusURL = "../spr_tracking/submit_status.php";
	$sprTrackingReportURL = "../spr_tracking/report.php";
	
	$scrumDashboardURL = "../scrum/dashboard.php";
    $scrumSearchURL = "../scrum/search.php";
    $sprintDashboardURL = "../sprint/dashboard.php";
	$sprintSearchURL = "../sprint/search.php";
	
	$workTrackerDashboardURL = "dashboard.php";
	
    $aboutURL = "";
    $contactURL = "";
    $profileURL = "";
    
    $logoutURL = "../result.php?action=logout";
    $loginURL = "../user/login.php";
    $signinURL = "../user/signUp.php";
	$changePasswordURL = "";
	
    $copyrightURL = "../about/about_copyright.php";
    $privacyURL = "../about/about_privacy.php";
    

    require_once ('../inc/functions.inc.php');
    require_once ('../inc/mysql_functions.inc.php');

	// Create Database and required tables
	build_db();

    // Initialize session data
	session_start();
	
	// if not log in then redirect to login page.
    if(!isset($_SESSION['project-managment-username']))
        header("Location: ../user/login.php?redirect=../work_tracker/dashboard.php");
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
        <script type="text/javascript" src="../js/functions.js"></script>
        <script type="text/javascript" src="../js/stupidtable.min.js?dev"></script>
        <script type="text/javascript" src="../js/jqry.js"></script>
        <script type="text/javascript">
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
    <body>
		<?php
			echo addHeader("Work Tracker", true);
		?>
        <div id="wrapper" class="wrapper page-wrap">
            <?php
                echo showWorkTrackerDashboard();
            ?>
            <div style="margin-bottom: 25px;"></div>
        </div>
        <?php
			echo addFooter(); 
        ?>
    </body>
</html>