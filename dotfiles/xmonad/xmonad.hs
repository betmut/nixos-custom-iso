import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc" -- Starts xmobar with a config file
    xmonad $ def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts  $ layoutHook def -- This stops windows from covering the bar
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask
        , terminal = "alacritty"
        }