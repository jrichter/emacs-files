(require 'color-theme-ir-black)
(color-theme-ir-black)
(set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :font "Monaco-10")
(if (window-system)
    (set-frame-size (selected-frame) 100 115))

;; Spell Checker - on Ubuntu 10.10 remove *.el and *.elc from
;; /usr/share/emacs23/site-lisp/dictionaries-common to make
;; flyspell-mode work
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t) (autoload 'tex-mode-flyspell-verify "flyspell" "" t) 

;; emacs rails git://gitorious.org/emacs-rails/emacs-rails.git
(add-to-list 'load-path "~/.emacs.d/emacs-rails")
(require 'rails)
;; rhtml mode https://github.com/eschulte/rhtml.git
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)

;; setq-default sets values only in buffers that do not have their own
;; local values for the variable 
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default save-abbrevs nil)
