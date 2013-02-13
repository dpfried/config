import XMonad
import XMonad.StackSet as W
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import System.IO
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.StackTile
import XMonad.Layout.Tabbed
import XMonad.Hooks.SetWMName
import XMonad.Actions.GridSelect
-- for mouse resize
import XMonad.Actions.MouseResize
import XMonad.Layout.WindowArranger
-- for cycling workspaces
import XMonad.Actions.CycleRecentWS
import XMonad.Actions.CycleWS
-- for searching windows
import XMonad.Actions.WindowGo
-- prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.AppendFile
import XMonad.Util.Scratchpad

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
    , title =? "room_ground_truther" --> doFloat
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
--    spawn "trayer --SetDockType true --SetPartialStrut true"
    spawn "gnome-settings-daemon"
    spawn "pidof nm-applet || nm-applet"
    spawn "gnome-power-manager"
    setWMName "LG3D"

myXPConfig = amberXPConfig
    -- XPC { font = "-misc-fixed-*-*-*-*-12-*-*-*-*-*-*-*"
        -- , bgColor = "#
                   
-- }

myLayout = mouseResize $ windowArrange $ avoidStruts $ smartBorders tiled ||| smartBorders Grid ||| smartBorders Full ||| smartBorders myTabbed
    where
        tiled = ResizableTall nmaster delta (1/2) []
        myTabbed = tabbed shrinkText dfriedTabConfig 
        nmaster = 1
        delta = 0.03

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal = myTerminal
        ,borderWidth = 2
        --,normalBorderColor = "#1E2340"
        ,normalBorderColor = "#121212"
        ,focusedBorderColor = "yellow"
        ,modMask = mod4Mask
        ,manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayout -- avoidStruts $ Grid -- ||| MirrorTall ||| Tall --layoutHook defaultConfig
        , startupHook = myStartupHook
        , logHook = dynamicLogWithPP $ dfriedPP { ppOutput = hPutStrLn xmproc }
--        , logHook = dynamicLogWithPP $ xmobarPP
--                        { ppOutput = hPutStrLn xmproc
--                        , ppTitle = xmobarColor "green" "" . shorten 50
--                       }
        } `additionalKeys`
        -- screenshots
        [ ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        -- XF86AudioMute
        --, ((0, 0x1008ff12), spawn "/home/dfried/scripts/toggle_mute.sh")
        -- XF86AudioLowerVolume
        --, ((0, 0x1008ff11), spawn "amixer set Master 5%-")
        -- XF86AudioRaiseVolumer 
        --, ((0, 0x1008ff13), spawn "amixer set Master 5%+")
       -- XF86 Suspend
        , ((0, 0x1008ffa7), spawn "home/dfried/scripts/suspend.sh") 
        -- alternate suspend
        , ((mod4Mask, xK_F4), spawn "/home/dfried/scripts/suspend.sh")
        , ((mod4Mask, xK_m), spawn "/home/dfried/scripts/start_gnome_panel close")
        , ((mod4Mask, xK_n), spawn "/home/dfried/scripts/start_gnome_panel open")
        -- diisplay cpu temp
        , ((mod4Mask, xK_F2), spawn "gnome-screensaver-command --lock")
        -- monitor commands
        , ((mod4Mask, xK_F9), spawn "/home/dfried/.screenlayout/single_head.sh")
        , ((mod4Mask, xK_F10), spawn "/home/dfried/.screenlayout/dual_head.sh")
        -- , ((mod4Mask, xK_F11), spawn "/home/dfried/scripts/lab-head.sh")
        -- , ((mod4Mask, xK_F12), spawn "/home/dfried/scripts/monitor-only.sh")
        , ((mod4Mask, xK_s), spawn "/home/dfried/scripts/screenshot.sh")
        -- deprecatedU
        -- , ((mod4Mask, xK_y), spawn "/home/dfried/scripts/add-modes.sh")
        -- grid select
        , ((mod4Mask, xK_g), goToSelected defaultGSConfig)
        , ((mod4Mask, xK_u), spawnSelected defaultGSConfig ["google-chrome", "nautilus", "firefox", "gnome-calculator", "gvim"])
        , ((mod4Mask, xK_i), spawnSelected defaultGSConfig ["nmcli nm enable false", "nmcli nm enable true"])
        , ((mod4Mask, xK_d), spawnSelected defaultGSConfig ["dropbox start", "dropbox stop"])
        -- cycle ws
        , ((mod4Mask, xK_minus), toggleWS)
        -- prompts
        , ((mod4Mask, xK_r), windowPromptGoto myXPConfig)
        , ((mod4Mask, xK_p), shellPrompt myXPConfig)
        -- , ((mod4Mask, xK_e), appendFilePrompt myXPConfig "/home/dfried/notes")
        , ((mod4Mask, xK_c), scratchpadSpawnActionCustom "gnome-terminal --disable-factory --name scratchpad")
        ]

dfriedPP = defaultPP { ppCurrent = xmobarColor "white" "" . wrap "|" "|"
                      , ppVisible = wrap "(" ")"
                      , ppUrgent = xmobarColor "red" "yellow"
                      , ppTitle = xmobarColor "white" "" . shorten 60
}

dfriedTabConfig = defaultTheme { 
                                  inactiveColor = "#121212"
                                , activeColor = "#121212"
--                                  inactiveColor = "black"
--                                , activeColor = "black"
                                , inactiveTextColor = "grey"
                                , activeTextColor = "yellow"
                                , fontName = "xft:Envy Code R Bold:pixelsize=11"
                               }

