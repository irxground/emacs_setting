(add-to-list 'load-path (expand-file-name "~/.emacs.d")) ; TODO find by self path

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; full screen
(if (eq system-type 'darwin)
  (progn
    (defun maximize-frame-mac ()
      (interactive)
      (set-frame-position (selected-frame) 0 0)
      (set-frame-size (selected-frame) 1000 1000)
      ;(split-window-horizontally)
    )
    (run-with-idle-timer 0.5 nil 'maximize-frame-mac)))

(pc-selection-mode 1)    ; select by shift key
(cua-mode t)             ; use Common-User-Access mode
(setq inhibit-startup-screen t)

(mouse-wheel-mode)
(global-set-key [wheel-up]
                '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [wheel-down]
                '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [double-wheel-up]
                '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [double-wheel-down]
                '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [triple-wheel-up]
                '(lambda () "" (interactive) (scroll-down 2)))
(global-set-key [triple-wheel-down]
                '(lambda () "" (interactive) (scroll-up 2)))

