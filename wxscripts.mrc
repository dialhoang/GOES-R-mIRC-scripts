on *:text:!glm:#: {
  msg $chan GOES-16 vis/GLM animation, updated every 15 minutes: 12ftp://ftp.ssec.wisc.edu/pub/incoming/MARIAaniglm.gif
  msg $chan GOES-16 IR/GLM animation, updated every 15 minutes: 12ftp://ftp.ssec.wisc.edu/pub/incoming/MARIAIRaniglm.gif
}

on *:text:!models:#:{ models }  
on *:text:!newmodels:#:{ newmodels }
on *:text:!modelstatus:#:{ modelstatus }

; Storm category reminder
on *:text:!categories:#:{ /categories }
on *:text:!cats:#:{ /cats }

; Storm names reminder
on *:text:!names:#:{ /names }

; mBar-inHg-kPa
on *:text:!mb *:#:{ /mb $$2 }
on *:text:!hpa *:#:{ /mb $$2 }

;Pressure conversion
on *:text:!inhg *:#: { 
  var %inhg = $$2-
  var %mb = $round($calc(%inhg * 33.86),2)
  var %mmhg = $round($calc(%inhg * 25.4),2)
  msg $chan 04 $+ %inhg 12inHg = 04 $+ %mb 12mbar/hPa = 04 $+ %mmhg 12mmHg.
}

; handles hpa/mb/mbar to inHg and mmHg. PCRE regex.
;on $*:text:m/^\!['hpa'\s|'mb'\s|'mbar'\s]+/:#: {
;  var %mb = $$2-
;  var %inhg = $round($calc(%mb / 33.86),2)
;  var %mmhg = $round($calc(%mb * 0.7501),2)
;  msg $chan 04 $+ %mb 12mbar/hPa = 04 $+ %inhg 12inHg = 04 $+ %mmhg 12mmHg.
;}

; KT-MPH-KPH
on *:text:!kts *:#:{ /kts $$2 }
on *:text:!knot *:#:{ /kts $$2 }
on *:text:!knots *:#:{ kts $$2 }
on *:text:!mph *:#:{ /mph $$2 }
on *:text:!kph *:#:{ /kph $$2 }
on *:text:!kmh *:#:{ /kph $$2 }
on *:text:!ms *:#:{ /ms $$2 }
on *:text:!mps *:#:{ /ms $$2 }
on *:text:!mach *:#:{ /mach $$2 }

; Better distance conversion
on *:text:!mi *:#:{ /mi $$2 }
on *:text:!km *:#:{ /km $$2 }
on *:text:!nm *:#:{ /nm $$2 }
on *:text:!nmi *:#:{ /nmi $$2 }
on *:text:!yd *:#:{ /yd $$2 }
on *:text:!yds *:#:{ /yd $$2 }

;       CELSIUS/FAHRENHEIT CONVERTERS
;Centigrade
;In channels
on *:text:!c2f *:#:{
  var %in = $$2
  var %c2f = $calc((%in * (9/5)) + 32)
  msg $chan 10 $+ %in $+ °C is 03 $+ %c2f $+ °F.
}
on *:text:!c *:#:{
  var %in = $$2
  var %c2f = $calc((%in * (9/5)) + 32)
  msg $chan 10 $+ %in $+ °C is 03 $+ %c2f $+ °F.
}
;In PMs
on *:text:*c2f *:?:{
  var %in = $$2
  var %c2f = $calc((%in * (9/5)) + 32)
  msg $nick 10 $+ %in $+ °C is 03 $+ %c2f $+ °F.
}
;Fahrenheit
;In channels
on *:text:!f2c *:#:{
  var %in = $$2
  var %f2c = $calc((%in - 32) * (5/9))
  /msg $chan 03 $+ %in $+ °F is 10 $+ %f2c $+ °C.
}
on *:text:!f *:#:{
  var %in = $$2
  var %f2c = $calc((%in - 32) * (5/9))
  /msg $chan 03 $+ %in $+ °F is 10 $+ %f2c $+ °C.
}
;In PMs
on *:text:*f2c *:?:{
  var %in = $$2
  var %f2c = $calc((%in - 32) * (5/9))
  /msg $nick 03 $+ %in $+ °F is 10 $+ %f2c $+ °C.
}

