/modelstatus {
  msg $chan You can find the 4current status of the 12American model suite at this page hosted by 4NCEP: 12https://goo.gl/fn6Td9
  ;msg $chan (Because 3dziban303 can't figure out how to code me properly.)
}

/newmodels {
  msg $chan -----------------------------------
  if ( $daylight > 0 ) { %tz% = 4CDT | %etz% = 4EDT }
  elseif ( $daylight = 0 ) { %tz% = 4CST | %etz% = 4EST }
  %et% = $calc($asctime(HH) + 1)
  %etoffset% = $calc($asctime(z) + 1)
  msg $chan The time is12 $asctime($gmt,HH:nn:ss) 4UTC /12 $asctime(HH:nn:ss) %tz% (4UTC06 $+ $asctime(z) $+ ) /$&
    12 $+ %et% $+ : $+ $asctime(nn:ss) %etz% (4UTC06 $+ %etoffset% $+ ).    
  	
  if ( $asctime($gmt,HH) < 6) { 
    %hours% = 8 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(47 - $asctime($gmt,nn))
    %minsstring% = 12 $+ %mins% minutes 
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    msg $chan %hoursstring% %minsstring% until the 04060012Z 4GFS model run will 12begin at 12~04084712Z.
    %donehours% = 9 - $asctime($gmt,HH)
    %donehoursstring% = 12 $+ %donehours% hours and 
    if %donehours% == 0 { %donehoursstring% = }    
    %donemins% = 64 - $asctime($gmt,nn)
    %doneminsstring% = 12 $+ %donemins% minutes
    if %donemins% == 60 { %donehours% = %donehours% + 1 | %doneminsstring% = }    
    msg $chan The run should be complete in %donehoursstring% %doneminsstring% by 12~04100412Z.
  }

  elseif ( $asctime($gmt,HH) < 12) { 
    %hours% = 14 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(47 - $asctime($gmt,nn))
    %minsstring% = 12 $+ %mins% minutes 
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    msg $chan %hoursstring% %minsstring% until the 04120012Z 4GFS model run will 12begin at 12~04144712Z.
    %donehours% = 15 - $asctime($gmt,HH)
    %donehoursstring% = 12 $+ %donehours% hours and 
    if %donehours% == 0 { %donehoursstring% = }    
    %donemins% = 80 - $asctime($gmt,nn)
    %doneminsstring% = 12 $+ %donemins% minutes
    if %donemins% == 60 { %donehours% = %donehours% + 1 | %doneminsstring% = }    
    msg $chan The run should be complete in %donehoursstring% %doneminsstring% by 12~04162012Z.
  } 

  elseif ( $asctime($gmt,HH) < 18) { 
    %hours% = 20 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(47 - $asctime($gmt,nn))
    %minsstring% = 12 $+ %mins% minutes
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    msg $chan %hoursstring% %minsstring% until the 04180012Z 4GFS model run will 12begin at 12~04204712Z.
    %donehours% = 21 - $asctime($gmt,HH)
    %donehoursstring% = 12 $+ %donehours% hours and 
    if %donehours% == 0 { %donehoursstring% = }    
    %donemins% = 65 - $asctime($gmt,nn)
    %doneminsstring% = 12 $+ %donemins% minutes
    if %donemins% == 60 { %donehours% = %donehours% + 1 | %doneminsstring% = }    
    msg $chan The run should be complete in %donehoursstring% %doneminsstring% by 12~04220512Z.
  } 

  else ( $asctime($gmt,HH) < 24) { 
    %hours% = 26 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(47 - $asctime($gmt,nn))
    %minsstring% = 12 $+ %mins% minutes 
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    msg $chan %hoursstring% %minsstring% until the 04000012Z 4GFS model run will 12begin at 12~04024712Z.
    %donehours% = 27 - $asctime($gmt,HH)
    %donehoursstring% = 12 $+ %donehours% hours and 
    if %donehours% == 0 { %donehoursstring% = }    
    %donemins% = 76 - $asctime($gmt,nn)
    %doneminsstring% = 12 $+ %donemins% minutes
    if %donemins% == 60 { %donehours% = %donehours% + 1 | %doneminsstring% = }    
    msg $chan The run should be complete in %donehoursstring% %doneminsstring% by 12~04041612Z.
  } 
  msg $chan Model run status page from 4NCEP: 12https://goo.gl/fn6Td9
}  

;                       OLD MODEL
/models {
  if ( $daylight > 0 ) { %tz% = 4CDT | %etz% = 4EDT }
  elseif ( $daylight = 0 ) { %tz% = 4CST | %etz% = 4EST }
  %et% = $calc($asctime(HH) + 1)
  %etoffset% = $calc($asctime(z) + 1)
  msg $chan The time is12 $asctime($gmt,HH:nn:ss) 4UTC /12 $asctime(HH:nn:ss) %tz% (4UTC06 $+ $asctime(z) $+ ) /$&
    12 $+ %et% $+ : $+ $asctime(nn:ss) %etz% (4UTC06 $+ %etoffset% $+ ).    
  if ( $asctime($gmt,HH) < 6) { 
    %hours% = 5 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(60 - $asctime($gmt,nn))
    %minsstring% = 12 $+ $calc(60 - $asctime($gmt,nn)) minutes
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    ;    msg $chan 12 $+ %hours% $+ : $+ $calc(60 - $asctime($gmt,nn)) until the 4GFS model run will initialize at 04060005Z.
    msg $chan %hoursstring% %minsstring% until the 4GFS model run will initialize at 04060005Z.
  }

  elseif ( $asctime($gmt,HH) < 12) { 
    %hours% = 11 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(60 - $asctime($gmt,nn))
    %minsstring% = 12 $+ $calc(60 - $asctime($gmt,nn)) minutes
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    msg $chan %hoursstring% %minsstring% until the 4GFS and 4Euro model runs will initialize at 04120005Z.
  } 

  elseif ( $asctime($gmt,HH) < 18) { 
    %hours% = 17 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(60 - $asctime($gmt,nn))
    %minsstring% = 12 $+ $calc(60 - $asctime($gmt,nn)) minutes
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    ;    msg $chan 12 $+ %hours% $+ : $+ %mins% until the 4GFS model run will initialize at 04180005Z.
    msg $chan %hoursstring% %minsstring% until the 4GFS model run will initialize at 04180005Z.
  } 

  else ( $asctime($gmt,HH) < 24) { 
    %hours% = 23 - $asctime($gmt,HH)
    %hoursstring% = 12 $+ %hours% hours and 
    if %hours% == 0 { %hoursstring% = }
    %mins% = $calc(60 - $asctime($gmt,nn))
    %minsstring% = 12 $+ $calc(60 - $asctime($gmt,nn)) minutes
    if %mins% == 60 { %hours% = %hours% + 1 | %minsstring% = }
    ;    msg $chan 12 $+ %hours% $+ : $+ $calc(60 - $asctime($gmt,nn)) until the 4GFS and 4Euro models run will initialize at 04000006Z.
    msg $chan %hoursstring% %minsstring% until the 4GFS and 4Euro model runs will initialize at 04000005Z.
  } 
  msg $chan Model run status page from 4NCEP: 12https://goo.gl/fn6Td9
}  
