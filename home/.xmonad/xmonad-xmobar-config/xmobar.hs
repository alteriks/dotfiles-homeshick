Config { 
     font =         "Terminus:style=Regular:size=10"
   , bgColor =      "black"
   , fgColor =      "#646464"
   , position =     Top 
   , border =       BottomB
   , borderColor =  "#646464"
   , sepChar =  "%"   
   , alignSep = "}{"  
   , template = "%battery% | %multicpu% | %coretemp% | %memory% | %dynnetwork% }{ %StdinReader% || %volume% | %brightness% | %date% "
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)
   , commands = 
        -- volume monitor
        [ Run Com            "sh" ["/home/dajka_krzy_ext/.xmonad/xmonad-xmobar-config/volume.sh"] "volume" 10

        -- backlight brightness monitor

        , Run Com            "sh" ["/home/tsantero/.xmonad/backlight.sh"] "brightness" 10

        -- network monitor 
        , Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: kB/s
                             , "--High"     , "5000"       -- units: kB/s
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- cpu activity monitor
        , Run MultiCpu       [ "--template" , "Cpu: <total0>%|<total1>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 50
                          
        -- memory usage monitor
        , Run Memory         [ "--template" ,"Mem: <usedratio>%"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10

        -- battery monitor
        , Run Battery        [ "--template" , "Batt: <acstatus>"
                             , "--Low"      , "15"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "darkred"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkgreen"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#dAA520>Charging</fc> <left>%"
                                       -- charged status
                                       , "-i"	, "<fc=#006000>Charged</fc>"
                             ] 50
        -- stdin reader
        , Run StdinReader

        -- datetime indicator 
        , Run Date           "<fc=#ABABAB>%F (%a) %T</fc>" "date" 10
        ]
   }
