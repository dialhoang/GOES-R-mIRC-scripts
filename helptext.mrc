;https://www.debuggex.com/cheatsheet/regex/pcre
;regex test
on $*:text:m/^\!test\D{0,1}$/i:#: { 
  msg $chan test!
}

;matches newline with 0 or 1 additional letter after !command and nothing else. case insensitive
on $*:text:m/^\!command\D{0,1}$/i:*: { 
  /commands
}
on *:text:!help:*: { 
  /commands
}

;Sends a notice to user
on *:text:!wxhelp:#: { 
  /wxhelp
}

;Sends to channel
on *:text:!wxhelpwall:#: { 
  /wxhelpwall
}

;Responds to command in a PM
on *:text:*wxhelp:?: { 
  msg $nick Commands for wx bot:
  msg $nick Current conditions: 12wx <4location12> - Forecast: 12wf <4location12> - Hourly forecast: 12hf <4location12>
  msg $nick Space weather: 12swx - Forecast: 12swf
  msg $nick Earthquakes: 12lastquake - Find lat/lon: 12find <4location12> - Local time: 12wxtime <4location12>
  timer 1 4 /msg $nick Commands for GOES-R:
  timer -m 1 4143 /msg $nick Date and time: 12!today - Short form: 12!date - UTC time:12 !time - Met/Aviation format:12 !short
  timer -m 1 4286 /msg $nick Fahrenheit->Centigrade conversion: 12!f2c 12<4input in °F12> - Centigrade->Fahrenheit conversion: 12!c2f 12<4input in °C12>
  timer -m 1 4429 /msg $nick Relative humidity calculator: 12!rh 12<4Temperature12 in 4°C12> <7Dewpoint12 in 4°C12> Ex: 3!rh4 317 21
  timer -m 1 4572 /msg $nick Dewpoint calculator: 12!td 12<4Temperature12 in 4°C12> <7Relative humidity12 in 4%12> Ex: 3!td4 317 55
  timer -m 1 4715 /msg $nick Heat Index calculator: 12!hi 12<4Temperature12 in °C12> <7Dewpoint12 in 4°C12> Ex: 3!hi4 367 33
  timer -m 1 4858 /msg $nick Heat Index calculator (°F): 12!hif 12<4Temperature12 in °f12> <7Relative humidity12 in 4%12> Ex: 3!hif4 877 73
  timer 1 5 /msg $nick Commands for gonzobot:
  timer -m 1 5300 /msg $nick General weather: 12.weather <4location12>
  timer -m 1 5600 /msg $nick METAR: 12.metar <4ICAO code12> - TAF: 12.taf <4ICAO code12>
  timer -m 1 5900 /msg $nick You can find airport ICAO codes at:3  https://www.world-airport-codes.com/ 
  timer -m 1 6300 /msg $nick 12================= End =================
}

;MODERATOR ACTIONS 
on 97:text:*modhelp:?: {
  msg $nick 15,2***********************************************************************************
  msg $nick 12This is a list of commands available to moderators (userlevels of4 97 and above12). Your userlevel:13 $ulevel $+ .
  msg $nick 3Commands which function in private messages:
  msg $nick tracking ......(on|off): Controls auto-greet for 6#TropicalWeather (0499)
  timer 1 4 msg $nick winter ........(on|off): Controls auto-greet for 6#WinterWX (0499)
  timer -m 1 4143 msg $nick wxnotice ......(on|off): Controls auto-greet for 6#Weather (0499)
  timer -m 1 4286 msg $nick greet .........(on|off): Controls auto-greet for 6all other channels (0499)
  timer -m 1 4429 msg $nick uptime ................: Displays uptime statistics for the GOES-R mainframe (0498)
  timer -m 1 4572 msg $nick dziwx .................: Starts 7dziwx bot (0497)
  timer -m 1 4715 msg $nick reboot .......(confirm): Reboots GOES-R mainframe (04100) 
  timer -m 1 4858 msg $nick 9Commands which function via CTCP: 
  timer 1 5 msg $nick tropgreet .....(string): Sets the 6#TropicalWeather greeting message (0497)
  timer -m 1 5300 msg $nick wintergreet ...(string): Sets the 6#WinterWX greeting message (0497)
  timer -m 1 5600 msg $nick join .........(channel): Joins the specified channel (0498) 
  timer -m 1 5850 msg $nick leave ........(channel): Leaves the specified channel (0499)
  timer -m 1 6300 msg $nick 14,2***********************************************************************************/
}

on 97:text:!modhelp:#: {
  msg $nick 15,2***********************************************************************************
  msg $nick 12This is a list of commands available to moderators (userlevels of4 97 and above12). Your userlevel:13 $ulevel $+ .
  msg $nick 3Commands which function in private messages:
  msg $nick tracking ......(on|off): Controls auto-greet for 6#TropicalWeather (0499)
  timer 1 4 msg $nick winter ........(on|off): Controls auto-greet for 6#WinterWX (0499)
  timer -m 1 4143 msg $nick wxnotice ......(on|off): Controls auto-greet for 6#Weather (0499)
  timer -m 1 4286 msg $nick greet .........(on|off): Controls auto-greet for 6all other channels (0499)
  timer -m 1 4429 msg $nick uptime ................: Displays uptime statistics for the GOES-R mainframe (0498)
  timer -m 1 4572 msg $nick dziwx .................: Starts 7dziwx bot (0497)
  timer -m 1 4715 msg $nick reboot .......(confirm): Reboots GOES-R mainframe (04100) 
  timer -m 1 4858 msg $nick 9Commands which function via CTCP: 
  timer 1 5 msg $nick tropgreet .....(string): Sets the 6#TropicalWeather greeting message (0497)
  timer -m 1 5300 msg $nick wintergreet ...(string): Sets the 6#WinterWX greeting message (0497)
  timer -m 1 5600 msg $nick join .........(channel): Joins the specified channel (0498) 
  timer -m 1 5850 msg $nick leave ........(channel): Leaves the specified channel (0499)
  timer -m 1 6300 msg $nick 14,2***********************************************************************************/
}

on 1:text:!modhelp:#: { notice $nick 4You aren't a channel operator. }
