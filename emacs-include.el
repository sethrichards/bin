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

;; Auto revert mode always
(setq global-auto-revert-mode t)

;; GUI tweaks
(setq tool-bar-mode nil)

(setq custom-enabled-themes (quote (tango-dark)))

(setq ansi-color-faces-vector
 [default default default italic underline success warning error])

(setq column-number-mode t)
(setq size-indication-mode t)

(unless window-system
  ;; Terminal Mouse support
  (require 'mouse)
  (xterm-mouse-mode t)
  ;(require 'xclip-mode)
  ;(xclip-mode)
  ;(defun track-mouse(e))
                                        ;(setq mouse-sel-mode t)

  ;; Line Num Mode
  (setq linum-format "%3d\u2502")
  
  ;(eval-after-load 'linum
    (set-face-attribute 'fringe nil :background "#000000" :foreground "#e5e5e5")
    ;(set-face-background 'fringe  nil "#0000ee")
   ; )
)
  
