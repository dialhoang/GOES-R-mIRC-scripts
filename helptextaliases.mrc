/commands {
  msg #dzibania $time 10- The 12!commands10 function was requested by4 $nick 10(userlevel:13 $ulevel $+ 10) in channel12 $chan $+ 10.
  var %rand $rand(1,2) {
    if (%rand == 1) { notice $nick 12,.-~*¨¯¨*·~-.¸-(_ This message is visible only to you _)-,.-~*¨¯¨*·~-. }
    if (%rand == 2) { notice $nick 12_.··`¯´´·.¸¸.·`×º°”˜`”°º×=-[[ This message is visible only to you ]]-=×º°”˜`”°º×`·.¸¸.·´´¯`··._ }
  }
  timer -m 1 500 notice $nick 7Commands for bots which may or may not be in this channel:
  timer -m 1 1000 notice $nick 4GOES-R: Storms we're tracking: 12!tracking - Winter storms we're tracking: 12!winter
  timer -m 1 1200 notice $nick Fahrenheit->Centigrade conversion: 12!f2c 12<4input in °F12> - Centigrade->Fahrenheit conversion: 12!c2f 12<4input in °C12>
  ;notice $nick 12Fahrenheit->Centigrade conversion: 4!f2c 12<7input in °F12>12 - Centigrade->Fahrenheit conversion:4 !c2f 12<7input in °C12>
  timer -m 1 1400 notice $nick ㎜<->Inch conversion: 12!mm2in<->12!in2mm 12<4input in 4㎜ or 4in> - cm<->inch conversion: $&
    12!cm2in<->12!in2cm 12<4input in cm or 4inches12>    
  timer -m 1 1600 notice $nick meter<->foot conversion: 12!m2ft<->12!ft2m 12<4input in 4m or 4ft> - ㎞<->Mile conversion: $&
    12!km2mi<->12!mi2km 12<4input in ㎞ or 4mi12>    
  timer -m 1 1700 notice $nick Barometric pressure at a given altitude: 12!alt 12<4altitude in meters12>
  timer -m 1 1900 notice $nick ㏏s, mph, kph, ㎧ conversion: 12!kts or12 !mph or12 !kph or12 !ms 12<4speed in ㏏s12/4miles per hour12/4kilometers per hour12>
  timer -m 1 1900 notice $nick Frequency/wavelength converters: 12!freq/lambda 12<4input in ㎒/meters12>
  timer -m 1 2000 notice $nick Calculate age: 12!myage 12<4bday12> - This list: 12!commands
  timer -m 1 2500 notice $nick Time & Date functions - Today: 12!today - UTC: 12!utc - Date: 12!date - Short Date: 12!short
  timer -m 1 2700 notice $nick 5weather bots: 12!wxhelp
  timer -m 1 2900 notice $nick 6gonzobot: 12.help 
  if (($nick isop $chan) || ($nick ishop $chan)) { 
    timer -m 1 3400 notice $nick 7It looks like you're an 4op7 or5 half-op7, so you might have access to GOES-R moderator commands: 4!modhelp 
  }
  timer -m 1 4000 timer -m 1 5000 notice $nick 12.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•=(_End_)=•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸.
}

