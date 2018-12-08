/vnc {
  echo -a $1
  var -n %host% $1
  if %host% == $null {
    echo -a10No host specified, assuming 2redacted.
    var -n %host% redacted
  }
  echo -a 10Connecting to host2 %host% $+ 10...
  run c:\program files\tightvnc\tvnviewer -host= $+ %host%
}

/backup {
  echo -a 10,1Backing up *.ini and *.mrc files...
  run mircbackup_portable.bat
  echo -a 10,1All done! (Actually, I'm a simple script and as such I have no fucking idea if it worked or not. It probably did, though.)
}

/dziwx {
  if ((dziwx ison #TropicalBots) || (dziwx ison #TropicalWeather) || (dziwx ison #)) { 
    echo -a 4,1dziwx is already on! Aborting.
    halt 
  }
  else {
    echo -a 4,1Launching dziwx...
    run -n dziwx.bat
    echo -a 8,1Batch file launched...
  }
}

/medit /dll "C:\Program Files\mIRC\medit.dll" Load
/quitmedit /dll -u "C:\Program Files\mIRC\medit.dll"
/op /mode # +ooo $$1 $2 $3
/dop /mode # -ooo $$1 $2 $3
/j /join #$$1 $2-
/p /part #
/n /names #$$1
/w /whois $$1
/k /kick # $$1 $2-
/q /query $$1
/send /dcc send $1 $2
/chat /dcc chat $1
/ping /ctcp $$1 ping
/s /server $$1-
/track /msg # %track%

/figure { var %ans% = $calc($$1-) | /echo -a %ans% }
/trop { /msg # %track% }
/winter { /msg # %winter% }

/howmany {
  echo 2 * Counting users in channel
  var %q 0
  :next
  var %nick $nick(#,%q)
  if %nick == $null goto done
  inc %q
  goto next
  :done
  var %p %q - 1
  echo 2 * There are4 %p 2users in channel.
}

/countem { echo 2 * There are4 $nick(#,0) 2users in channel13 # $+ 2. }

/howmany2 {
  ;I'm not really sure why this is so complicated. /countem is way easier.
  if ($1 == $null) { set %reqchan # }
  else { set %reqchan $1 }
  echo 2 * Counting users in channel13 %reqchan
  set %q 0
  :next
  set %nick $nick(%reqchan,%q)
  if %nick == $null goto done
  inc %q
  goto next
  :done
  set %p %q - 1
  echo 2 * There are4 %p 2users in channel.
}

listops {
  echo  
  echo 4,1----------------------------------
  echo 4,1 * Listing Ops on8,1 #
  var %i 1
  :next
  var %nick $nick(#,%i)
  if %nick == $null goto done
  if %nick isop # echo 9,1 %nick is an Op!
  inc %i
  goto next
  :done
  echo 4,1 * End of Ops list
  echo 4,1----------------------------------
  echo  
}

uptime { 
  echo 10,1----------------------------------
  echo 8,1System:4 $uptime(system,1)
  echo 8,1mIRC:9 $uptime(mirc,1)
  echo 8,1Server:12 $uptime(server,1) 
  echo 10,1----------------------------------
}

/mm2in {
  var %m $1
  var %i $round($calc($1 * 0.039370078740158),2)
  echo 4 -ae $1 mm 12equals4 %i inches.
}

/in2mm {
  var %i $1
  var %m $round($calc($1 / 0.039370078740158),2)
  echo 4 -ae $1 inches 12equals4 %m mm.
}

/km2mi {
  var %i = $round($calc($$1 * 0.6213711922),2)
  echo -ae 4,00 $+ $$1 kilometers 12equals4 %i miles. 
}

/mi2km {
  var %i = $round($calc($$1 / 0.6213711922),2)
  echo -ae 4,00 $+ $$1 miles 12equals4 %i kilometers. 
}

/m2f {
  var %i = $round($calc($$1 * 3.28084),2)
  echo -ae 4,00 $+ $$1 meters 12equals4 %i feet. 
}

/f2m {
  var %i = $round($calc($$1 / 3.28084),2) 
  echo -ae 4,00 $+ $$1 feet 12equals4 %i meters.
}
