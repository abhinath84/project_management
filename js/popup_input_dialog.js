/*-- 
	File	: js/popup_input_dialog.js
	Author	: Abhishek Nath
	Date	: 01-Jan-2015
	Desc	: All pop-up input dialog related functions.
--*/

/*-- 
	01-Jan-15   V1-01-00   abhishek   $$1   Created.
	17-Jul-15   V1-01-00   abhishek   $$2   File header comment added.
	23-Jul-15   V1-01-00   abhishek   $$3   add functionality to open popup dialog for build_version,
											commit_build while adding new SPR for tracking.
--*/

function show(mode) {
	obj = document.getElementById('popup-wrapper');
	if(mode)
		obj.style.visibility = 'visible';
	else
		obj.style.visibility = 'hidden';    
}

function openPopupDialog(selObj, func)
{
	var offsets = $(selObj).position();
	var o_top = offsets.top;
	var o_left = offsets.left;
	
	func(selObj.id);
	
	$('#form-window').offset({ top: (o_top + 32), left: o_left});
	
	show(true);
}





function showBuildVersionInput()
{
	// Reset all fields
	$('#others-input').css( "display", "none" );
	
	if($('#others-checkbox').prop('checked'))
	{
		$('#others-input').css( "display", "block" );
	}
}

function getBuildVersion(objId, okCancelFlag)
{
	var build_version = "";
	var errMsg = "Please select Build version(s).";
	
	// Reset all fields
	$('.errmsg').css( "display", "none" );
	
	if(okCancelFlag)
	{
		if($('#l03-checkbox').prop('checked'))
		{
			build_version = "L03";
		}
		
		if($('#p10-checkbox').prop('checked'))
		{
			if(build_version == "")
				build_version = "P10";
			else
				build_version += ",P10"
		}
		
		if($('#p20-checkbox').prop('checked'))
		{
			if(build_version == "")
				build_version = "P20";
			else
				build_version += ",P20"
		}
		
		if($('#p30-checkbox').prop('checked'))
		{
			if(build_version == "")
				build_version = "P30";
			else
				build_version += ",P30"
		}
		
		if($('#others-checkbox').prop('checked'))
		{
			if($('#others-input').val() != "")
			{
				if(build_version == "")
					build_version = $('#others-input').val();
				else
					build_version += "," + $('#others-input').val();
			}
			else
			{
				build_version = "";
				errMsg = "Please mention Other build version.";
			}
		}
		
		if(build_version != "")
		{
			document.getElementById(objId).value = build_version;
			
			show(false);
		}
		else
		{
			$('#errmsg-p').html(errMsg);
			$('.errmsg').css("display", "block");
		}
	}
	else
		show(false);
		
	//$('#build-version-p').html(build_version);
}

function getBuildVersionDialog(selObjId)
{
	var tag = "";
	
	tag += '<div id="popup-wrapper" class="popup-wrapper">';
	tag += '	<div class="shield" onclick="show(false)"></div>';
	tag += '	<div id="form-window" class="window window-border window-position" style="width:155px">';
	tag += '		<div class="dialog-footer line">';
	tag += '				<div><p style="margin-top:5px">Build Version</p><hr></div>';
	tag += '				<div class="errmsg" style="display:none"><p id="errmsg-p" style="color:red">Please select Build version(s).</p></div>';
	tag += '				<table class="no-borber-table" style="width:155px">';
	tag += '				<tr>';
	tag += '					<td><input type="checkbox" id="l03-checkbox" style="margin-left: 15px" value="L03"><label>L03</label></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><input type="checkbox" id="p10-checkbox" style="margin-left: 15px" value="P10"><label>P10</label></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><input type="checkbox" id="p20-checkbox" style="margin-left: 15px" value="P20"><label>P20</label></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><input type="checkbox" id="p30-checkbox" style="margin-left: 15px" value="P30"><label>P30</label></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><input type="checkbox" id="others-checkbox" style="margin-left: 15px" value="others" onchange="javascript:showBuildVersionInput()"><label>Others</label></td><td><input id="others-input" type="text" style="display:none; width:50px"></input></td>';
	tag += '				</tr>';
	tag += '				<tr><td colspan="2"><hr style="margin:0; padding:0"></td></tr>';
	tag += '				<tr>';
	tag += '					<td><input type="button" value="Ok" style="margin-left: 15px" onclick="javascript:getBuildVersion(\''+selObjId+'\', true)"/></td>';
	tag += '					<td><input type="button" value="Cancel" onclick="javascript:getBuildVersion(\''+selObjId+'\', false)"/></td>';
	tag += '				</tr>';
	tag += '				</table>';
	tag += '		</div>';
	tag += '	</div>';
	tag += '</div>';
	
	$("#popup-div").html(tag);
}
			
