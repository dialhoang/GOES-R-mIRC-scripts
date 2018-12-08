#wxnotice on
on *:JOIN:#weather: {
  if (($nick == seventhfleet) || (GOES- isin $nick) || (dzi isin $nick) || ($nick == dzubuntu) || ($nick == Aaron)) { goto stop }
  notice $nick Hello4 $nick $+ 1, welcome to #weather. Please note, many of us are probably lurking and won't answer immediately. Please be patient!
  notice $nick If it's important, users can be summoned by typing their nickname.
  ;  msg $chan 10 -tl #weather  Greeting sent to13 $nick 10on5 $adate 10at4 $time $+ 10.
  :stop
  halt
} 
#wxnotice off

on 99:text:*wxnotice on:?:{ .enable #wxnotice | /msg $nick The auto-greet is now switched ON }
on 99:text:*wxnotice off:?:{ .disable #wxnotice | /msg $nick The auto-greet is now switched OFF }
