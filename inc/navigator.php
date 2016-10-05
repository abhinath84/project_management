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

        private $userDir = "user";
        private $profileURL = "profile.php";
        private $loginURL = "login.php";
        private $signinURL = "signUp.php";
    	private $changePasswordURL = "changepwd.php";

        private $imagesPath;
        private $cipherObj;

        public function __construct()
        {

        }

        public header($currentDir, $selNav, $enableNav = true)
        {

        }

        public footer($currentDir, $hrTagFlag = true)
        {

        }
    }

?>
