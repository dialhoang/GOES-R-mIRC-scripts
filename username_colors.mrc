; Username colors
; Remote Tab

on ^*:text:*:#:{
  ;echo -s $cnick($nick).color
  ;echo -s $color(normal text)
  if ($cnick($nick).color == $color(normal text)) { 
    ;echo -s $cnick($nick).color is equal to $color(normal text)
    ;echo -s so %colors
    .cnick $nick $gettok(%colors,$calc(%currentcolor),32)
    if (%currentcolor == $gettok(%colors,0,32)) { 
      set %currentcolor 1
    }
    else {
      inc %currentcolor
    }
  }
  set -u %tmp.match /((?:(?:(?:http|https|ftp|gopher)\72\/\/)|(?:www|ftp)\.)\S+)/Sig
  if ($regex(links, $1-, %tmp.match) > 0) {
    set -u %tmp.text $regsubex(links, $1-, %tmp.match, $chr(31) $+ $chr(3) $+ 12 $+ \t $+ $chr(3) $+ $chr(31))
    //echo -bfmtlr $chan < $+ $chr(3) $+ $cnick($nick(#,$nick).pnick).color $+ $nick $+ $chr(3) $+ > %tmp.text
    halt
  }
}
