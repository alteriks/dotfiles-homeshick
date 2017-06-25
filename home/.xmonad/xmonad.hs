-- TODO: 
-- rofi -show window
--     , ((modm, xK_backslash), CWS.moveTo CWS.Next (CWS.WSIs isEmptyNumWorkspace))
--        -- mod-| %! Move the focused window to an unused workspace and then
--        -- focus there.
--    , ((modm .|. shiftMask, xK_backslash), mtsc)
--        -- mod-s %! Swap contents of current screen with next; focus stays
--        -- here.  Note that this is different from CWS.toggleWS, which
--        -- switches focus to the next *invisible* workspace.
--    , ((modm,               xK_s), CWS.swapNextScreen)
--        -- mod-q %! Focus on next screen or move window to next screen

import System.IO
import Data.Default
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks 
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
--import XMonad.Layout.Groups.Examples
--import XMonad.Layout.Groups

import XMonad.Layout.PerWorkspace
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Themes
import Graphics.X11.ExtraTypes.XF86
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M


------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "/usr/bin/konsole"

-- The command to lock the screen or show the screensaver.
myScreensaver = "/usr/bin/gnome-screensaver-command --lock"

-- The command to take a selective screenshot, where you select
-- what you'd like to capture on the screen.
mySelectScreenshot = "select-screenshot"

-- The command to take a fullscreen screenshot.
myScreenshot = "screenshot"

-- The command to use as a launcher, to launch commands that don't have
-- preset keybindings.
--myLauncher = "$( yeganesh -x -- -fn '-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*' -nb '#000000' -nf '#FFFFFF' -sb '#7C7C7C' -sf '#CEFFAC')"
myLauncher = "rofi -matching fuzzy -modi combi -show combi -combi-modi window,run"
myTabbed = "tabbed (shrinkText tabConfig)"

------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces = ["1:varia","2:term","3:web","4:vm","5:office"] ++ map show [6..9]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll . concat $
    [ [ className =? "HipChat"        --> doShift "1:varia"
    , className =? "Okular"        --> doShift "1:varia"
    , className =? "dolphin"        --> doShift "1:varia"
    , className =? "Keepassx"       --> doShift "1:varia"
    , className =? "konsole"        --> doShift "2:term"
    , className =? "Vncviewer"      --> doShift "2:term"
    , className =? "spotify"        --> doShift "2:term"
    , className =? "Chromium"       --> doShift "3:web"
    , className =? "Google-chrome"  --> doShift "3:web"
    , className =? "Google-chrome-unstable"  --> doShift "3:web"
    , className =? "Firefox"        --> doShift "3:web"
    , className =? "Opera"          --> doShift "3:web"
    <+> composeOne [ isDialog -?> doCenterFloat
                     , title =? "Open Files" -?> doCenterFloat]
    , resource  =? "desktop_window" --> doIgnore
    , className =? "Galculator"     --> doFloat
    , className =? "xpad"           --> doFloat
    , resource  =? "gpicview"       --> doFloat
    , className =? "MPlayer"        --> doFloat
    , className =? "VirtualBox"     --> doShift "4:vm"
    , className =? "stalonetray"    --> doIgnore
    , resource =? "remmina"       --> viewShift "4:vm" 
    , resource =? "xfreerdp"       --> viewShift "4:vm" 
    , resource =? "rdesktop"       --> viewShift "4:vm" 
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]
    , 
    [ className =? "Gimp"           --> viewShift "5:office"
    , resource =? "libreoffice"    --> viewShift "5:office" ]]
    where viewShift = doF . liftM2 (.) W.greedyView W.shift



------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--myLayout = avoidStruts (
--    ThreeColMid 1 (3/100) (1/2) |||
--    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2)) |||
--    tabbed shrinkText tabConfig |||
--    Full |||
--    spiral (6/7)) |||
--    noBorders (fullscreenFull Full) 
-- 
myLayout = avoidStruts (
     tabbed shrinkText tabConfig) |||
     noBorders (fullscreenFull Full) 

--myLayout = tallTabs def

------------------------------------------------------------------------
-- Colors and borders
-- Currently based on the ir_black theme.
--
myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#000000",
    activeColor = "#ffb6b0",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#393939"
    --inactiveColor = "#000000"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 2


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod1Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)


  --, ((modMask, xK_h), shrinkMasterGroups)
  -- Lock the screen using command specified by myScreensaver.
  , ((modMask .|. controlMask, xK_l),
     spawn myScreensaver)

  -- Spawn the launcher using command specified by myLauncher.
  -- Use this to launch programs without a key binding.
  , ((modMask, xK_p),
     spawn myLauncher)

  , ((modMask, xK_i),
     spawn "networkmanager_dmenu")

  -- Take a selective screenshot using the command specified by mySelectScreenshot.
  , ((modMask .|. shiftMask, xK_p),
     spawn mySelectScreenshot)

  -- Take a full screenshot using the command specified by myScreenshot.
  , ((modMask .|. controlMask .|. shiftMask, xK_p),
     spawn myScreenshot)

  , ((0, 0xff61),
     spawn "spectacle")

  -- Decrease brightness
  , ((0, 0x1008ff03),
     spawn "xbacklight -inc -10")
  
  -- Increase brightness
  , ((0, 0x1008ff02),
     spawn "xbacklight -inc +10")

  -- Mute volume.
  , ((0, xF86XK_AudioMute),
     spawn "amixer -q set Master toggle")

  -- Decrease volume.
  , ((0, xF86XK_AudioLowerVolume),
     spawn "amixer -q set Master 10%-")

  -- Increase volume.
  , ((0, xF86XK_AudioRaiseVolume),
     spawn "amixer -q set Master 10%+")
 
  -- Mute volume.
  , ((modMask .|. controlMask, xK_m),
     --spawn "amixer -q set Master toggle")
     spawn "pulse-volume.sh toggle")

  -- Decrease volume.
  , ((modMask .|. controlMask, xK_j),
     --spawn "amixer -q set Master 10%-")
     spawn "pulse-volume.sh increase")

  -- Increase volume.
  , ((modMask .|. controlMask, xK_k),
     --spawn "amixer -q set Master 10%+")
     spawn "pulse-volume.sh decrease")

  -- Audio previous.
  , ((0, 0x1008FF16),
     spawn "")

  -- Play/pause.
  , ((0, 0x1008FF14),
     spawn "")

  -- Audio next.
  , ((0, 0x1008FF17),
     spawn "")

  -- Eject CD tray.
  , ((0, 0x1008FF2C),
     spawn "eject -T")

  , ((modMask, xK_Escape),
     spawn $ "xkill")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)
 
  -- Move focus to the previous window.
  , ((modMask .|. shiftMask, xK_Tab),
     windows W.focusUp  )

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. controlMask, xK_BackSpace),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_BackSpace),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]



------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]


------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--


------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()


------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main = do
  --xmproc <- spawnPipe "~/.xmonad/bin/tray"
  xmproc <- spawnPipe "~/.xmonad/bin/tray && xmobar ~/.xmonad/xmobar.hs"
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = "   "
      }
      , manageHook = manageDocks <+> myManageHook
      --, layoutHook =  myLayout
      , layoutHook = avoidStruts $ myLayout
      , startupHook = setWMName "LG3D"
  }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    -- layoutHook         = (smartBorders $ myLayout 
    -- onWorkspaces ["term", "web" ] tabbed $),
    layoutHook         = onWorkspace "1:varia" (avoidStruts (tabbed shrinkText tabConfig ||| ThreeColMid 1 (3/100) (1/2) |||  GridRatio (4/2))) $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
