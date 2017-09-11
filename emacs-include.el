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
