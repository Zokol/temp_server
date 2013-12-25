<? 
	$lastmod = date("F d, Y g:i A", filemtime("temp_daily.png")); 
	$last_measures = file_get_contents('/tmp/last_temp.log');
	$temp_start_index = strpos($last_measures, "Inside");
	$temp_div_index = strpos($last_measures, "Outside");
	$last_time = substr($last_measures, 0, $temp_start_index);
	$last_inside_temp = substr($last_measures, $temp_start_index, $temp_div_index - $temp_start_index);
	$last_outside_temp = substr($last_measures, $temp_div_index);
	
	$alarm_raw = file_get_contents('/tmp/alarm_state.log');
?>


<html>
<head>
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="refresh" content="3600" >
  <title>RPi Temperature</title>
  <style>
      BODY 
      { 
        font-family: arial; 
        font-size: 10pt;
        background-repeat: no-repeat; background-position: center center; 
      }
 
      H2, H3 { margin-bottom: 0; }
  </style>
</head>
<body>
  <div style="width: 800px; margin-left: 100px;" >
    <h2>RPi Temperature Inside & Outside</h2>
    <i>Last Modified: <?=$lastmod?></i>
    <br/>
    <br/>
    <div id="container" style="width:480px;height:70px">
    	<div id="left" style="float:left;width:280px">
    		<!--<b>Last measured temperatures:<br/>-->
    		<!--<?=$last_time?><br/>-->
    		<font color="#A00" size="5"><?=$last_inside_temp?></font><br/>
    		<font color="#00F" size="5"><?=$last_outside_temp?></font>
    		<br/><br/>
    	</div>
	
	<div id="right" style="float:right;width:200px;height:70px">
		<?php if(substr($alarm_raw, 0, 4) == "True") : ?>
			<div id="alarm" style="background-color:red;font:bold 30px arial;min-height: 10em; display: table-cell;vertical-align:middle;text-align:center;height:70px;width:200px">
				ALARM!
			</div>
		<?php else : ?>		
			<div id="alarm" style="background-color:green;font:bold 30px arial;min-height: 10em; display: table-cell;vertical-align:middle;text-align:center;height:70px;width:200px">
				OK
			</div>
		<?php endif; ?>
	</div>
    </div>

    <div id="graphs"> 
    <h3>Daily</h3>
    <img src="temp_daily.png" />
     
    <h3>Weekly</h3>
    <img src="temp_weekly.png" />
     
    <h3>Monthly</h3>
    <img src="temp_monthly.png" />
     
    <h3>Yearly</h3>
    <img src="temp_yearly.png" />
    </div>
  </div>
</body>
</html>