;       RELATIVE HUMIDITY CALCULATOR
on *:text:!rh *:#:{
  set -u0 %t $2
  set -u0 %td $3
  set %e 2.71828182845904
  if (%t = $null) { msg $chan 12Please include the 4temperature12 and 4dewpoint in °C12. | halt }
  elseif (%td = $null) { msg $chan 12Please include the 4dewpoint in °C12. | halt }
  else msg $chan 12Temperature:4 %t $+ °C 12- Dewpoint:4 %td $+ °C
  set %rh $round($calc(100 * (%e ^ ((17.625 * %td) / (243.04 + %td)) / %e ^ ((17.625 * %t) / (243.04 + %t)))),1)
  msg $chan 12Relative Humidity =4 %rh $+ %
}

;       DEWPOINT CALCULATOR
on *:text:!td *:#:{
  set -u0 %t $2
  set -u0 %rh $3
  if (%t = $null) { msg $chan 12Please include the 4temperature in °C12 and the 4relative humidity in percent12. | halt }
  elseif (%rh = $null) { msg $chan 12Please include the 4relative humidity in percent12. | halt }
  else { msg $chan 12Temperature:4 %t $+ °C12 - Relative humidity:4 %rh $+ %
    set -u0 %td $round($calc(243.04 * ($log($calc(%rh / 100)) + ((17.625 * %t)/(243.04 + %t)))/(17.625 - $log($calc(%rh / 100)) - ((17.625 * %t)/(243.04 + %t)))),1)
    msg $chan 12Dewpoint temperature =4 %td $+ °C
  }
}

;       HEAT INDEX CALCULATOR - FAHRENHEIT
on *:text:!hif *:#:{
  set -u0 %t $2
  set -u0 %rh $3
  if (%t = $null) { msg $chan 12Please include the 4temperature in °F 12and the 4relative humidity in percent12. | halt }
  elseif (%rh = $null) { msg $chan 12Please include the 4relative humidity in percent12. | halt }
  else {
    set -u0 %tc { $round($calc((%t - 32) * (5/9)),1) }
    msg $chan 12Temperature:4 %t $+ 5°F12 (04 $+ %tc $+ 5°C12) — Relative humidity:4 %rh $+ 5%
    set -u0 %hi $round($calc(-42.379 + 2.04901523 * %t + 10.14333127 * %rh - .22475541 * %t *%rh - .00683783 * %t * %t - .05481717 * %rh * %rh + .00122874 * %t * %t * %rh + .00085282 * %t * %rh * %rh - .00000199 * %t * %t * %rh * %rh),1)
    msg $chan 12Heat Index =4 %hi $+ 5°F 12—4 $round($calc((%hi - 32) * (5/9)),1) $+ 5°C
  }
}

;       HEAT INDEX CALCULATOR - CELSIUS
on *:text:!hih *:#:{
  set -u0 %tc $2
  set -u0 %rh $3
  if (%tc = $null) { msg $chan 12Please include the 4temperature in °C 12and the 4relative humidity in percent12. | halt }
  elseif (%tc > 50) { msg $chan 12Hmm,4,0 %tc $+ °C12 is really hot. Are you trying to use 4Fahrenheit12? Use the 4!hif12 command instead. }
  elseif (%rh = $null) { msg $chan 12Please include the 4relative humidity in percent12. | halt }
  else {
    set -u0 %t { $round($calc((%tc * (9/5)) + 32),1) 
    }
    msg $chan 12Temperature:4 %tc $+ 5°C12 (04 $+ %t $+ 5°F12) — Relative humidity:4 %rh $+ 5%
    set -u0 %hi $calc(-42.379 + 2.04901523 * %t + 10.14333127 * %rh - .22475541 * %t * %rh - .00683783 * %t * %t - .05481717 * %rh * %rh + .00122874 * %t * %t * %rh + .00085282 * %t * %rh * %rh - .00000199 * %t * %t * %rh * %rh)
    msg $chan 12Heat Index =4 $round($calc((%hi - 32) * (5/9)),1) $+ 5°C12 —4 $round(%hi,1) $+ 5°F
  }
}

