/wintest { msg $chan %winter% }
/troptest { msg $chan %track% }

/names {
  msg $chan 04 $+ 2018 03Atlantic 2tropical storm names: Alberto Beryl Chris Debby Ernesto Florence Gordon Helene Isaac Joyce Kirk Leslie Michael Nadine Oscar Patty Rafael Sara Tony Valerie William 
  msg $chan 04 $+ 2018 12Eastern Pacific 2tropical storm names: Aletta Bud Carlotta Daniel Emilia Fabio Gilma Hector Ileana John Kristy Lane Miriam Norman Olivia Paul Rosa Sergio Tara Vicente Willa Xavier Yolanda Zeke
  msg $chan 2Source: 12https://www.nhc.noaa.gov/aboutnames.shtml
}

/cats {
  msg $chan 2Tropical weather classifications used by the 2National Hurricane Center:
  msg $chan 10Tropical Depression: 12≤0417 12㎧, 12≤0433 12㏏s, 12≤0438 12mph, 12≤0462 12㎞/h
  msg $chan 3Tropical Storm: 041812–0432 12㎧, 043412–0463 12㏏s, 043912–0473 12mph, 046312–04118 12㎞/h
  msg $chan 7Category 1: 043312–0442 12㎧, 046412–0482 12㏏s, 047412–0495 12mph, 0411912–04153 12㎞/h
  msg $chan 4Category 2: 044312–0449 12㎧, 048312–0495 12㏏s, 049612–04110 12mph, 0415412–04177 12㎞/h
  msg $chan 6Category 3: 045012–0458 12㎧, 049612–04112 12㏏s, 0411112–04129 12mph, 0417812–04208 12㎞/h
  msg $chan 13Category 4: 045812–0470 12㎧, 0411312–04136 12㏏s, 0413012–04156 12mph, 0420912–04251 12㎞/h
  msg $chan 14Category 5: 12≥0470 12㎧, 12≥04137 12㏏s, 12≥04157 12mph, 12≥04252 12㎞/h
}

/categories {
  notice $nick 2Tropical weather classifications used by the 2National Hurricane Center:
  timer -m 1 500 notice $nick 10Tropical Depression: 12≤0417 12㎧, 12≤0433 12㏏s, 12≤0438 12mph, 12≤0462 12㎞/h
  timer -m 1 800 notice $nick 3Tropical Storm: 041812–0432 12㎧, 043412–0463 12㏏s, 043912–0473 12mph, 046312–04118 12㎞/h
  timer -m 1 1100 notice $nick 7Category 1: 043312–0442 12㎧, 046412–0482 12㏏s, 047412–0495 12mph, 0411912–04153 12㎞/h
  timer -m 1 1400 notice $nick 4Category 2: 044312–0449 12㎧, 048312–0495 12㏏s, 049612–04110 12mph, 0415412–04177 12㎞/h
  timer -m 1 1700 notice $nick 6Category 3: 045012–0458 12㎧, 049612–04112 12㏏s, 0411112–04129 12mph, 0417812–04208 12㎞/h
  timer -m 1 2000 notice $nick 13Category 4: 045812–0470 12㎧, 0411312–04136 12㏏s, 0413012–04156 12mph, 0420912–04251 12㎞/h
  timer -m 1 2300 notice $nick 14Category 5: 12≥0470 12㎧, 12≥04137 12㏏s, 12≥04157 12mph, 12≥04252 12㎞/h
}  
;mBar-inHg
/mb {
  var %mb = $$1
  var %kpa = $round($calc(%mb * 0.1),2)
  var %hg = $round($calc(%mb * 0.02953),2)
  var %atm = $round($calc(%mb * 0.0009869),2)
  msg $chan 04 $+ %mb 12㏔/㍱ = 04 $+ %hg 12㏌Hg = 04 $+ %kpa 12㎪ = 04 $+ %atm 12atm.
}
;/hg {
;  var %hg = $$1
;  var %kpa = $round($calc(%hg * 0.1),2)
;  var %mb = $round($calc(%hg * 0.02953),2)
;  var %atm = $round($calc(%hg * 0.0009869),2)
;  msg $chan 04 $+ %hg 12㏔/㍱ = 04 $+ %hg 12㏌Hg = 04 $+ %kpa 12㎪ = 04 $+ %atm 12atm.
;}
;/kpa {
; var %kpa = $$1
; var %mb = $round($calc(%kpa / 0.1),2)
; var %hg = $round($calc(%kpa * 0.02953),2)
;  var %atm = $round($calc(%kpa * 0.0009869),2)
;  msg $chan 04 $+ %kpa 12㏔/㍱ = 04 $+ %hg 12㏌Hg = 04 $+ %kpa 12㎪ = 04 $+ %atm 12atm.
;}
;/atm {
;  var %atm = $$1
;  var %kpa = $round($calc(%atm * 0.1),2)
;  var %hg = $round($calc(%atm * 0.02953),2)
;  var %mb = $round($calc(%atm * 0.0009869),2)
;  msg $chan 04 $+ %atm 12㏔/㍱ = 04 $+ %hg 12㏌Hg = 04 $+ %kpa 12㎪ = 04 $+ %atm 12atm.
;}
;Pressure conversion
/inhg {
  var %inhg = $$1
  var %mb = $round($calc(%inhg * 33.86),2)
  var %mmhg = $round($calc(%inhg * 25.4),2)
  msg $chan 04 $+ %inhg 12inHg = 04 $+ %mb 12mbar/hPa = 04 $+ %mmhg 12mmHg.
}

