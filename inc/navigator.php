<?php

    class Navigator
    {
        private $sprTrackingDir = "spr_tracking";
        private $sprTrackingDashboardURL = "dashboard.php";
        private $sprTrackingSubmitStatusURL = "submit_status.php";
        private $sprTrackingReportURL = "report.php";

        private $scrumDir = "scrum";
        private $scrumDashboardURL = "dashboard.php";
        private $scrumSearchURL = "search.php";

        private $sprintDir = "sprint";
        private $sprintDashboardURL = "dashboard.php";
        private $sprintPlanningURL = "planning.php";
        private $sprintReviewURL = "review.php";

        private $workTrackerDir = "work_tracker";
        private $workTrackerDashboardURL = "dashboard.php";

        private $baseDir = "base";
        private $homeURL = "index.php";
        private $logoutURL = "result.php?action=logout";
        private $aboutURL = "";
        private $contactURL = "";
        private $copyrightURL = "copyright.php";
        private $privacyURL = "privacy.php";

        private $userDir = "user";
        private $profileURL = "profile.php";
        private $loginURL = "login.php";
        private $signinURL = "signUp.php";
        private $changePasswordURL = "changepwd.php";

        private $imagesPath;

        public function header($currentDir, $selNav, $enableNav = true)
        {
            global $cipherObj;

            $tag = "";

            if(($currentDir <> "") && ($selNav <> ""))
            {
                $this->imagesPath = ($currentDir === "base") ? "images" : "../images";

                $tag  = '<!-- Header block -->' . EOF_LINE;
                $tag .= '<div id="header" class="middle-align">' . EOF_LINE;
                $tag .= '    <!-- Top most header part -->' . EOF_LINE;
                $tag .= '    <div id="top-header">' . EOF_LINE;
                $tag .= '        <!-- Logo and others -->' . EOF_LINE;
                $tag .= '        <div id="banner">' . EOF_LINE;
                $tag .= '            <a href="'. $this->getNavURL($currentDir, $this->baseDir, $this->homeURL) .'">' . EOF_LINE;
                $tag .= '                <img src="'. $this->imagesPath .'/ptc-big.png" alt="ptc.com" height="50" width="400" />' . EOF_LINE;
                $tag .= '            </a>' . EOF_LINE;
                $tag .= '        </div>' . EOF_LINE;
                $tag .= '        <!-- Login and others -->' . EOF_LINE;
                $tag .= '        <!-- <div id="login-part">' . EOF_LINE;
                $tag .= '            <span style="margin-left:15px;"><a href="">Login</a></span>' . EOF_LINE;
                $tag .= '            <span style="margin-left:15px;"><a href="">Sign Up</a></span>' . EOF_LINE . EOF_LINE;
                $tag .= '        </div> -->' . EOF_LINE;
                $tag .= '        <div class="clear"></div>' . EOF_LINE;
                $tag .= '    </div>' . EOF_LINE;
                $tag .= '    <div class="clear"></div>' . EOF_LINE;
                $tag .= '    <!-- Navigator block -->' . EOF_LINE;
                $tag .= '    <div id="nav">' . EOF_LINE;

                if($enableNav == true)
                {
                    $tag .= '        <div id="nav-wrapper" class="middle-align">' . EOF_LINE;
                    $tag .= '            <div id="left-nav">' . EOF_LINE;
                    $tag .= '                <ul>' . EOF_LINE;
                    $tag .= '                    <li ' . ($selNav == "HOME" ? 'class="selected"' : '') . '><a href="'. $this->getNavURL($currentDir, $this->baseDir, $this->homeURL) .'" target="_top">HOME</a></li>' . EOF_LINE;
                    $tag .= '                    <li ' . ((($selNav == "SPR Tracking-Dashboard") || ($selNav == "SPR Tracking-Submit Status") || ($selNav == "SPR Tracking-Report")) ? 'class="selected"' : '') . '>' . EOF_LINE;
                    $tag .= '                        <a href="">SPR Tracking</a>' . EOF_LINE;
                    $tag .= '                        <ul>' . EOF_LINE;
                    $tag .= '                            <li ' . ($selNav == "SPR Tracking-Dashboard" ? 'class="selected"' : 'class="non-selected"') . '><a href="'. $this->getNavURL($currentDir, $this->sprTrackingDir, $this->sprTrackingDashboardURL) .'" target="_top">Dashboard</a></li>' . EOF_LINE;
                    $tag .= '                            <li ' . ($selNav == "SPR Tracking-Submit Status" ? 'class="selected"' : 'class="non-selected"') . '><a href="'. $this->getNavURL($currentDir, $this->sprTrackingDir, $this->sprTrackingSubmitStatusURL) .'" target="_top">Submit Status</a></li>' . EOF_LINE;
                    $tag .= '                            <li ' . ($selNav == "SPR Tracking-Report" ? 'class="selected"' : 'class="non-selected"') . '><a href="'. $this->getNavURL($currentDir, $this->sprTrackingDir, $this->sprTrackingReportURL) .'" target="_top">Report</a></li>' . EOF_LINE;
                    $tag .= '                        </ul>' . EOF_LINE;
                    $tag .= '                    </li>' . EOF_LINE;
                    $tag .= '                    <li ' . ($selNav == "Work Tracker" ? 'class="selected"' : '') . '><a href="'. $this->getNavURL($currentDir, $this->workTrackerDir, $this->workTrackerDashboardURL) .'" target="_top">Work Tracker</a></li>' . EOF_LINE;
                    $tag .= '                    <li>' . EOF_LINE;
                    $tag .= '                        <a href="">Scrum</a>' . EOF_LINE;
                    $tag .= '                        <ul>' . EOF_LINE;
                    $tag .= '                            <li><a href="'. $this->getNavURL($currentDir, $this->scrumDir, $this->scrumDashboardURL) .'" target="_top">Dashboard</a></li>'."\n";
                    $tag .= '                            <li>' . EOF_LINE;
                    $tag .= '                                <a href="" target="_top">Sprint</a>' . EOF_LINE;
                    $tag .= '                                <ul>' . EOF_LINE;
                    $tag .= '                                    <li><a href="'. $this->getNavURL($currentDir, $this->sprintDir, $this->sprintDashboardURL) .'" target="_top">Dashboard</a></li>' . EOF_LINE;
                    $tag .= '                                    <li><a href="'. $this->getNavURL($currentDir, $this->sprintDir, $this->sprintPlanningURL) .'" target="_top">Planning</a></li>' . EOF_LINE;
                    $tag .= '                                    <li><a href="'. $this->getNavURL($currentDir, $this->sprintDir, $this->sprintReviewURL) .'" target="_top">Review</a></li>' . EOF_LINE;
                    $tag .= '                                </ul>' . EOF_LINE . EOF_LINE . EOF_LINE;
                    $tag .= '                            </li>' . EOF_LINE . EOF_LINE;
                    $tag .= '                        <li ' . ($selNav == "Search" ? 'class="selected"' : '') . '><a href="'. $this->getNavURL($currentDir, $this->scrumDir, $this->scrumSearchURL) .'" target="_top">Search</a></li>' . EOF_LINE;
                    $tag .= '                        </ul>' . EOF_LINE;
                    $tag .= '                    </li>' . EOF_LINE;
                    $tag .= '                    <li ' . ($selNav == "About" ? 'class="selected"' : '') . '><a href="'. $this->getNavURL($currentDir, $this->baseDir, $this->aboutURL) .'" target="_top">About</a></li>' . EOF_LINE . EOF_LINE;
                    $tag .= '                    <li ' . ($selNav == "Contact us" ? 'class="selected"' : '') . '><a href="'. $this->getNavURL($currentDir, $this->baseDir, $this->contactURL) .'" target="_top">Contact us</a></li>' . EOF_LINE;
                    $tag .= '                </ul>' . EOF_LINE;
                    $tag .= '            </div>' . EOF_LINE;
                    $tag .= '            <div id="right-nav">' . EOF_LINE;
                    $tag .= '                <ul>' . EOF_LINE;
                    if((isset($_SESSION['project-managment-username'])) && ($_SESSION['project-managment-username'] != ""))
                    {
                        $fname = $cipherObj->decrypt(getItemFromTable("first_name", "user", "user_name = '".$_SESSION['project-managment-username']."'"));
                        $lname = $cipherObj->decrypt(getItemFromTable("last_name", "user", "user_name = '".$_SESSION['project-managment-username']."'"));

                        $tag .= '                    <li>' . EOF_LINE;
                        $tag .= '                        <a href="#" target="_top">'.$fname.' '.$lname.' &#9660;</a>' . EOF_LINE;
                        $tag .= '                        <ul style="text-align: left;">' . EOF_LINE . EOF_LINE . EOF_LINE . EOF_LINE;
                        $tag .= '                            <li><a href="'. $this->getNavURL($currentDir, $this->userDir, $this->profileURL) .'" target="_top">Profile</a></li>' . EOF_LINE . EOF_LINE . EOF_LINE;
                        $tag .= '                            <li><a href="'. $this->getNavURL($currentDir, $this->userDir, $this->changePasswordURL) .'" target="_top">Change Password</a></li>' . EOF_LINE . EOF_LINE;
                        $tag .= '                            <li><a href="'. $this->getNavURL($currentDir, $this->baseDir, $this->logoutURL) .'" target="_top">Logout</a></li>' . EOF_LINE;
                        $tag .= '                        </ul>' . EOF_LINE;
                        $tag .= '                    </li>' . EOF_LINE . EOF_LINE . EOF_LINE;
                    }
                    else
                    {
                        $tag .= '                <li><a href="'. $this->getNavURL($currentDir, $this->userDir, $this->loginURL) .'" target="_top">Login</a></li>' . EOF_LINE . EOF_LINE;
                        $tag .= '                <li><a href="'. $this->getNavURL($currentDir, $this->userDir, $this->signinURL) .'" target="_top">Sign Up</a></li>' . EOF_LINE;
                    }

                    $tag .= '                </ul>' . EOF_LINE;
                    $tag .= '            </div>' . EOF_LINE;
                    $tag .= '            <div class="clear"></div>' . EOF_LINE;
                    $tag .= '        </div>' . EOF_LINE;
                    $tag .= '        <div class="clear"></div>' . EOF_LINE;
                }
                else
                {
                    $tag .= '<div style="margin-bottom: 30px;"></div>' . EOF_LINE;
                }
                $tag .= '    </div>' . EOF_LINE;
                $tag .= '</div> <!-- End of header block -->' . EOF_LINE;
                $tag .= '<div class="clear"></div>' . EOF_LINE;
            }

            return($tag);
        }

        public function footer($currentDir, $hrTagFlag = true)
        {
            $tag = "";

            if($currentDir <> "")
            {
                $this->imagesPath = ($currentDir === "base") ? "images" : "../images";

                if($hrTagFlag == true)
                    $tag .= '<div class="site-footer" style="background-color: #CBC8C8; padding-bottom: 72px;">' . EOF_LINE;

                $tag .= '   <div class="middle-align footer">' . EOF_LINE;
                $tag .= '        <a id="footer-logo" class="footer-logo" href="'. $this->getNavURL($currentDir, "base", $this->homeURL) .'"><img style="border:0" src="'. $this->imagesPath .'/ptc-small.gif" alt="ptc.com"></a>' . EOF_LINE;
                $tag .= '        <nav class="footer-nav">' . EOF_LINE;
                $tag .= '            <a href="'. $this->getNavURL($currentDir, "base", $this->homeURL) .'">HOME</a> |' . EOF_LINE;
                $tag .= '            <a class="up">TOP</a> |' . EOF_LINE;
                $tag .= '            <a href="'. $this->getNavURL($currentDir, "base", $this->aboutURL) .'">ABOUT</a>' . EOF_LINE;
                $tag .= '        </nav>' . EOF_LINE;
                $tag .= '        <div class="copyright">' . EOF_LINE;
                $tag .= '            PTC project management is optimized for SPR tracking, Scrum.' . EOF_LINE;
                $tag .= '            Its help user to maintain SPR records and scrum methodology.<br>' . EOF_LINE;
                $tag .= '            While using this site, you agree to have read and accepted our' . EOF_LINE;
                $tag .= '            <a href="'. $this->getNavURL($currentDir, "about", $this->copyrightURL) .'">terms of use</a> and
                                    <a href="'. $this->getNavURL($currentDir, "about", $this->privacyURL) .'">privacy policy</a>.<br>' . EOF_LINE;
                $tag .= '            <a href="'. $this->getNavURL($currentDir, "about", $this->copyrightURL) .'">Copyright 1999-2014</a> by Abhishek Nath. All Rights Reserved.<br><br>' . EOF_LINE;
                $tag .= '        </div>' . EOF_LINE;
                $tag .= '   </div>' . EOF_LINE;

                if($hrTagFlag == true)
                    $tag .= '</div>' . EOF_LINE;
            }

            return($tag);
        }

        /// private methods
        private function getNavURL($currentDir, $pageDir, $page)
        {
            $finalURL = "";

            if(($currentDir <> "") && ($pageDir <> "") && ($page <> ""))
            {
                /// check currentDir and pageDir is same or not.
                /// if so then pass only page name.
                if($currentDir === $pageDir)
                    $finalURL = $page;
                /// else check currentDir == "base" or not, if so then no need to add leading '..'.
                else if($currentDir === "base")
                    $finalURL = "{$pageDir}/{$page}";
                /// else check pageDir = "base" or not, if so, then add leading '..' not pageDir name.
                else if($pageDir === "base")
                    $finalURL = "../{$page}";
                /// else add leading '..' to propagate proper directory.
                else
                    $finalURL = "../{$pageDir}/{$page}";
            }

            return($finalURL);
        }
    }
?>
