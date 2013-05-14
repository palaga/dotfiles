import XMonad
import XMonad.Actions.Volume
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Util.Dzen
import XMonad.Util.EZConfig(additionalKeysP)

--import qualified XMonad.StackSet as W


-- Start main:
main = xmonad =<< statusBar "xmobar" xmobarPP toggleStrutsKey myConfig where
  toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


-- My general and key configuration:
myTerminal           = "urxvtc"
myModMask            = mod4Mask
myBorderWidth        = 1
myFocusedBorderColor = "#00ff00"
myFocusFollowsMouse  = False
myWorkspaces         = [ "web"   , "code"  , "ssh"
                       , "4"     , "5"     , "6"
                       , "music" , "video" , "utils"
                       ]


myConfig = myDefaults `additionalKeysP` myKeys where
  myDefaults = defaultConfig
    { layoutHook         = myLayoutHooks
    , manageHook         = myManageHooks
    , terminal           = myTerminal
    , modMask            = myModMask
    , borderWidth        = myBorderWidth
    , focusedBorderColor = myFocusedBorderColor
    , focusFollowsMouse  = myFocusFollowsMouse
    , workspaces         = myWorkspaces
    }


myKeys =
  [ ("<XF86AudioMute>",        toggleMute    >>= dzenMute)
  , ("<XF86AudioLowerVolume>", lowerVolume 3 >>= dzenVolume)
  , ("<XF86AudioRaiseVolume>", raiseVolume 3 >>= dzenVolume)
  ] where
    dzenVolume = dzenConfig dzenParams . show . round
    dzenMute   = dzenConfig dzenParams . show
    dzenParams = onCurr (center 200 66)
              >=> timeout 1
              >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
              >=> addArgs ["-fg", fgColor]
              >=> addArgs ["-bg", bgColor]
    fgColor    = "#80c0ff"
    bgColor    = "#303030"


-- Hooks:
myLayoutHooks = avoidStruts $ smartBorders $ layoutHook defaultConfig
myManageHooks = manageDocks <+> composeAll
  [ isFullscreen               --> doFullFloat
  , className    =? "MPlayer"  --> doFloat
  , className    =? "MPlayer"  --> doShift "video"
  , className    =? "Chromium" --> doShift "web"
  , className    =? "Sonata"   --> doShift "music"
  ]

