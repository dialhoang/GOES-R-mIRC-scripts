#greet on
on *:JOIN:#spacewx,#spaceweather,#radarloops: {
  ; Set command channel
  set %cmdchan = #whatever
  if %nospamOthers == $nick { goto stop }
  if ((goes-r isin $nick) || (dzi isin $nick) || ($nick == Statistics) || ($nick == wx) || ($nick == gonzobot) || ($nick == Hurricanes)) { 
    goto stop 
  }
  ; Ignores common users
  if ((KindOne isin $nick) || ($nick == Kosmic) || ($nick == KindTwo)) { goto stop }
  var %rand $r(1,2) {
    if (%rand == 1) { notice $nick Welcome aboard,4 $nick $+ ! Stick around and chat awhile. | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9. }
    if (%rand == 2) { notice $nick Ahoy,10 $nick $+ ! Stick around and chat awhile. | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9. }
  }  
  ;notice %cmdchan $time 10- The 12generic join10 event for $chan was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  msg %cmdchan $time 10- The 12generic join10 event for7 $chan 10was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  ;set %nospamOthers $nick
  :stop
  halt
} 
#greet off

on 99:text:greet on:?:{ .enable #greet | /msg $nick The auto-greet is now switched ON }
on 99:text:greet off:?:{ .disable #greet | /msg $nick The auto-greet is now switched OFF }
