;       TIME AND DATE FUNCTIONS
on *:text:!today:#:{ today }

on *:text:!date:#:{ shortdate }

on *:text:!utcdate:#:{ shortdate }

on *:text:!time:#:{ utc }

on *:text:!utc:#:{ utc }

on *:text:!short:#:{ shortest }

on *:text:!shortdate:#:{ shortest }

on *:text:!shortest:#:{ shortest }

on 100:text:!dst on:*:{ /set %dstyn% 1 }

on 100:text:!dst off:*:{ /set %dstyn% 0 }

;       GENERAL CALCULATOR
;In channels
on *:text:!calc *:#: { %answer% = $calc($$2-) | /msg $chan %answer% | unset %answer% }
;In PMs
on *:text:!calc *:?: { %answer% = $calc($$2-) | /msg $nick %answer% | unset %answer% }

;       MILLIMETER/INCH CONVERTER
on *:text:!mm2in *:#: { %i = $round($calc($$2- * 0.039370078740158),2) | /msg $chan 4,00 $+ $$2 millimeters 12equals4 %i inches. | unset %i }
;       INCH/MILLIMETER CONVERTER
on *:text:!in2mm *:#: { %i = $round($calc($$2- / 0.039370078740158),2) | /msg $chan 4,00 $+ $$2 inches 12equals4 %i millimeters. | unset %i }
;       CENTIMETER/INCH CONVERTER
on *:text:!cm2in *:#: { %i = $round($calc($$2- * 0.39370078740158),2) | /msg $chan 4,00 $+ $$2 centimeters 12equals4 %i inches. | unset %i }
;       INCH/CENTIMETER CONVERTER
on *:text:!in2cm *:#: { %i = $round($calc($$2- / 0.39370078740158),2) | /msg $chan 4,00 $+ $$2 inches 12equals4 %i centimeters. | unset %i }
;       METER/FOOT CONVERTER
on *:text:!m2ft *:#: { %i = $round($calc($$2- * 3.28084),2) | /msg $chan 4,00 $+ $$2 meters 12equals4 %i feet. | unset %i }
on *:text:!meters *:#: { /meters }
;       FOOT/METER CONVERTER
on *:text:!ft2m *:#: { %i = $round($calc($$2- / 3.28084),2) | /msg $chan 4,00 $+ $$2 feet 12equals4 %i meters. | unset %i }
on *:text:!feet *:#: { /feet }
;       KILOMETER/MILE CONVERTER
on *:text:!km2mi *:#: { %i = $round($calc($$2- * 0.6213711922),2) | /msg $chan 4,00 $+ $$2 kilometers 12equals4 %i miles. | unset %i }
;       MILE/KILOMETER CONVERTER
on *:text:!mi2km *:#: { %i = $round($calc($$2- / 0.6213711922),2) | /msg $chan 4,00 $+ $$2 miles 12equals4 %i kilometers. | unset %i }
;       KILOMETER/FOOT CONVERTER
on *:text:!km2ft *:#: { %i = $round($calc($$2- * 3280.83989501),1) | /msg $chan 4,00 $+ $$2 kilometers 12equals4 %i feet. | unset %i }
;       FOOT/KILOMETER CONVERTER
on *:text:!ft2km *:#: { %i = $round($calc($$2- * 0.0003048),2) | /msg $chan 4,00 $+ $$2 feet 12equals4 %i kilometers. | unset %i }

on *:text:!khz *:#: { %answer% = $calc($$2- / 1000) | /msg $chan $$2 ㎑ = $calc($$2- * 1000) ㎐ = %answer% ㎒ = $calc(%answer% / 1000) ㎓ = $calc(%answer% / 1000000) ㎔ }