function getMajorPatch()
{
	// Reset All Fields
	$('#majorPatch-select').prop('disabled', true);
	$('#majorPatch-select').html('<option value="Select">Select...</option>');
	$('#minorPatch-select').prop('disabled', true);
	$('#minorPatch-select').html('<option value="Select">Select...</option>');
	
	var version = $('#version-select').val();
	if(version != "Select")
	{
		// L
		if(version == "L")
		{
			$('#majorPatch-select').html('<option value="Select">Select...</option><option value="03">03</option><option value="05">05</option>');
		}
		// P
		else if(version == "P")
		{
			$('#majorPatch-select').html('<option value="Select">Select...</option><option value="10">10</option><option value="20">20</option><option value="30">30</option>');
		}
		
		$('#majorPatch-select').prop('disabled', false);
	}
}

function getMinorPatch()
{
	// Reset All Fields
	$('#minorPatch-select').prop('disabled', true);
	$('#minorPatch-select').html('<option value="Select">Select...</option>');
	
	if($('#majorPatch-select').val() != "Select")
	{
		var version = $('#version-select').val();
		var majorPatch = $('#majorPatch-select').val();
		var upper_limit = 1;;
		
		
		// L-03
		// L-05
		if((version=="L") && ((majorPatch == "03") || (majorPatch == "05")))
		{
			upper_limit = 80;
		}
		// P-10
		// P-20
		else if((version=="P") && ((majorPatch == "10") || (majorPatch == "20")))
		{
			upper_limit = 80;
		}
		// P-30
		else if((version=="P") && (majorPatch == "30"))
		{
			upper_limit = 80;
		}
		
		// fill options
		for(var i=1; i<=upper_limit; i++)
		{
			$('#minorPatch-select').append($('<option>', { 
				value: i.toString(),
				text : i.toString() 
			}));
		}
		
		$('#minorPatch-select').prop('disabled', false);
	}
}

function getCommitBuild(objId, okCancelFlag)
{
	var version 		= $('#version-select').val();
	var majorPatch		= $('#majorPatch-select').val();
	var minorPatch		= $('#minorPatch-select').val();
	
	var commit_build 	= "";
	
	// Reset all fields
	$('.errmsg').css( "display", "none" );
	
	if(okCancelFlag == true)
	{
		if((version != "Select") && (majorPatch != "Select") && (minorPatch != "Select"))
		{
			commit_build = version + "-" + majorPatch + "-" + minorPatch;
			document.getElementById(objId).value = commit_build;
			
			show(false);
		}
		else
		{
			$('.errmsg').css( "display", "block" );
		}
	}
	else
		show(false);
		
	$('#commit-build-p').html(commit_build);
	return(commit_build);
}

function getCommitBuildDialog(selObjId)
{
	var tag = "";
	
	tag += '<div id="popup-wrapper" class="popup-wrapper">';
	tag += '	<div class="shield" onclick="show(false)"></div>';
	tag += '	<div id="form-window" class="window window-border window-position" style="width:155px">';
	tag += '		<div class="dialog-footer line">';
	tag += '				<div><p style="margin-top:5px">Commit Build</p><hr></div>';
	tag += '				<div class="errmsg" style="display:none"><p style="color:red">Please select Build version.</p></div>';
	tag += '				<table class="no-borber-table" style="width:155px">';
	tag += '				<tr>';
	tag += '					<td><select id="version-select" style="margin-left: 5px" onchange="javascript:getMajorPatch()"><option value="Select">Select...</option><option value="L">L</option><option value="P">P</option></select></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><select id="majorPatch-select"m style="margin-left: 5px" onchange="javascript:getMinorPatch()" disabled><option value="Select">Select...</option></select></td>';
	tag += '				</tr>';
	tag += '				<tr>';
	tag += '					<td><select id="minorPatch-select" style="margin-left: 5px" disabled><option value="Select">Select...</option></select></td>';
	tag += '				</tr>';
	tag += '				<tr><td colspan="2"><hr style="margin:0; padding:0"></td></tr>';
	tag += '				<tr>';
	tag += '					<td><input type="button" value="Ok" style="margin-left: 5px" onclick="javascript:getCommitBuild(\''+selObjId+'\',true)"/></td>';
	tag += '					<td><input type="button" value="Cancel" onclick="javascript:getCommitBuild(\''+selObjId+'\',false)"/></td>';
	tag += '				</tr>';
	tag += '				</table>';
	tag += '		</div>';
	tag += '	</div>';
	tag += '</div>';
	
	$("#popup-div").html(tag);
}
