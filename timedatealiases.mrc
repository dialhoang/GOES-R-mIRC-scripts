;Days until start of season
/season {
  set %atlstart June 1
  set %atlend November 30
  echo %atlstart
  echo %atlend
}

/testdst { /msg $chan $daylight }

; /date is locally displayed only 
/date {
  if ( $daylight > 0 ) { %dst% = 3DST 0,1is in effect: the offset is8 + $+ $duration($daylight) $+ 0. }
  elseif ( $daylight = 0 ) { %dst% = 3DST 0,1is not in effect. } 
  echo 0,1The current date is9 $asctime(dddd) $+ 0, the11 $asctime(doo) 0of10 $asctime(mmmm) $+ 0,13 $asctime(yyyy) $+ 0. $&
    It is8 $asctime(HH:nn:ss) ( $+ $asctime(h:nn:ss TT) $+ ) $+ 0,7 $asctime(z) 0hours off GMT 8,1( $+ $asctime($gmt,HH:nn) $+ )0,1. %dst%
}

/today  {
  if ( $daylight > 0 ) { %dst% = 5DST is in effect (13+ $+ $duration($daylight) offset.) }
  elseif ( $daylight = 0 ) { %dst% = 5DST is not in effect. } 
  if ( $daylight > 0 ) { %tz% = 12CDT }
  elseif ( $daylight = 0 ) { %tz% = 12CST }
  /msg $chan Today is3 $asctime(dddd) $+ 1, the4 $asctime(doo) of10 $asctime(mmmm) $+ ,6 $asctime(yyyy) $&
    $+ . It is2 $asctime($gmt,HH:nn:ss) 4UTC ~~10 $asctime(HH:nn:ss) /10 $asctime(h:nn:ss TT) %tz% (4UTC5 $+ $asctime(z) $+ ). %dst%
}

;works as !utc and !time
/utc { 
  if ( $daylight > 0 ) { %tz% = 4CDT }
  elseif ( $daylight = 0 ) { %tz% = 4CST }
  /msg $chan The time is12 $asctime($gmt,HH:nn:ss) 4UTC /12 $asctime(HH:nn:ss) %tz% (4UTC5 $+ $asctime(z) $+ ).
}

;was /utcdate. works as !utcdate and !date
/shortdate {  
  if ( $daylight > 0 ) { %tz% = 4CDT }
  elseif ( $daylight = 0 ) { %tz% = 4CST }
  %utcday% = 10 $+ $asctime($gmt,ddd) $+ 3
  %cdtday% = 10 $+ $asctime(ddd) $+ 3
  /msg $chan 4UTC:12 $asctime($gmt,HH:nn) on10 %utcday% $asctime($gmt,d mmm 'yy) ~~ %tz% $+ :12 $asctime(H:nn) on10 %cdtday% $asctime(d mmm 'yy) (4UTC5 $+ $asctime(z) $+ ) $+ .
}

/shortest {
  /msg $chan It is3 $asctime($gmt,mmddyy) $+ 12 $asctime($gmt,HHnnss) $+ 4Z.
}

/time { utc }

/utcdate { shortdate }

/short { shortest }

/dziage {
  %age% = $calc($ctime - $ctime(6th October 1980 8:00pm))
  %age1% = $duration($calc($ctime - $ctime(6th October 1980 8:00pm)))
  %minutes = $calc(%age% / 60)
  %hours = $calc(%age% / 3600)
  %days = $calc(%age% / 86400)
  %moons = $calc(%days / 29.53059)
  /msg $chan dziban303 is4 %age% seconds old. That's5 %age1% $+ , or7 $round(%minutes,2) $+  minutes, or11 $round(%hours,2) $+  hours, or6 $round(%days,2) $+  days, or14 $round(%moons,2) $+  moons.
  unset %age%
  unset %age1%
}
