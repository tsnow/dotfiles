(setq visible-bell t)
(put 'erase-buffer 'disabled nil)

(global-set-key (kbd "C-x f") 'find-file-at-point)
(global-set-key (kbd "C-x m") 'magit-status)
(global-set-key (kbd "M-s")   'fixup-whitespace)
(global-set-key (kbd "C-x C-v") 'grep-find)
(global-set-key (kbd "M-`") 'other-frame)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-v") 'rinari-rgrep)))

;;From old .emacs
(defun maximize-frame () 
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))
(add-hook 'window-setup-hook 'ns-toggle-fullscreen)

;;http://random-state.net/log/3512630740.html
(setq font-lock-verbose nil)

(setq-default show-paren-mode t)

;;Tabs = 2 spaces
; F it, I'm going global with these
;(setq ruby-mode-hook
;      (function (lambda ()
         (setq-default indent-tabs-mode nil)
         (setq-default ruby-indent-level 2)
         (setq-default c-indent-level 2)
         (setq-default c-basic-offset 2)
         (setq-default tab-width 2)
;)))
;;Thor
(add-to-list 'auto-mode-alist '("\\Thorfile\\'" . ruby-mode))



;; ORG
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)


;;CSS-mode/SCSS-mode
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;;SHELL
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)


;;Some defaults
(prefer-coding-system 'utf-8)
(transient-mark-mode t)
(setq initial-scratch-message "")
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)



(setq mac-command-modifier 'meta) ;;Set the command key back to meta for christsakes


;; From http://www.viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu/
(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(add-to-list 'load-path "~/.emacs.d/tsnow/el-get/el-get")
(require 'el-get)


(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(set-frame-font "Menlo-11")

;;(require 'color-theme-railscasts)
;;(color-theme-railscasts)
(require 'color-theme)
;;(require 'color-theme-sanityinc-solarized)
;;(color-theme-sanityinc-solarized 'light)
(require 'color-theme-tangotango)
;;(color-theme-tangotango)
(add-to-list 'load-path "~/.emacs.d/Tomorrow-Theme/GNU Emacs")
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night-bright)


;; http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
(add-hook 'before-save-hook 'whitespace-cleanup)

;;My .info files
(add-to-list 'Info-directory-list "~/my-dotfiles/emacs-tsnow/info")


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


             ;;/FROM OLD .emacs
             



(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(add-to-list 'load-path "/usr/local/Cellar/erlang/R14B04/lib/erlang/lib/tools-2.6.6.5/emacs")
(setq erlang-root-dir "/usr/local/Cellar/erlang/R14B04/lib/erlang")
(add-to-list 'exec-path "/usr/local/Cellar/erlang/R14B04/lib/erlang/bin")
(require 'erlang-start)


(setenv "PAGER" "/bin/cat")
(server-start)
