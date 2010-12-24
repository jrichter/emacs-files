(set-face-attribute 'default nil :height 100)
(require 'vimpulse)
(color-theme-twilight)
(set-face-attribute 'default nil :font "Monaco-9")
(if (window-system)
    (set-frame-size (selected-frame) 100 115))
(eval-after-load 'paredit
  '(progn
     (require 'paredit-viper-compat)
     (paredit-viper-compat)))
