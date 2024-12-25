import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.InsertPosition

import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeys)
import Graphics.X11.ExtraTypes.XF86

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

scratchpads = [
-- run htop in xterm, find it by title, use default floating window placement
    NS "htop" "st -e htop" (title =? "htop") defaultFloating ,
    NS "term" "st -t terminal" (title =? "terminal") defaultFloating ,

-- run stardict, find it by class name, place it in the floating window
-- 1/6 of screen width from the left, 1/6 of screen height
-- from the top, 2/3 of screen width by 2/3 of screen height
    NS "stardict" "stardict" (className =? "Stardict")
        (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)) ,

-- run gvim, find by role, don't float
    NS "notes" "gvim --role notes ~/notes.txt" (role =? "notes") nonFloating
  ] where role = stringProperty "WM_WINDOW_ROLE"

myKeys conf@(XConfig {modMask = modKey}) =
  [ ((modKey,               xK_Return), spawn $ terminal conf)
  , ((modKey .|. shiftMask, xK_Return), dwmpromote)
  , ((modKey,               xK_Tab),    toggleWS)
  -- Volume Control
  , ((0, xF86XK_AudioMute),        spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
  , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
  , ((0, xF86XK_AudioMicMute),     spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  -- Brightness Control
  , ((0, xF86XK_MonBrightnessUp),   spawn "brightnessctl set +2%")
  , ((0, xF86XK_MonBrightnessDown), spawn "brightnessctl set 2%-")
          -- , ("M-S-z", spawn "xscreensaver-command -lock")
  , ((modKey .|. controlMask .|. shiftMask, xK_t), namedScratchpadAction scratchpads "term")
  , ((modKey .|. controlMask .|. shiftMask, xK_h), namedScratchpadAction scratchpads "htop")
  -- , ((modKey .|. controlMask .|. shiftMask, xK_n), namedScratchpadAction scratchpads "notes")         -- , ("M-C-s", unGrab *> spawn "scrot -s"        )
  ] ++  
    [((m .|. mod4Mask, k), windows $ f i)
         | (i, k) <- zip ["1","2","3","4","5","6","7","8","9"] [xK_1 .. xK_9]
         , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myManageHook :: ManageHook
myManageHook = composeAll
    [ --className =? "Gimp" --> doFloat
     -- isDialog            --> doFloat
      insertPosition Below Newer
    , namedScratchpadManageHook scratchpads
    ]

myConfig = def
         { terminal = "tabbed -ck st -w"
         , modMask = mod4Mask  -- Rebind Mod to the Super key
         , manageHook = myManageHook
         , focusedBorderColor = "#815BA4"
         , borderWidth = 2
         } 

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = medWhite . wrap " " "" . xmobarBorder "Top" "#06B6EF" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . blue    . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . magenta . ppWindow

    -- | Windows should have *some* title, which should not not exceed a sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 50

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#815BA4" ""
    blue     = xmobarColor "#06B6EF" ""
    white    = xmobarColor "#E7E9DB" ""
    yellow   = xmobarColor "#FEC418" ""
    red      = xmobarColor "#EF6155" ""
    lowWhite = xmobarColor "#A39E9B" ""
    medWhite = xmobarColor "#DDDDDD" ""

main = xmonad 
     . withEasySB (statusBarProp "xmobar /home/ed/.xmonad/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey 
     $ myConfig `additionalKeys` (myKeys myConfig)
