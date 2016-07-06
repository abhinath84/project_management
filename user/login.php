<?php
    $imagesPath = "../images";
	
    $homeURL = "../index.php";
	
	$sprTrackingDashboardURL = "../spr_tracking/dashboard.php";
	$sprTrackingNewSPRURL = "../spr_tracking/entry.php";
	$sprTrackingSearchURL = "../spr_tracking/search.php";
	$sprTrackingSubmitStatusURL = "../spr_tracking/submit_status.php";
	
	$scrumDashboardURL = "../scrum/dashboard.php";
    $scrumSearchURL = "../scrum/search.php";
    $sprintDashboardURL = "../sprint/dashboard.php";
	$sprintSearchURL = "../sprint/search.php";
	
	$workTrackerDashboardURL = "../work_tracker/dashboard.php";
	
    $aboutURL = "";
    $contactURL = "";
    $profileURL = "";
    
    $logoutURL = "../result.php?action=logout";
    $loginURL = "login.php";
    $signinURL = "signUp.php";
	$changePasswordURL = "";
	
    $copyrightURL = "../about/about_copyright.php";
    $privacyURL = "../about/about_privacy.php";

    require_once '../inc/functions.inc.php';
    require_once '../inc/mysql_functions.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>PTC:Project Management</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css" />
        <link rel="stylesheet" type="text/css" href="../css/login.css" />
        <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="../js/functions.js"></script>
        <script type="text/javascript">
			$(document).ready(function() {

				// process the form
				$('#login-form').submit(function(event) {
					loginSubmit();
					
					// stop the form from submitting the normal way and refreshing the page
					event.preventDefault();
				});
				
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
			echo addHeader("Sign Up", false);
		?>
        <div id="wrapper" class="wrapper page-wrap">
            <!-- Create login form -->
            <div id="login-main" class="login-main">
				<div class="login">
					<div id="login-sub">
						<h3>Log In</h3>
						<form id="login-form" class="login-form" method="post">
							<input type="hidden" name="page" id="page" value="login">
							<input type="hidden" name="redirect" id="redirect" value=<?php if(isset($_GET['redirect'])) echo $_GET['redirect']; else echo "\"\""; ?>>
							<?php
								echo addInputTag('input', 'text', 'username', 'Username', '');
								echo addInputTag('input', 'password', 'password', 'Password', '');
							?>
							<div class="form-element">
								<input id="signIn" name="signIn" type="submit" value="Sign in" class="ent-button ent-button-submit" style="width: 150px; height:35px; margin-top: 20px;">
							</div>
						</form>
						<span><a id="link-forgot-passwd" href="recovery.php">Can&#39;t access your account?</a></span>
					</div>
				</div>
				<div id="signup-nav">
					<div id="signup-nav-sub">
						<h3>Don't have an account?</h3>
						<p><a href="signUp.php">Sign up</a> today.</p>
					</div>
				</div>
				<div class="clear"></div>
            </div>
            <div style="margin-bottom: 25px;"></div>
        </div>
        <?php
			echo addFooter();
		?>
    </body>
</html>
