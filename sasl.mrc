/*
mSASL Version 1.0 Beta [sans DLL] designed by Kyle Travaglini
* To use this script you must have the proper DLL
* All I ask is you leave the credit line within the main dialog
* PLEASE read the SASLreadme.txt file before asking questions!


[sans DLL changes]
Tested with versions 6.12, 6.35 and 7.19
Should work with v6.03+ (when $input changed to letter flags)

how to guide w/ pictures if you need help: http://bit.ly/mirc-sasl-howto

- $dll call removed and replaced with scripted version [$SASL(username,password).plain]
- $decode call removed and replaced with plain text [mIRC disables $decode by default]
* a few other edits to fix bugs and add a bit more function

* only plain is supported for AuthType [blank defaults to plain]
* auth timeout support added [blank defaults to 30 seconds]

* break up authenticate lines over 400 characters
* fixed edit network dialog error
- noticed I set the hash tables to binary, removed binary flag [you might lose your settings]
* added checks for required network configuration information
* in network configuration [if left empty]:
*   Domain defaults to 0
*   Real Name defaults to $fullname, if not empty, then *
*   Timeout defaults to 30 seconds [as above]
*   AuthType defaults to PLAIN [as above]
*   Network must be filled in
*   Username must be filled in
*   NS Password must be filled in

* added check for nickname in use error, resend as $me_$rand(a, z)
* fixed some dialog display errors
* change from /quote to /raw

* added check for server list file
*   fixes error when trying to load server list when you have not saved one
* changed manager button text to clarify what they do
*/

alias mSASL.ver { return 1.0 }
alias mSASL.version { return mSASL $+(v, $mSASL.ver) Beta [sans DLL] }
alias mSASL {
  var %cid = $1, %network = $2
  if (%network isin $SASL(%network).nlist) {
    if ($prop == timer) { return $+(.timer, mSASL.TimeOut., %cid, ., %network) }
    elseif ($prop == timeout) {
      if ($SASL(%network).status == Authenticating) { scid %cid .raw CAP END }
    }
  }
}
alias mSASL.show { dialog -m SASL.main SASL.main }
alias f2 { mSASL.show }
menu menubar,status {
  -
  $mSASL.version: mSASL.show
  -
}

alias shname { return SASL }
alias shfile { return $+(", $scriptdir, SASL.hsh, ") }
alias SASL {
  if ($isid) {
    if ($prop == nlist) { return $hget($shname, NLIST) }
    if ($prop == timeout) { return $hget($shname, $+($1, :TIMEOUT)) }
    if ($prop == user) { return $hget($shname, $+($1, :USER)) }
    if ($prop == passwd) { return $hget($shname, $+($1, :PASSWD)) }
    if ($prop == domain) { return $hget($shname, $+($1, :DOMAIN)) }
    if ($prop == realname) { return $hget($shname, $+($1, :REALNAME)) }
    if ($prop == status) { return $hget($shname, $+($1, :STATUS)) }
    if ($prop == authtype) { return $hget($shname, $+($1, :AUTHTYPE)) }
    if ($prop == plain) {
      bset -t &auth 1 $1
      bset -t &auth $calc( $bvar(&auth, 0) + 2 ) $1
      bset -t &auth $calc( $bvar(&auth, 0) + 2 ) $2
      var %len = $encode(&auth, mb)
      return $bvar(&auth, 1, %len).text
    }
  }
}
alias sd { hadd -m $shname $+($1, :, $2) $3- }

on *:START:{
  if (!$hget($shname)) { hmake $shname 50 }
  if ($exists($shfile)) { hload $shname $shfile }
}
on *:EXIT:{
  if (($hget($shname)) && ($hget($shname,0).item > 0)) { hsave $shname $shfile }
}

on ^*:LOGON:*:{
  if ($network isin $SASL($network).nlist) {
    .raw CAP LS
    .raw NICK $me
    .raw USER $SASL($network).user $SASL($network).domain $server : $+ $SASL($network).realname
    sd $network STATUS Connecting
    haltdef
  }
}
on *:CONNECT:{
  if ($network isin $SASL($network).nlist) { sd $network STATUS Connected }
}
on *:DISCONNECT:{
  if ($network isin $SASL($network).nlist) { sd $network STATUS Disconnected }
}

