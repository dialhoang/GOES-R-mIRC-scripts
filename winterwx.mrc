#winter off
on *:JOIN:#winterwx: {
  ; Set command channel
  set %cmdchan = #whatever
  if (%nospamWinterWX == $nick) { goto stop }
  if ((goes-r isin $nick) || (dzi isin $nick) || ($nick == Statistics) || ($nick == wx) || ($nick == gonzobot) || ($nick == Hurricanes)) { goto stop }
  if (($nick == KindOne) || ($nick == KindTwo) ||($nick == Kosmic)) { goto stop }
  ;  if (dziban303 ison #winterwx) { msg dziban303 4Wake up! $nick just entered $chan at $time on $day $adate }
  var %rand $r(1,2) {
    if (%rand == 1) { notice $nick Hello4 $nick $+ 9! %winter% | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9. }
    if (%rand == 2) { notice $nick Greetings,10 $nick $+ 9! %winter% | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9. }
    ;    if (%rand == 1) { msg $chan $nick, Hello4 $nick $+ 9! %winter% }
    ;    if (%rand == 2) { msg $chan $nick, Greetings,10 $nick $+ 9! %winter% } 
  }
  ;notice dziban303 $time 10- The 12join10 event for 12#WinterWX 10was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  ;notice %cmdchan $time 10- The 12join10 event for 12#WinterWX 10was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  msg %cmdchan $time 10- The 12join10 event for 12#WinterWX 10was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  set %nospamWinterWX $nick
  :stop
  halt
  :error
  msg %cmdchan $time 10- Oops, there was a fuckup in winterwx.mrc:4 $error
  reseterror
} 
#winter off

ctcp 97:wintergreet: { /set -n %winter% $2- | /notice $nick 3 * Winter tracking message set to: $2- }
;on 97:text:*wintergreet:?: { set -n %winter% $$2- | notice $nick 3 * Winter tracking message set to: $2- }

on *:text:!winter:#: { msg $chan 10Winter systems: %winter% (12#WinterWX) }
on *:text:*winter:?: { msg $nick 10Winter systems: %winter% (12#WinterWX) }

;set -n %winter% We're currently tracking 10no winter storms. 12https://winterwx.reddit.com

on 99:text:*winter on:?:{ .enable #winter | /msg $nick The auto-greet for WinterWX is now switched ON }
on 99:text:*winter off:?:{ .disable #winter | /msg $nick The auto-greet for WinterWX is now switched OFF }