; KT-MPH-KPH-MACH
/kts {
  var %kts = $$1
  var %mph = $round($calc(%kts * 1.15078),2)
  var %kph = $round($calc(%kts * 1.852),2)
  var %ms = $round($calc(%kts * 0.5144),2)  
  var %mach = $round($calc(%ms / 330),2)
  msg $chan 04 $+ %kts 12㏏s = 04 $+ %mph 12mph = 04 $+ %kph 12kph = 04 $+ %ms 12㎧ = 12Mach04 %mach $+ .
}

/mph {
  var %mph = $$1
  var %kts = $round($calc(%mph / 1.15078),2)
  var %kph = $round($calc(%mph * 1.60934),2)
  var %ms = $round($calc(%mph * 0.447),2)
  var %mach = $round($calc(%ms / 330),2)
  msg $chan 04 $+ %mph 12mph = 04 $+ %kph 12kph = 04 $+ %kts 12㏏s = 04 $+ %ms 12㎧ = 12Mach04 %mach $+ .
}

/kph {
  var %kph = $$1
  var %mph = $round($calc(%kph / 1.60934),2)
  var %kts = $round($calc(%kph / 1.852),2)
  var %ms = $round($calc(%kph * 0.2778),2)
  var %mach = $round($calc(%ms / 330),2)
  msg $chan 04 $+ %kph 12kph = 04 $+ %mph 12mph = 04 $+ %kts 12㏏s = 04 $+ %ms 12㎧ = 12Mach04 %mach $+ .
}

/ms {
  var %ms = $$1
  var %mph = $round($calc(%ms / 0.447),2)
  var %kts = $round($calc(%ms / 0.5144),2)
  var %kph = $round($calc(%ms / 0.2778),2)
  var %mach = $round($calc(%ms / 330),2)
  msg $chan 04 $+ %ms 12㎧ = 04 $+ %mph 12mph = 04 $+ %kph 12kph = 04 $+ %kts 12㏏s = 12Mach04 %mach $+ .
}

/mach {
  var %mach = $$1
  var %ms = $round($calc(330 * %mach),2)
  var %mph = $round($calc(%ms / 0.447),2)
  var %kts = $round($calc(%ms / 0.5144),2)
  var %kph = $round($calc(%ms / 0.2778),2)
  msg $chan 12Mach 04 $+ %mach = 04 $+ %mph 12mph = 04 $+ %kph 12kph = 04 $+ %kts 12㏏s = 04 $+ %ms 12㎧.
}

;Better distance conversion

/mi { 
  var %mi = $$1
  var %km = $round($calc(%mi * 1.609),2)
  var %nm = $round($calc(%mi * 0.869),2)
  var %yd = $round($calc(%mi * 1760),2)
  msg $chan 04 $+ %mi 12mi = 04 $+ %km 12km = 04 $+ %nm 12nmi = 04 $+ %yd 12yds.
}

/km {
  var %km = $$1
  var %mi = $round($calc(%km * 0.6214),2)
  var %nm = $round($calc(%km * 0.54),2)
  var %yd = $round($calc(%km * 1094),2)
  msg $chan 04 $+ %km 12km = 04 $+ %mi 12mi = 04 $+ %nm 12nmi = 04 $+ %yd 12yds.
}