/wxhelp {
  msg #dzibania $time 10- The 12!wxhelp10 function was requested by4 $nick 10(userlevel:13 $ulevel $+ 10) in channel12 $chan $+ 10.
  var %rand $rand(1,2) {
    if (%rand == 1) { notice $nick 12,.-~*¨¯¨*·~-.¸-(_ This message is visible only to you _)-,.-~*¨¯¨*·~-. }
    if (%rand == 2) { notice $nick 12_.··`¯´´·.¸¸.·`×º°”˜`”°º×=-[[ This message is visible only to you ]]-=×º°”˜`”°º×`·.¸¸.·´´¯`··._ }
  }
  notice $nick Commands for wx bot:
  notice $nick Current conditions: 12wx 12<4location12> - Forecast: 12wf 12<4location12> - Hourly forecast: 12hf 12<4location12>
  notice $nick Space weather: 12swx - Forecast: 12swf - Solar eclipse data: 12eclipse 12<4location12>
  notice $nick Earthquakes: 12lastquake - Find lat/lon: 12find 12<4location12> - Local time: 12wxtime 12<4location12>
  notice $nick Weather acronym definitions: 12define 12<4acronym12>  (12what is 12<4acronym12> also works)
  timer -m 1 3800 /notice $nick Commands for GOES-R:
  timer -m 1 3900 notice $nick Tropical storm category breakdown: 12!categories
  timer -m 1 4000 notice $nick Barometric pressure at a given altitude: 12!alt 12<4altitude in meters12>
  timer -m 1 4143 /notice $nick Date and time: 12!today - Short form: 12!date - UTC time:12 !time - Met/Aviation format:12 !short
  timer -m 1 4286 /notice $nick Fahrenheit->Centigrade conversion: 12!f2c 12<4input in °F12> - Centigrade->Fahrenheit conversion: 12!c2f 12<4input in °C12>
  timer -m 1 4357 /notice $nick ㎜<->Inch conversion: 12!mm2in<->12!in2mm <4input in 4㎜12 or 4in12> - km<->Mile conversion: $&
    12!km2mi<->12!mi2km <4input in km12 or 4mi12>
  timer -m 1 4399 /notice $nick ㏏s, mph, kph, ㎧ conversion: 12!kts 12or12 !mph 12or12 !kph 12or12 !ms 12<4speed in ㏏s12/4miles per hour12/4kilometers per hour12>
  timer -m 1 4429 /notice $nick Relative humidity calculator: 12!rh 12<4Temperature12 in 4°C12> <7Dewpoint12 in 4°C12> Ex: 3!rh4 317 21
  timer -m 1 4572 /notice $nick Dewpoint calculator: 12!td 12<4Temperature12 in 4°C12> <7Relative humidity12 in 4%12> Ex: 3!td4 317 55
  timer -m 1 4715 /notice $nick Heat Index calculator: 12!hi 12<4Temperature12 in °C12> <7Dewpoint12 in 4°C12> Ex: 3!hi4 367 31
  timer -m 1 4858 /notice $nick Heat Index calculator (°F): 12!hif 12<4Temperature12 in °f12> <7Relative humidity12 in 4%12> Ex: 3!hif4 877 73
  timer 1 5 /notice $nick Commands for gonzobot:
  timer -m 1 5300 /notice $nick General weather: 12.weather <4location12>
  timer -m 1 5600 /notice $nick METAR: 12.metar <4ICAO code12> - TAF: 12.taf <4ICAO code12>
  timer -m 1 5900 /notice $nick You can find airport ICAO codes at:3  https://www.world-airport-codes.com/ 
  timer -m 1 6300 /notice $nick 12.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•=(_End_)=•*´¨`*•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸.
}

/wxhelpwall {
  msg #dzibania $time 10- The 12!wxhelpwall10 function was requested by4 $nick 10(userlevel:13 $ulevel $+ 10) in channel12 $chan $+ 10.
  msg $chan 12================= Ultra WX Command List =================
  msg $chan Commands for wx bot:
  msg $chan Current conditions: 12wx <4location12> - Forecast: 12wf <4location12> - Hourly forecast: 12hf <4location12>
  msg $chan Space weather: 12swx - Forecast: 12swf
  msg $chan Earthquakes: 12lastquake - Find lat/lon: 12find <4location12> - Local time: 12wxtime <4location12>
  timer 1 5 /msg $chan Commands for GOES-R:
  timer -m 1 5143 /msg $chan Date and time: 12!today - Short form: 12!date - UTC time:12 !time - Met/Aviation format:12 !short
  timer -m 1 5286 /msg $chan Fahrenheit->Centigrade conversion: 12!f2c 12<4input in °F12> - Centigrade->Fahrenheit conversion: 12!c2f 12<4input in °C12>
  timer -m 1 5429 /msg $chan Relative humidity calculator: 12!rh 12<4Temperature12 in 4°C12> <7Dewpoint12 in 4°C12> Ex: 3!rh4 317 21
  timer -m 1 5572 /msg $chan Dewpoint calculator: 12!td 12<4Temperature12 in 4°C12> <7Relative humidity12 in 4%12> Ex: 3!td4 317 55
  timer -m 1 5715 /msg $chan Heat Index calculator: 12!hi 12<4Temperature12 in °C12> <7Dewpoint12 in 4°C12> Ex: 3!hi4 367 33
  timer -m 1 5858 /msg $chan Heat Index calculator (°F): 12!hif 12<4Temperature12 in °f12> <7Relative humidity12 in 4%12> Ex: 3!hif4 877 73
  timer -m 1 5930 /msg $chan ㎜<->Inch conversion: 12!m2i12<->12!i2m12 <4input in 4㎜12 or 4in12>12 - km<->Mile conversion: $&
    12!k2m12<->12!m2k12 <4input in km12 or 4mi12>    
  timer 1 7 /msg $chan Commands for gonzobot:
  timer -m 1 7300 /msg $chan General weather: 12.weather <4location12>
  timer -m 1 7600 /msg $chan METAR: 12.metar <4ICAO code12> - TAF: 12.taf <4ICAO code12>
  timer -m 1 7900 /msg $chan You can find airport ICAO codes at:3  https://www.world-airport-codes.com/ 
  timer -m 1 8300 /msg $chan 12================= End =================
}
