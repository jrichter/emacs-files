(set-face-attribute 'default nil :height 100)
;(require 'vimpulse)
(require 'color-theme-ir-black)
(color-theme-ir-black)
(set-face-attribute 'default nil :font "Monaco-10")
(if (window-system)
    (set-frame-size (selected-frame) 100 115))
;(setq vimpulse-want-vi-keys-in-apropos nil)
;(setq vimpulse-want-vi-keys-in-buffmenu nil)
;(setq vimpulse-want-vi-keys-in-dired nil)