/nm {
  var %nm = $$1
  var %mi = $round($calc(%nm * 1.151),2)
  var %km = $round($calc(%nm * 1.852),2)
  var %yd = $round($calc(%nm * 2025),2)
  msg $chan 04 $+ %nm 12nmi = 04 $+ %mi 12mi = 04 $+ %km 12km = 04 $+ %yd 12yds.
}

/yd {
  var %yd = $$1
  var %mi = $round($calc(%yd / 1760),2) 
  var %km = $round($calc(%yd / 1094),2)
  var %nm = $round($calc(%yd / 2025),2)
  msg $chan 04 $+ %yd 12yds = 04 $+ %mi 12mi = 04 $+ %km 12km = 04 $+ %nm 12nmi.
}

/feet {
  var %feet = $$1
  var %meters = $round($calc(%feet * 0.3048),2)
  msg $chan 04 $+ %feet 12feet = 04 $+ %meters 12meters.
}

/meters {
  var %meters = $$1
  var %feet = $round($calc(%meters / 0.3048),2)
  msg $chan 04 $+ %meters 12meters = 04 $+ %feet 12feet.
}

;Fahrenheit-to-Centigrade conversion
/f2c { 
  var %in = $$1
  var %f2c = $round($calc((%in - 32) * (5/9)),2)
  echo -a - | echo -a 2,14.¸.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸.
  echo # 12,15.Input:03 %in $+ 4°F12 «==» Output:10 %f2c $+ 4°C12.
  echo -a 12,14¸,.·º'°`°'º·.,¸,...,¸,.·º'°`°'º·.,¸ | echo -a -
  ;msg $chan 03 $+ %in $+ °F is 10 $+ %f2c $+ °C.
}

;Centigrade-to-Fahrenheit conversion
/c2f {
  var %in = $$1
  var %c2f = $round($calc((%in * (9/5)) + 32),2)
  echo -a - |  echo -a 12,14.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸.
  echo # 12,15.Input:10 %in $+ 4°C12 «==» Output:03 %c2f $+ 4°F12.
  echo -a 2,14,¸,.·º'°`°'º·.,¸¸,.·º'°`°'º·.,¸,. | echo -a -
  ;echo -a 10 $+ %in $+ °C is 03 $+ %c2f $+ °F.
}

;       RELATIVE HUMIDITY CALCULATOR
/rh {
  var %t $1
  var %td $2
  set %e 2.71828182845904
  if (%t = $null) { echo -ae 12Please include the 4temperature12 and 4dewpoint 12in 4°C12. | halt }
  elseif (%td = $null) { echo -ae 12Please include the 4dewpoint in °C12. | halt }
  else {
    echo -a 11,1,.-~*¨¯¨*·~-.¸-(_10,1Relative Humidity11,1_)-,.-~*¨¯¨*·~-.
    echo -a 12Temperature:4 %t $+ °C 12- Dewpoint:4 %td $+ °C
    var %rh $round($calc(100 * (%e ^ ((17.625 * %td) / (243.04 + %td)) / %e ^ ((17.625 * %t) / (243.04 + %t)))),2)
    echo -a 12Relative Humidity =4 %rh $+ %
    echo -a 11,1_.··`¯´´·.¸¸.·`×º°”˜`”°º××º°”˜`”°º×`·.¸¸.·´´¯`··._
  }
}

;       DEWPOINT CALCULATOR
/td {
  var %t $1
  var %rh $2
  if (%t = $null) { echo -ae 12Please include the 4temperature 12in4 °C12 and the 4relative humidity 12in4 percent12. | halt }
  elseif (%rh = $null) { echo -ae 12Please include the 4relative humidity in percent12. | halt }
  else { echo -a 11,1~-.¸,.-~*¨¯¨*·~-.¸-(_10,1Dewpoint11,1_)-,.-~*¨¯¨*·~-.¸,.-~
    echo -a 12Temperature:4 %t $+ °C12 - Relative humidity:4 %rh $+ %
    var -u0 %td $round($calc(243.04 * ($log($calc(%rh / 100)) + ((17.625 * %t)/(243.04 + %t)))/(17.625 - $log($calc(%rh / 100)) - ((17.625 * %t)/(243.04 + %t)))),2)
    echo -a 12Dewpoint temperature =4 %td $+ °C
    echo -a 11,1_.··`¯´´·.¸¸.·`×º°”˜`”°º××º°”˜`”°º×`·.¸¸.·´´¯`··._
  }
}

