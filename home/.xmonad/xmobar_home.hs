-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:xos4 Terminus:pixelsize=12:antialias=true:hinting=true"
    --font = "xft:Fixed-8",
    hideOnStart = False,
    persistent = True,
    pickBroadest = True,
    position = Top,
    --bgColor = "#000000",
    --fgColor = "#ffffff",
    bgColor = "#393939",
    fgColor = "#ffffff",
    -- @home
    --position = Static { xpos = 1365, ypos = 0, width = 1920, height = 26 },
    -- xmobar on laptop screen
    -- position = Static { xpos = 0, ypos = 0, width = 1365, height = 16 },
    lowerOnStart = False,
    commands = [
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3" ] 50,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 50,
        Run Date "%a %b %_d %H:%M" "date" 50,
        Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "#CEFFAC"
                             , "--normal"   , "#FFFFCC"
                             , "--high"     , "#FFB6B0"
                             ] 50,
        Run BatteryP       ["CMB1"] [ "--template" , "Batt: <acstatus>"
                             , "--Low"      , "15"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "#CEFFAC"
                             , "--normal"   , "#FFFFCC"
                             , "--high"     , "#FFB6B0"
                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#FFB6B0>Charging</fc> <left>%"
                                       -- charged status
                                       , "-i"	, "<fc=#CEFFAC>Full</fc>"
                             ] 50,
	--Run Com "python" ["/home/dajka_krzy_ext/bin/show-volume.py"] "vol" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    -- template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %enp0s25%   <fc=#FFFFCC>%date%</fc>   %KPAO%"
    template = "%StdinReader% }{  %battery% %coretemp% %multicpu%   %memory%     <fc=#FFFFCC>%date%</fc>   |                       "
}
