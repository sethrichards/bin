;; Include file for .emacs for my own customizations. Clone this, then add
;;
;; (load "~/bin/emacs-include.el")
;;
;; to ~/.emacs

(setq c-default-style "linux"
      c-basic-offset 3)
(setq-default indent-tabs-mode nil)

;; Map filenames to modes
(add-to-list 'auto-mode-alist
             '("[Mm]ake*" . makefile-mode) ;; Makefiles
             )

;; GUI tweaks
(setq tool-bar-mode nil)

(setq custom-enabled-themes (quote (tango-dark)))

(setq ansi-color-faces-vector
 [default default default italic underline success warning error])

(setq column-number-mode t)
(setq size-indication-mode t)