;       FREQUENCY/WAVELENGTH CONVERTERS
;In channels
on *:text:!freq *:#: { %answer% = $calc($calc(300000000/$$2-)/1000) | /msg $chan Assuming $$2 is in meters, it corresponds to %answer% ㎑ = $calc(%answer% / 1000) ㎒. | unset %answer% }
on *:text:!wavelength *:#: { %answer% = $calc(300/$$2-) | /msg $chan Assuming $$2 is in ㎒, it corresponds to %answer% meters. | unset %answer% }
on *:text:!lambda *:#: { %answer% = $calc(300/$$2-) | /msg $chan Assuming $$2 is in ㎒, it corresponds to %answer% meters. | unset %answer% }
;In PMs
on *:text:!freq*:?: { %answer% = $calc($calc(300000000/$$2-)/1000) | /msg $nick Assuming $$2 is in meters, it corresponds to %answer% ㎑ = $calc(%answer% / 1000) ㎒. | unset %answer% }
on *:text:!wavelength*:?: { %answer% = $calc(300/$$2-) | /msg $nick Assuming $$2 is in ㎒, it corresponds to %answer% meters. | unset %answer% }
on *:text:!lambda*:?: { %answer% = $calc(300/$$2-) | /msg $nick Assuming $$2 is in ㎒, it corresponds to %answer% meters. | unset %answer% }

;       AGE CALCULATIONS

on *:text:!myage *:#:{
  var %myage = $calc($ctime - $ctime($$2-))
  var %myage1 = $duration($calc($ctime - $ctime($$2-)))
  var %minutes = $calc(%myage / 60)
  var %hours = $calc(%myage / 3600)
  var %days = $calc(%myage / 86400)
  var %moons = $calc(%days / 29.53059)
  /msg $chan 9 $+ $nick is4 %myage seconds old. That's5 %myage1 $+ , or7 $round(%minutes,2) $+  minutes, or11 $round(%hours,2) $+  hours, or6 $round(%days,2) $+  days, or14 $round(%moons,2) $+  moons.
}

on *:text:!moons *:#:{
  %myage = $calc($ctime - $ctime($$2-))
  %myage1 = $duration($calc($ctime - $ctime($$2-)))
  %minutes = $calc(%myage / 60)
  %hours = $calc(%myage / 3600)
  %days = $calc(%myage / 86400)
  %moons = $calc(%days / 29.53059)
  /msg $chan 10 $+ $nick has had14 %moons $+ 10 moons.
}

;        Count
on 98:TEXT:!count:# { msg $chan 12 * There are4 $nick(#,0) 12users in channel13 # $+ 12. }

;        Mods
on 98:TEXT:!countops:# {
  if ($2 == $null) { set %reqchan # }
  else { set %reqchan $2 }
  set %i 1
  set %tot 0
  set %optot 0
  set %hoptot 0
  set %voptot 0
  set %num $nick(%reqchan,0)
  msg $chan 12 * There are4 %num 12users in total.
  :next
  set %nick $nick(%reqchan,%i)
  if (%nick == $null) { goto done }
  if (%nick isop %reqchan) { inc %optot | inc %tot }
  elseif (%nick ishop %reqchan) { inc %hoptot | inc %tot }
  elseif (%nick isvoice %reqchan) { inc %voptot | inc %tot }
  inc %i
  goto next
  :done
  msg $chan 12 * There are4 %tot 7priviledged users12 out of4 %num 7total users.
  msg $chan 12 *4 %optot 10@ops12,4 %hoptot 3%hops12, and4 %voptot 5+vops10.
  msg $chan 12 *4 $round($calc((%tot / %num) * 100),2) 12percent of the users in 13 $+ %reqchan 12are 7priviledged12.
}

;        BEAM
on 98:TEXT:.beam *:# {
  var %rand = $rand(1,4)
  var %victim = $$2-
  if ((dzi isin %victim) || (goes isin %victim) || (%victim == dziban303) || (%victim == dzimobile) || (%victim == itself) || (%victim == goes-r)) {
    %victim = $nick
  }
  if (%rand == 1) { 
    describe $chan focuses a 1686㎒ microwave beam on4 %victim from geostationary orbit.
  }
  if (%rand == 2) {
    describe $chan casts a deadly beam of microwaves on4 %victim from its perch 22,230 miles above the equator.
  }
  if (%rand == 3) {
    describe $chan throws 4,000 watts of 1.686㎓ microwaves at4 %victim $+ .
  }
  if (%rand == 4) {
    describe $chan reduces4 %victim to vapor with a precisely-aimed burst of microwave photons.
  }
  :quitbeam
}
