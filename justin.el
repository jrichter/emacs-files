;; (require 'color-theme-ir-black)
;; (color-theme-ir-black)

;; (require 'justin-color-theme)
;; (justin-color-theme)

(require 'inspiration)
(inspiration)

(set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :font "Monaco-12")

;; Spell Checker - on Ubuntu 10.10 remove *.el and *.elc from
;; /usr/share/emacs23/site-lisp/dictionaries-common to make
;; flyspell-mode work
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t)
(autoload 'tex-mode-flyspell-verify "flyspell" "" t) 

;; Textmate mode https://github.com/defunkt/textmate.el.git
;; (add-to-list 'load-path "~/.emacs.d/textmate.el")
;; (require 'textmate)
;; (textmate-mode)
;; Redefine some textmate-mode keys



;; Rinari Not a Rails IDE - well sortof https://github.com/eschulte/rinari.git
;; (add-to-list 'load-path "~/.emacs.d/rinari")
;; (require 'rinari)

;; emacs rails git://gitorious.org/emacs-rails/emacs-rails.git
(add-to-list 'load-path "~/.emacs.d/emacs-rails")
(require 'rails)

;; rhtml mode https://github.com/eschulte/rhtml.git
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)

;; YASnippet - code completion http://code.google.com/p/yasnippet/
;; Extra snippets https://github.com/rejeep/yasnippets.git
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) 
     (yas/initialize)
     (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
             
;; setq-default sets values only in buffers that do not have their own
;; local values for the variable 
(setq-default tab-width 2)
(setq-default save-abbrevs nil)
(setq default-truncate-lines t)
(setq make-backup-files nil)

;; My Functions
(defun delete-enclosed-text ()
  "Delete texts between any pair of delimiters."
  (interactive)
  (save-excursion
    (let (p1 p2)
      (skip-chars-backward "^(<[\"\'") (setq p1 (point))
      (skip-chars-forward "^)>]\"\'") (setq p2 (point))
      (delete-region p1 p2))))

(global-set-key (kbd "C-x '") 'delete-enclosed-text)

(transient-mark-mode 1)

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key (kbd "C-x y") 'select-current-line)

(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))

(global-set-key (kbd "C-x C-y") 'quick-copy-line)

(defun insert-line-above ()
  (interactive)
  (move-beginning-of-line 1)
  (insert "\n")
  (previous-line 1))

(global-set-key (kbd "C-M-<return>") 'insert-line-above)

(defun insert-line-below ()
  (interactive)
  (move-end-of-line 1)
  (insert "\n"))

(global-set-key (kbd "M-<return>") 'insert-line-below)

;; Keybinding for commenting region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(global-set-key [f4] 'speedbar-get-focus)
(global-set-key [f6] 'buffer-menu)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)

(global-set-key (kbd "C-S-k") 'delete-region)

;; (if (window-system)
;;     (progn
;;       (set-frame-size (selected-frame) 130 150)
;;       ))

(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

 (setq initial-frame-alist
       '((top . 2) (left . 22) (width . 129) (height . 90)))
 (arrange-frame 130 90 2 22)
 (speedbar t)

