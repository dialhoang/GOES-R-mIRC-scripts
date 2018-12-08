#tracking on
on *:JOIN:#tropicalweather: {
  ; Set command channel
  set %cmdchan = #whatever
  ; Check if the latest joiner was the last joiner, if so, quit
  if (%nospamTropicalWeather == $nick) { goto stop }
  ; SIMPLE MODE: Uncomment the next line and comment the two+ lines after that when doing troubleshooting 
  ;if ($nick == goes-r) { goto stop }
  ; Ignores my clients and bots:
  if ((goes-r isin $nick) || (dzi isin $nick) || ($nick == Statistics) || ($nick == wx) || ($nick == gonzobot) || ($nick == Hurricanes)) { goto stop }
  ; Ignores common users
  if ((KindOne isin $nick) || ($nick == Kosmic) || ($nick == KindTwo)) { goto stop }
  notice $nick 2Hello3 $nick $+ 2. Almost all of the action has now moved to the TropicalWeather Discord server, which is easier for most people to use. It is suggested you join us there instead by going to 12https://discord.gg/TropicalWeather9. But if you want to stay, awesome!
  ; Chooses one of the multiple greeting messages at random and sends it to the joiner as a 'notice' PM
  ;var %rand $r(1,2) {
  ;if (%rand == 1) { notice $nick 9Hello3 $nick $+ 9! %track% | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9. }
  ;if (%rand == 2) { notice $nick 9Greetings,10 $nick $+ 9! %track% | notice $nick 9As a bot, I have 13magic powers9! Unlock them with 4!commands9 and 4!wxhelp9.  }
  ; New command to bring attention to a joiner. (More of a log actually)
  ;msg %cmdchan $time 10- The 12join10 event for 7#TropicalWeather 10was triggered by13 $nick 10-6 $fulladdress 10(on5 $adate $+ 10)
  ; Record username of the latest joiner for later examination to prevent spam on user reconnects
  set %nospamTropicalWeather $nick
  :stop
  halt
  :error
  msg %cmdchan $time 10- Oops, there was a fuckup in tracking.mrc:4 $error
  reseterror
} 
#tracking off

ctcp 97:tropgreet: { /set -n %track% $2- | /notice $nick 3 * Tropical tracking message set to: $2- }
;on 97:text:*tropgreet:?: { set -n %track% $$2- | notice $nick 3 * Tropical tracking message set to: $2- }

on *:text:!tracking:#: { msg $chan 12Tropical systems: %track% (12#TropicalWeather) }
on *:text:*tracking:?: { msg $nick 12Tropical systems: %track% (12#TropicalWeather) }

;set -n %track% We're currently tracking 4Cyclone Chapala0 in the 7Arabian Sea (12https://redd.it/3qvxfn), 9no storms in $&
  ;  the 3Atlantic and 9no storms in the 10Pacific.

on 99:text:*tracking on:?:{ .enable #tracking | /msg $nick The auto-greet for TropicalWeather is now switched ON }
on 99:text:*tracking off:?:{ .disable #tracking | /msg $nick The auto-greet for TropicalWeather is now switched OFF }
