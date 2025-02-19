{-# LANGUAGE FlexibleContexts #-}
import XMonad 
-- import XMonad  hiding ( (|||) )
-- import XMonad.Layout.LayoutCombinators
-- import XMonad.Layout.OneBig
-- import XMonad.Layout.GridVariants
-- import XMonad.Layout.MultiToggle
-- import XMonad.Layout.MultiToggle.Instances
-- import XMonad.Layout.LayoutBuilder
import XMonad.StackSet as W
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, removeKeys)
import XMonad.Layout.NoBorders
import System.IO
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Maximize
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.StackTile
import XMonad.Layout.Tabbed
import XMonad.Hooks.SetWMName
import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Actions.GridSelect -- this crashes occasionally
-- for mouse resize
import XMonad.Actions.MouseResize
import XMonad.Layout.WindowArranger
-- for cycling workspaces
import XMonad.Actions.CycleRecentWS
import XMonad.Actions.CycleWS
-- for searching windows
import XMonad.Actions.WindowGo
-- for Java swing
import XMonad.Hooks.ICCCMFocus
-- prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.AppendFile
import XMonad.Prompt.AppLauncher
import XMonad.Actions.Search
import XMonad.Util.Scratchpad
-- sub layouts
import XMonad.Layout.SubLayouts
import XMonad.Layout.Fullscreen
-- import XMonad.Layout.WindowNavigation as WN
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows
import XMonad.Layout.Simplest(Simplest(..))
import XMonad.Util.Themes
import Data.Maybe

-- for ModifiedLayout, used in no padding maximize
import XMonad.Layout.LayoutModifier

-- workspace names
import XMonad.Actions.WorkspaceNames

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
    , className =? "Minecraft 1.8" --> doFloat
    ] -- <+> manageScratchPad

myTerminal = "gnome-terminal"
manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
    where 
        h = 0.1   -- terminal height, 10%
        w = 1     -- terminal width, 100%
        t = 1 - h -- distance from top edge, 90%
        l = 1 - w -- distance from left edge, 0%

myStartupHook = do
    -- spawn "pidof stalonetray || stalonetray --icon-gravity E --geometry 2x1-0+0 --max-geometry 2x1-0+0 --background '#121212' --skip-taskbar --icon-size 18 --kludges force_icons_size --window-strut none"
    spawn "killall stalonetray; pidof stalonetray || stalonetray"
--    spawn "trayer --SetDockType true --SetPartialStrut true"
    spawn "pidof polkit-gnome-authentication-agent-1 || /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"
    spawn "pidof unity-settings-daemon || unity-settings-daemon"
    spawn "pidof nm-applet || nm-applet"
    spawn "gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-mute"
    spawn "gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-down"
    spawn "gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-up"
    -- spawn "gnome-power-manager"
    spawn "pidof xscreensaver || xscreensaver -no-splash"
    spawn "pidof xflux || fluxgui"
    spawn "nitrogen --restore"
    -- spawn "pidof xflux || /usr/bin/xflux -z 90210 -k 3400 -nofork"
    -- spawn "~/scripts/redshift.sh"
    setWMName "LG3D"