;       HEAT INDEX CALCULATOR - FAHRENHEIT
/hif {
  var %t $1
  var %rh $2
  if (%t = $null) { echo -a 12Please include the 4temperature 12in 4°F 12and the 4relative humidity 12in4 percent12. | halt }
  elseif (%rh = $null) { echo -a 12Please include the 4relative humidity in percent12. | halt }
  else {
    echo -a 11,1~-.¸,.-~*¨¯¨*·~-.¸-(_10,1Heat Index11,1_)-,.-~*¨¯¨*·~-.¸,.-~
    echo -a 12Temperature:4 %t $+ °F12 - Relative humidity:4 %rh $+ %
    var %hi $round($calc(-42.379 + 2.04901523 * %t + 10.14333127 * %rh - .22475541 * %t *%rh - .00683783 * %t * %t - .05481717 * %rh * %rh + .00122874 * %t * %t * %rh + .00085282 * %t * %rh * %rh - .00000199 * %t * %t * %rh * %rh),2)
    echo -a 12Heat Index =4 %hi $+ °F
    echo -a 11,1._.··`¯´´·.¸¸.·`×º°”˜`”°º××º°”˜`”°º×`·.¸¸.·´´¯`··._.
  }
}

;       HEAT INDEX CALCULATOR - CELSIUS
/hi {
  var %tc $1
  var %rh $2
  if (%tc = $null) { echo -ae 12Please include the 4temperature in °C 12and the 4relative humidity in percent12. | halt }
  elseif (%tc > 50) { echo -ae 12Hmm,4,0 %tc $+ °C12 is really hot. Are you trying to use 4Fahrenheit12? Use the 4!hif12 command instead. }
  elseif (%rh = $null) { echo -ae 12Please include the 4relative humidity in percent12. | halt }
  else {
    echo -a 11,1~-.¸,.-~*¨¯¨*·~-.¸-(_10,1Heat Index11,1_)-,.-~*¨¯¨*·~-.¸,.-~
    var %t { $calc((%tc * (9/5)) + 32) }
    echo -a 12Temperature:4 %tc $+ °C12 - Relative humidity:4 %rh $+ % 12- Temp °F:4 %t $+ °F12
    var %hi $calc(-42.379 + 2.04901523 * %t + 10.14333127 * %rh - .22475541 * %t * %rh - .00683783 * %t * %t - .05481717 * %rh * %rh + .00122874 * %t * %t * %rh + .00085282 * %t * %rh * %rh - .00000199 * %t * %t * %rh * %rh)
    echo -a 12Heat Index =4 $round($calc((%hi - 32) * (5/9)),2) $+ °C 
    echo -a 11,1._.··`¯´´·.¸¸.·`×º°”˜`”°º××º°”˜`”°º×`·.¸¸.·´´¯`··._.
  }
}

;       ALTITUDE-TO-PRESSURE
/alt {
  var %alt $calc($1 / 1000)
  var %gp $calc((6356.766 * %alt)/(6356.766 + %alt))
  if ($1 = $null) { echo -ae 12Enter altitude in 4meters12. }
  if $1 < 0 { echo -ae 12Enter 4positive 12values for altitude. }
  elseif (%gp <= 11) {
    var %temp $calc(288.15-(6.5*%gp))
    var %p $calc((101325*((288.15/%temp)^-5.255877))/100)
    var %c $calc(%temp - 273.2)
    echo -ae 12Input:4 $$1 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round(%p,2) $+ mb
  }
  elseif (%gp <= 20) {
    var %temp 216.65
    var %p $calc((22632.06 * %e ^ (-0.1577 * (%gp - 11)))/100)
    var %c $calc(%temp - 273.2)
    echo -ae 12Input:4 $$1 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round(%p,2) $+ mb
  }
  elseif (%gp <= 32) {
    var %temp 196.65 + %gp
    var %p $calc(5474.889 * ((216.65 / %temp)^34.16319)))
    var %c $calc(%temp - 273.2)
    echo -ae 12Input:4 $$1 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round($calc(%p / 100),2) $+ mb
  }
  elseif (%gp <= 47) {
    var %temp $calc(228.65 + (2.8 * (%alt - 32)))
    var %p $calc(868.0187 * ((228.65 / %temp)^12.2011))
    var %c $calc(%temp - 273.2)
    echo -ae 12Input:4 $$1 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round($calc(%p / 100),2) $+ mb
  }
  else echo -ae Inputs greater than 47000 meters aren't calculated.
}
/rho alt $1
/pressure alt $1
/press alt $1

/r echo -ae Random: $rand(1,2)