raw CAP:& LS *:{
  if ($network isin $SASL($network).nlist) {
    .raw CAP REQ :multi-prefix sasl
    var %t = $mSASL($cid, $network).timer
    %t 1 $SASL($network).timeout noop $mSASL($cid, $network).timeout
  }
}
raw CAP:& ACK *:{
  if ($network isin $SASL($network).nlist) {
    .raw AUTHENTICATE $SASL($network).authtype
    sd $network STATUS Authenticating
  }
}
raw AUTHENTICATE:+:{
  if ($network isin $SASL($network).nlist) {
    if ($lower($SASL($network).authtype) == plain) {
      var %p = $SASL($SASL($network).user, $SASL($network).passwd).plain, %e
      while ($len(%p) >= 400) {
        var %e = $left(%p, 400), %p = $mid(%p, 401, 0)
        .raw AUTHENTICATE %e
      }
      if ($len(%p)) { .raw AUTHENTICATE %p }
      else { .raw AUTHENTICATE + }
    }
    else { .raw CAP END }
    haltdef
  }
}
raw *:*:{
  if ($network isin $SASL($network).nlist) {
    if ($numeric isnum 903) {
      .raw CAP END
      sd $network STATUS Authenticated
      var %t = $mSASL($cid, $network).timer
      %t off
    }
    elseif ($numeric isnum 904-907) { .raw CAP END }
    elseif ($numeric isnum 433) {
      if ($istokcs(Connecting Authenticating Authenticated, $SASL($network).status, 32)) {
        var %nick_temp = $me $+ _ $+ $rand(a, z)
        echo -setc Info * SASL: Nickname is already in use. Falling back to %nick_temp
        .raw NICK %nick_temp
        .raw USER $SASL($network).user $SASL($network).domain $server : $+ $SASL($network).realname
        haltdef
      }
    }
  }
}

dialog SASL.main {
  title "SASL Manager"
  size -1 -1 150 145
  option dbu
  box "Server List" 1, 5 3 140 113
  text "Created by Kyle Travaglini" 3, 40 135 65 12
  list 4, 10 13 80 104, vsbar, edit
  button "Add Entry" 5, 96 13 43 12
  button "Edit Entry" 6, 96 30 43 12
  button "Delete Entry" 7, 96 47 43 12
  button "Save List" 10, 96 64 43 12
  button "Load List" 11, 96 81 43 12
  button "OK" 8, 27 120 43 12, ok
  button "Update SASL" 9, 77 120 43 12
}

dialog SASL.edit {
  title "Network Configuration"
  size -1 -1 200 120
  option dbu
  box "Network Settings" 1, 5 3 190 97
  text "Network:" 2, 10 13 36 10, right
  edit "" 3, 48 12 92 10
  text "Username:" 4, 10 25 36 10, right
  edit "" 5, 48 24 92 10
  text "NS Password:" 6, 10 37 36 10, right
  edit "" 7, 48 36 92 10
  text "Domain:" 8, 10 49 36 10, right
  edit "" 9, 48 48 92 10
  text "Real Name:" 10, 10 61 36 10, right
  edit "" 11, 48 60 92 10
  text "Timeout:" 12, 10 73 36 10, right
  edit "" 13, 48 72 92 10
  text "AuthType:" 14, 10 85 36 10, right
  edit "" 15, 48 84 92 10
  button "OK" 16, 27 105 43 12, ok
  button "Cancel" 17, 77 105 43 12, cancel
}

dialog SASL.deletewarn {
  title "SASL"
  size -1 -1 120 40
  option dbu
  text "You must specify a network to delete." 1, 13 5 100 10
  button "OK" 2, 40 20 43 12, ok
}

dialog SASL.editwarn {
  title "SASL"
  size -1 -1 120 40
  option dbu
  text "You must specify a network to edit." 1, 13 5 100 10
  button "OK" 2, 40 20 43 12, ok
}

