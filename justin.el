(require 'color-theme-ir-black)
(color-theme-ir-black)
(set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :font "Monaco-12")
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

;; My Functions
(defun delete-enclosed-text ()
  "Delete texts between any pair of delimiters."
  (interactive)
  (save-excursion
    (let (p1 p2)
      (skip-chars-backward "^(<[\"\'") (setq p1 (point))
      (skip-chars-forward "^)>]\"\'") (setq p2 (point))
      (delete-region p1 p2))))

(transient-mark-mode 1)

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))


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

;; This is how to set a keybinding
;; (global-set-key (kbd "C-c q") 'command)
;; where 'command is the command you want to run


(global-set-key (kbd "C-x f") 'recentf-open-files)

(global-set-key (kbd "C-x '") 'delete-enclosed-text)

(global-set-key (kbd "C-x C-y") 'quick-copy-line)

(global-set-key (kbd "C-x y") 'select-current-line)


