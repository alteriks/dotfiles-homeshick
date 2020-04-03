-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Fixed-8",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 1200, ypos = 0, width = 919, height = 16 }, -- orientation left
    -- position = Static { xpos = 1920, ypos = 0, width = 919, height = 16 },
    -- position = Static { xpos = 1920, ypos = 0, width = 1919, height = 16 },
    lowerOnStart = True,
    commands = [
        -- Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
	--
        Run Com            "sh" ["/home/dajka_krzy_ext/.xmonad/xmonad-xmobar-config/volume.sh"] "volume" 10,
        Run MultiCpu ["-t","| Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "enp0s25" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
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
                                       , "-i"	, "<fc=#CEFFAC>Charged</fc>"
                             ] 50,
        Run StdinReader,
    ],
    sepChar = "%",
    alignSep = "}{",
    -- template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %enp0s25%   <fc=#FFFFCC>%date%</fc>   %KPAO%"
-- Pomobar
    template = "%StdinReader% }{ %battery% %coretemp% %multicpu%   %memory%      <fc=#FFFFCC>%date%</fc> %pomobar%"
}