;       HEAT INDEX CALCULATOR USING DEWPOINT
on *:text:!hi *:#:{
  set -u0 %tc $2
  set -u0 %td $3
  set %e 2.71828182845904
  if (%tc = $null) { msg $chan 12Please include the 4temperature12 and 4dewpoint in °C12. | halt }
  elseif (%tc > 50) { msg $chan 12Hmm,4,0 %tc $+ °C12 is really hot. Are you trying to use 4Fahrenheit12? Use the 4!hif12 command instead. }
  elseif (%td = $null) { msg $chan 12Please include the 4dewpoint in °C12. | halt }
  else {
    set %rh $round($calc(100 * (%e ^ ((17.625 * %td) / (243.04 + %td)) / %e ^ ((17.625 * %tc) / (243.04 + %tc)))),1)
    set -u0 %tf { $round($calc((%tc * (9/5)) + 32),1)
      set -u0 %hi $calc(-42.379 + 2.04901523 * %tf + 10.14333127 * %rh - .22475541 * %tf * %rh - .00683783 * %tf * %tf - .05481717 * %rh * %rh + .00122874 * %tf * %tf * %rh + .00085282 * %tf * %rh * %rh - .00000199 * %tf * %tf * %rh * %rh)
    }
    msg $chan 12Temperature:4 %tc $+ 5°C 12- Dewpoint:4 %td $+ 5°C 12- Relative Humidity =4 %rh $+ 05% 12- Heat Index =4 $round($calc((%hi - 32) * (5/9)),1) $+ 5°C
    ;  msg $chan 12Temperature:4 %tc $+ °C 12- Dewpoint:4 %td $+ °C 12- Relative Humidity =4 %rh $+ % 12- Heat Index =4 $round($calc((%hi - 32) * (5/9)),1) $+ 5°C12 —4 $round(%hi,1) $+ 5°F
  }
}

;       ALTITUDE-TO-PRESSURE
on *:text:!alt *:#: {
  var %alt $calc($2 / 1000)
  var %gp $calc((6356.766 * %alt)/(6356.766 + %alt))
  if ($2 = $null) { msg $chan 12Enter altitude in 4meters12. }
  if $2 < 0 { msg $chan 12Enter 4positive 12values for altitude. }
  elseif (%gp <= 11) {
    var %temp $calc(288.15-(6.5*%gp))
    var %p $calc((101325*((288.15/%temp)^-5.255877))/100)
    var %c $calc(%temp - 273.2)
    msg $chan 12Input:4 $2 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round(%p,1) $+ mb
  }
  elseif (%gp <= 20) {
    var %temp 216.65
    var %p $calc((22632.06 * %e ^ (-0.1577 * (%gp - 11)))/100)
    var %c $calc(%temp - 273.2)
    msg $chan 12Input:4 $2 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round(%p,1) $+ mb
  }
  elseif (%gp <= 32) {
    var %temp 196.65 + %gp
    var %p $calc(5474.889 * ((216.65 / %temp)^34.16319))
    var %c $calc(%temp - 273.2)
    msg $chan 12Input:4 $2 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round($calc(%p / 100),1) $+ mb
  }
  elseif (%gp <= 47) {
    var %temp $calc(228.65 + (2.8 * (%alt - 32)))
    var %p $calc(868.0187 * ((228.65 / %temp)^12.2011))
    var %c $calc(%temp - 273.2)
    msg $chan 12Input:4 $2 $+ m12 - Altitude in km:4 %alt $+ km 12- Geopotential height:4 $round(%gp,2) $+ km 12- Temperature:4 $round(%c,1) $+ °C 12- Pressure:4 $round($calc(%p / 100),1) $+ mb
  }
  else msg $chan Inputs greater than 47000 meters aren't calculated.
}

; FUCK OFF PRESSURE
on *:text:!p *:#: {
  msg $chan 4I don't have time for this shit. Use this: 12https://www.weather.gov/images/jetstream/atmos/mb_heights.jpg
}
