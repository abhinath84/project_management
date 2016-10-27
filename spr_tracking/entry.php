<!--
	File	: entry.php
	Author	: Abhishek Nath
	Date	: 01-Jan-2015
	Desc	: Page to enter a new SPR for tracking.
-->

<!--
	01-Jan-15   V1-01-00   abhishek   $$1   Created.
	17-Jul-15   V1-01-00   abhishek   $$2   File header comment added.
-->

<?php
    // Initialize session data
	session_start();

    // if not log in then redirect to login page.
    if(!isset($_SESSION['project-managment-username']))
        header("Location: ../user/login.php?redirect=../spr_tracking/entry.php");
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>PTC:Project Management</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css" />
        <link rel="stylesheet" type="text/css" href="../css/spr_tracking_entry.css" />
        <script type="text/javascript" src="../ajax/xmlHttp.js"></script>
        <script type="text/javascript" src="../js/functions.js"></script>
    </head>
    <body>
        <div id="wrapper" class="wrapper">
            <?php
                echo addHeader("NEW", true, "spr_tracking");
            ?>
            <div id="entry-main" class="entry-main">
                <section>
                    <?php
                        if(isset($_GET['spr-tracking-no']))
                            echo addEntryCaption($_GET['spr-tracking-no'], 'SPR');
                        else
                            echo addEntryCaption("", 'SPR');

                    ?>
                    <div id="entry-form-div" class="entry-form-div">
                        <form class="spr-tracking-entry-form" id="spr-tracking-entry-form" action="../result.php" method="post">
                            <input type="hidden" name="page" id="page" value="spr-tracking-add">
                            <input type="hidden" name="username" id="username" value=<?php if(isset($_SESSION['project-managment-username'])) echo $_SESSION['project-managment-username']; else echo "\"\""?>>
                            <input type="hidden" name="spr_tracking_no-original" id="spr_tracking_no-original"
                                value=<?php
                                        if(isset($_GET['spr_tracking_no']))
                                            echo "'".$_GET['spr_tracking_no']."'";
                                        else
                                            echo "\"\"";
                                      ?>
                            >
                            <?php
                                echo addInputTag('input', 'text', 'spr_no', 'SPR Number');
                                echo addSPRTrackingStatusTag();
                                echo addSessionTag();
                                echo addInputTag('input', 'text', 'build-version', 'Build Version');
                                echo addInputTag('input', 'text', 'commit-build', 'Commit Build');
                            ?>
                            <div class="form-element" id="comment-form-element">
                                <label id="comment-label">
                                    <strong>Comment</strong>
                                    <textarea rows="6" cols="50" maxlength="500" name="comment" id="comment" spellcheck="false"></textarea>
                                </label>
                                <div class="infomsg" id="comment-infomessage">You can use letters, numbers, and periods.</div>
                                <div id="comment-errormsg-and-suggestions">
                                    <span role="alert" class="errormsg" id="errormsg_0_comment"></span>
                                    <div id='commentExistsError' style="display: none">
                                    This username already exists corresponds to an Account. Please <a href="#">reset it</a>.
                                    </div>
                                    <div class="comment-suggestions" id="comment-suggestions">
                                    </div>
                                </div>
                            </div>
                            <div class="form-element nextstep-button">
                                <input id="submitbutton" name="submitbutton" type="submit" value="Submit" class="ent-button ent-button-submit">
                            </div>
                        </form>
                    </div>
                </section>
            </div>
            <?php
                echo addFooter("spr_tracking");
            ?>
        </div>
        <?php
            if((isset($_GET['spr-tracking-no'])) && ($_GET['spr-tracking-no']!= ""))
            {
                addSPRTrackingInfo($_GET['spr-tracking-no'], $_SESSION['project-managment-username']);
        ?>
                <script>
                    document.getElementById('spr-no').value = document.getElementById('spr-no-lbl').innerHTML;
                    document.getElementById('status').value = document.getElementById('status-lbl').innerHTML;
                    document.getElementById('session').value = document.getElementById('session-lbl').innerHTML;
                    document.getElementById('build-version').value = document.getElementById('build-version-lbl').innerHTML;
                    document.getElementById('commit-build').value = document.getElementById('commit-build-lbl').innerHTML;
                    document.getElementById('comment').value = document.getElementById('comment-lbl').innerHTML;
                </script>
        <?php
            }
        ?>
    </body>
</html>
