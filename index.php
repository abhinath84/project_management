<?php
	/*ini_set('display_errors', 'On');
	error_reporting(E_ALL);*/
	
	$imagesPath = "images";
	
    $homeURL = "index.php";
	
	$sprTrackingDashboardURL = "spr_tracking/dashboard.php";
	$sprTrackingNewSPRURL = "spr_tracking/entry.php";
	$sprTrackingSearchURL = "spr_tracking/search.php";
	$sprTrackingSubmitStatusURL = "spr_tracking/submit_status.php";
	$sprTrackingReportURL = "spr_tracking/report.php";
	
	$scrumDashboardURL = "scrum/dashboard.php";
    $scrumSearchURL = "scrum/search.php";
    $sprintDashboardURL = "sprint/dashboard.php";
	$sprintSearchURL = "sprint/search.php";
	
	$workTrackerDashboardURL = "work_tracker/dashboard.php";
	
    $aboutURL = "";
    $contactURL = "";
    $profileURL = "user/profile.php";
    
    $logoutURL = "result.php?action=logout";
    $loginURL = "user/login.php";
    $signinURL = "user/signUp.php";
	$changePasswordURL = "";
	
    $copyrightURL = "about/about_copyright.php";
    $privacyURL = "about/about_privacy.php";
    
    

    require_once ('inc/functions.inc.php');
    require_once ('inc/mysql_functions.inc.php');

	// Create Database and required tables
	build_db();

    // Initialize session data
	session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>PTC:Project Management</title>
        <link rel="stylesheet" type="text/css" href="css/global.css" />
        <script type="text/javascript" src="ajax/xmlHttp.js"></script>
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="js/functions.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
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
			echo addHeader("HOME", true);
		?>
        <div id="wrapper" class="wrapper page-wrap">
            <!-- Main Article-->
            <div class="clear">
                <div id="main-article-container">
					<?php
						if((isset($_SESSION["project-managment-username"])) && ($_SESSION["project-managment-username"] != ""))
						{
							echo getUserInfoContainer();
						}
						else
						{
							echo getPMShortDesc();
							echo getArticleContainer();
						}
					?>
                </div>
            </div>
            
			<div class="clear" style="padding-top:20px"></div>
        </div>
        <?php
			echo addFooter();
        ?>
    </body>
</html>
