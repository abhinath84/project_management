<?php
	require_once("htmltable.php");
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Create HTML Table by own PHP function</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css" />
        <link rel="stylesheet" type="text/css" href="../css/spr_tracking_dashboard.css">
    </head>
    <body>
		<div id = "table-div" align="center" style = "margin-top:30px;">
			<div id="wrapper" class="wrapper page-wrap">
			<?php
				//$Table = new STable();

				// add table header
				//$Table->thead();
				//$Table->th("col1");
				//$Table->th("col2");
				//$Table->th("col3");

				// add a row
				//$Table->tr()
				//	  ->td("val1")
				//	  ->td("val2")
				//	  ->td("val3");

				// add another row
				//$Table->tr()
				//	  ->td("val4")
				//	  ->td("val5")
				//	  ->td("val6");

				// display table
				//print $Table->getTable(); 
				
				$Table = new HTMLTable("spr-tracking-dashboard-table", "blue");

				// add table header
				$Table->thead("spr-tracking-dashboard-thead");
				$Table->th("Item number", null, null, null, "data-sort=\"int\"");
				$Table->th("Type", null,  null, null, "data-sort=\"string\"");
				$Table->th("Status", null, null, null, "data-sort=\"string\"");

				// add a row
				$Table->tbody("spr-tracking-dashboard-tbody");
				$Table->tr();
				$Table->td("<a href=\"http://regdb.ptc.com/regdb/servlet/Index?regbugid=1192881&amp;mode=basic\" target=\"_blank\">1192881</a>", "1192881-spr-no", null, null, "width=\"12%\"");
				$Table->td("REGRESSION", "1192881-type", null, null, "width=\"8%\"");
				$Table->td("SUBMITTED", "1192881-status", null, "background-color:#5CD82F;", "width=\"15%\"", "ondblclick=\"javascript:showSPREditTag('1192881-status', 'select', true)\"");

				// add another row
				$Table->tr();
				$Table->td("<a href=\"http://regdb.ptc.com/regdb/servlet/Index?regbugid=1192881&amp;mode=basic\" target=\"_blank\">1205553</a>", "1205553-spr-no", null, null, "width=\"12%\"");
				$Table->td("REGRESSION", "1205553-type", null, null, "width=\"8%\"");
				$Table->td("SUBMITTED", "1205553-status", null,  null, "width=\"15%\"", "ondblclick=\"javascript:showSPREditTag('1205553-status', 'select', true)\"");
				
				// display table
				print $Table->toHTML();
			?>
			</div>
		</div>
    </body>
</html>