myXPConfig = amberXPConfig
    { font = "-misc-fixed-*-*-*-*-12-*-*-*-*-*-*-*"
        -- , autoComplete = Just 1000000
}
-- myLayout = windowNavigation $ subTabbed $ (mouseResize $ windowArrange $ avoidStruts $ smartBorders tiled ||| smartBorders Grid ||| smartBorders Full ||| smartBorders myTabbed )
--
myLayout = maximize $ avoidStruts $ (windowNavigation $ mysubTabbed' $ boringWindows rtall) ||| smartBorders Grid ||| smartBorders Full ||| smartBorders myTabbed -- ||| fullscreenFull Full
    where
        rtall = mouseResize $ windowArrange $  smartBorders tiled
        tiled = ResizableTall nmaster delta (1/2) []
        myTabbed = tabbed shrinkText dfriedTabConfig 
        nmaster = 1
        delta = 0.03
        mysubTabbed' x = addTabs shrinkText dfriedTabConfig $ subLayout [] Simplest x

-- myLayout = maximize $ avoidStruts $ smartBorders 
--                  $ WN.windowNavigation 
--                  $ subTabbed 
--                  $ boringWindows 
--                  $
--                  mkToggle (MIRROR ?? NOBORDERS ?? FULL ?? EOT) (Grid (55/34) ||| OneBig (3/4) (3/4) ||| ResizableTall 1 0.03 (1/2) [] ||| Full)

dfriedTabConfig = defaultTheme { 
                                  -- inactiveColor = "#121212"
                                -- , activeColor = "#121212"
                                -- , inactiveColor = "#002B36"
                                -- , activeColor = "#073642"
                                -- , inactiveColor = "black"
                                -- , activeColor = "black"
                                -- , inactiveTextColor = "grey"
                                -- , activeTextColor = "white"
                                activeBorderColor = "#7C7C7C"
                                , activeTextColor = "#CEFFAC"
                                , activeColor = "#000000"
                                , inactiveBorderColor = "#7C7C7C"
                                , inactiveTextColor = "#EEEEEE"
                                , inactiveColor = "#000000"
                                , fontName = "xft:Envy Code R Bold:pixelsize=10"
                               }


main = do
    xmproc <- spawnPipe "xmobar"
    --xmproc <- spawnPipe "echo"
    xmonad $ defaultConfig
        { terminal = myTerminal
        ,borderWidth = 4
        ,normalBorderColor = "#002b36"
        -- ,normalBorderColor = "#121212"
        -- ,focusedBorderColor = "#657b83"
        ,focusedBorderColor = "white"
        -- ,focusedBorderColor = "yellow"
        --,focusedBorderColor = "#99CCFF"
        ,modMask = mod4Mask
        ,manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayout -- avoidStruts $ Grid -- ||| MirrorTall ||| Tall --layoutHook defaultConfig
        , startupHook = myStartupHook
        -- logHook = dynamicLogWithPP $ dfriedPP { ppOutput = hPutStrLn xmproc }
        , logHook = workspaceNamesPP dfriedPP { ppOutput = hPutStrLn xmproc } >>= dynamicLogWithPP
        -- , logHook = takeTopFocus
--        , logHook = dynamicLogWithPP $ xmobarPP
--                        { ppOutput = hPutStrLn xmproc
--                        , ppTitle = xmobarColor "green" "" . shorten 50
--                       }
        } `additionalKeys`
        -- screenshots
        [ -- ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        -- alternate suspend
        ((mod4Mask, xK_F4), spawn "/home/dfried/scripts/suspend.sh")
        -- , ((0, xK_Print), spawn "scrot")
        -- XF86AudioMute
        -- , ((0, 0x1008ff12), spawn "/home/dfried/scripts/toggle_mute.sh")
        -- XF86AudioLowerVolume
        -- , ((0, 0x1008ff11), spawn "amixer set Master 5%-")
        -- XF86AudioRaiseVolumer 
        -- , ((0, 0x1008ff13), spawn "amixer set Master 5%+")
       -- XF86 Suspend
        -- , ((0, 0x1008ffa7), spawn "home/dfried/scripts/suspend.sh") 
        , ((mod4Mask, xK_F5), spawn "/home/dfried/scripts/start_gnome_panel open")
        , ((mod4Mask, xK_F6), spawn "/home/dfried/scripts/start_gnome_panel close")
        -- , ((mod4Mask, xK_m), spawn "nmcli n off")
        -- , ((mod4Mask, xK_n), spawn "nmcli n on")
        -- diisplay cpu temp
        -- , ((mod4Mask, xK_F2), spawn "xscreensaver-command --lock")
        , ((mod4Mask, xK_F2), spawn "gnome-screensaver-command --lock")
        -- monitor commands
        , ((mod4Mask, xK_F9), spawn "/home/dfried/scripts/single-head.sh")
        , ((mod4Mask, xK_F10), spawn "/home/dfried/scripts/dual-head.sh")
        , ((mod4Mask, xK_F11), spawn "/home/dfried/scripts/lab-head.sh")
        , ((mod4Mask, xK_F12), spawn "/home/dfried/scripts/ext-monitor.sh")
        , ((mod4Mask, xK_s), spawn "/home/dfried/scripts/screenshot.sh")
        , ((mod4Mask, xK_b), sendMessage ToggleStruts)
        -- deprecatedU
        -- , ((mod4Mask, xK_y), spawn "/home/dfried/scripts/add-modes.sh")
        -- grid select
        -- , ((mod4Mask, xK_g), goToSelected defaultGSConfig)
        -- , ((mod4Mask, xK_u), spawnSelected defaultGSConfig ["google-chrome", "nautilus", "firefox", "gnome-calculator", "gvim", "evince", "gnome-terminal", "/opt/cisco/anyconnect/bin/vpnui"])
        -- , ((mod4Mask, xK_i), spawnSelected defaultGSConfig ["nmcli nm enable false", "nmcli nm enable true"])
        -- , ((mod4Mask, xK_d), spawnSelected defaultGSConfig ["dropbox start", "dropbox stop"])
        -- cycle ws
        , ((mod4Mask, xK_minus), toggleWS)
        -- prompts
        , ((mod4Mask, xK_r), windowPromptGoto myXPConfig)
        , ((mod4Mask, xK_i), shellPrompt myXPConfig)
        -- , ((mod4Mask, xK_n), launchApp myXPConfig "nautilus")
        , ((mod4Mask, xK_u), spawn "google-chrome --disable-gpu")
        -- , ((mod4Mask, xK_u), spawn "firefox")
        , ((mod4Mask, xK_d), launchApp myXPConfig "dropbox")
        -- , ((mod4Mask, xK_e), launchApp myXPConfig "evince")
        -- , ((mod4Mask, xK_e), appendFilePrompt myXPConfig "/home/dfried/notes")
        , ((mod4Mask, xK_c), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
        -- groups
        , ((mod4Mask .|. controlMask, xK_h), sendMessage $ pullGroup L)
        , ((mod4Mask .|. controlMask, xK_l), sendMessage $ pullGroup R)
        , ((mod4Mask .|. controlMask, xK_k), sendMessage $ pullGroup U)
        , ((mod4Mask .|. controlMask, xK_j), sendMessage $ pullGroup D)

        -- maximize
        , ((mod4Mask, xK_backslash), withFocused (sendMessage . maximizeRestore))
        -- , ((mod4Mask, xK_backslash), sendMessage $ Toggle FULL)
        -- focus master
        , ((mod4Mask, xK_m), windows W.focusMaster)
        -- mirror
        -- , ((mod4Mask, xK_m), sendMessage $ Toggle MIRROR)

        , ((mod4Mask .|. controlMask, xK_m), withFocused (sendMessage . MergeAll))
        , ((mod4Mask .|. controlMask, xK_u), withFocused (sendMessage . UnMerge))
        , ((mod4Mask .|. shiftMask, xK_period), onGroup W.focusDown')
        , ((mod4Mask .|. shiftMask, xK_comma), onGroup W.focusUp')
        , ((mod4Mask, xK_period), XMonad.Layout.BoringWindows.focusDown)
        , ((mod4Mask, xK_comma), XMonad.Layout.BoringWindows.focusUp)
        -- since xmonad ignores WM_TAKE_FOCUS
        , ((mod4Mask, xK_o), takeTopFocus)


        --
        , ((mod4Mask .|. shiftMask , xK_r), renameWorkspace myXPConfig)
        , ((mod4Mask, xK_v), spawn "gksudo systemctl restart network-manager")
        , ((0, xF86XK_AudioMute), spawn "amixer -q -D pulse sset Master toggle")
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q -D pulse sset Master 6%-")
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q -D pulse sset Master 6%+")
        , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
        , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +10")

        ] 
        -- `removeKeys`
        --  [(mod4Mask, xK_Tab), (mod4Mask .|. shiftMask, xK_Tab)]

dfriedPP = defaultPP { ppCurrent = xmobarColor "white" "" . wrap "|" "|"
                      , ppVisible = wrap "(" ")"
                      , ppUrgent = xmobarColor "red" "white"
                      , ppTitle = xmobarColor "white" "" . shorten 60
}