on *:DIALOG:SASL.*:*:*:{
  if ($dname == SASL.main) {
    if ($devent == init) {
      did -r $dname 3
      did -a $dname 3 Created by Kyle Travaglini
      didtok $dname 4 44 $SASL($network).nlist
      ;// disable 'Update SASL' button
      did -b $dname 9
    }
    if ($devent == sclick) {
      if ($did == 5) {
        if ($hget($shname, EDIT) == True) {
          hdel $shname EDIT
          hdel $shname EDITn
        }
        dialog -m SASL.edit SASL.edit
      }
      elseif ($did == 6) {
        if ($did($dname, 4).seltext) {
          hadd -m $shname EDIT True
          hadd -m $shname EDITn $did($dname, 4).seltext
          dialog -m SASL.edit SASL.edit
        }
        else { dialog -m SASL.editwarn SASL.editwarn }
      }
      elseif ($did == 7) {
        if ($did($dname, 4).sel) {
          if ($?!="Are you certain you wish to delete $did($dname, 4).seltext $+ ?") {
            hdel -w $shname $+($did($dname, 4).seltext, :*)
            hadd -m $shname NLIST $remtok($SASL($network).nlist, $did($dname, 4).seltext, 1, 44)
            did -d $dname 4 $did($dname, 4).sel
          }
        }
        else { dialog -m SASL.deletewarn SASL.deletewarn }
      }
      elseif ($did == 9) { usasl } 
      elseif ($did == 10) {
        if (($hget($shname)) && ($hget($shname,0).item > 0)) { hsave $shname $shfile }
      }
      elseif ($did == 11) {
        if ($exists($shfile)) {
          if (!$hget($shname)) { hmake $shname 50 }
          hload $shname $shfile
          did -r $dname 4
          didtok $dname 4 44 $SASL($network).nlist
        }
        else {
          .echo -q $input(No file to load, ohu)
        }
      }
    }
  }
  elseif ($dname == SASL.edit) {
    if ($devent == init) {
      if ($hget($shname, EDIT) == True) {
        var %network = $did(SASL.main, 4).seltext
        did -a $dname 3 %network
        did -a $dname 5 $SASL(%network).user
        did -a $dname 7 $SASL(%network).passwd
        did -a $dname 9 $SASL(%network).domain
        did -a $dname 11 $SASL(%network).realname
        did -a $dname 13 $SASL(%network).timeout
        did -a $dname 15 $SASL(%network).authtype
      }
    }
    if ($devent == sclick) {
      if ($did == 16) {
        var %network = $did($dname, 3), %user = $did($dname, 5), %passwd = $did($dname, 7)
        if ((!%network) || (%network == network name needed)) {
          if (!%network) { did -a $dname 3 network name needed }
          halt
        }
        if ((!%user) || (%user == username name needed)) {
          if (!%user) { did -a $dname 5 username name needed }
          halt
        }
        if ((!%passwd) || (%passwd == password name needed)) {
          if (!%passwd) { did -a $dname 7 password name needed }
          halt
        }
        if ($hget($shname, EDIT) == True) { hadd -m $shname NLIST $remtok($SASL($network).nlist, %network, 1, 44) }
        else {
          if ($findtok($SASL($network).nlist, %network, 1, 44)) {
            if ($?!=" $+ %network already exists; overwrite?") {
              hadd -m $shname NLIST $remtok($SASL($network).nlist, %network, 1, 44)
            }
            else { halt }
          }
        }
        if ($hget($shname, EDIT) == True) && ($hget($shname, EDITn) != %network) {
          if ($?!="rename $hget($shname, EDITn) to %network $+ ?") {
            hdel -w $shname $+($hget($shname, EDITn), :*)
            hadd -m $shname NLIST $remtok($SASL($network).nlist, $hget($shname, EDITn), 1, 44)
          }
          else { halt }
        }
        hdel $shname EDIT
        hdel $shname EDITn
        hadd -m $shname NLIST $+($SASL($network).nlist, $chr(44), %network)
        sd %network USER $did($dname, 5)
        sd %network PASSWD $did($dname, 7)
        sd %network DOMAIN $iif($did($dname, 9), $v1, 0)
        sd %network REALNAME $iif($did($dname, 11), $v1, $iif($fullname, $v1, *))
        sd %network TIMEOUT $iif($did($dname, 13), $v1, 30)
        sd %network AUTHTYPE $iif($did($dname, 15), $upper($v1), PLAIN)
        did -r SASL.main 4
        didtok SASL.main 4 44 $SASL($network).nlist
      }
    }
  }
}
;;
