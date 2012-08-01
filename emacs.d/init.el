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

(mouse-wheel-mode t)
(setq mouse-wheel-progressive-speed nil)
(progn
  (global-set-key [wheel-left]  '(lambda() "" (interactive) (scroll-left  1)))
  (global-set-key [wheel-right] '(lambda() "" (interactive) (scroll-right 1))))


(if nil (progn
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
) (interactive))

;; suppress trancate lines
(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
    (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)


;; split window
(global-set-key (kbd "s-d")   'split-window-horizontally)
(global-set-key (kbd "s-D") 'split-window-vertically)

;; window move
(global-set-key (kbd "<M-s-up>")    'windmove-up)
(global-set-key (kbd "<M-s-down>")  'windmove-down)
(global-set-key (kbd "<M-s-left>")  'windmove-left)
(global-set-key (kbd "<M-s-right>") 'windmove-right)

;; theme
(custom-set-faces
  '(default ((t (:background "black" :foreground "white"))))
  '(cursor (
            (((class color) (background dark))  (:background "#55FF55"))
            (((class color) (background light)) (:background "#999999"))
            (t ())
)))


;; for trailing whitespace
(setq-default tab-width 2 indent-tabs-mode nil)

;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray20"))) nil)
(defface my-face-u-1 '((t (:background "#700"))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)


;; indent when push key enter

(global-set-key (kbd "<RET>") 'reindent-then-newline-and-indent)

(require 'ruby-mode)
(define-key ruby-mode-map (kbd "<RET>") 'reindent-then-newline-and-indent)

