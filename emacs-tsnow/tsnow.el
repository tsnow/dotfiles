(add-to-list 'load-path (concat user-specific-dir "/../el-get/el-get/"))
;;;; BEGIN el-get ;;http://www.emacswiki.org/emacs/el-get
(require 'el-get)
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))



(setq
 el-get-sources
 '(el-get				; el-get is self-hosting
   escreen            			; screen for emacs, C-\ C-h
   php-mode-improved			; if you're into php...
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays
   zencoding-mode			; http://www.emacswiki.org/emacs/ZenCoding

   (:name buffer-move			; have to add your own keys
	  :after (lambda ()
		   (global-set-key (kbd "<C-S-up>")     'buf-move-up)
		   (global-set-key (kbd "<C-S-down>")   'buf-move-down)
		   (global-set-key (kbd "<C-S-left>")   'buf-move-left)
		   (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

   (:name smex				; a better (ido like) M-x
	  :after (lambda ()
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit				; git meet emacs, and a binding
	  :after (lambda ()
		   (global-set-key (kbd "C-x C-z") 'magit-status)))

   (:name goto-last-change		; move pointer back to last change
	  :after (lambda ()
		   ;; when using AZERTY keyboard, consider C-x C-_
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

(unless (string-match "apple-darwin" system-configuration)
  (loop for p in '(color-theme		; nice looking emacs
		   color-theme-tango	; check out color-theme-solarized
		   )
	do (add-to-list 'el-get-sources p)))

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
(when (el-get-executable-find "cvs")
  (add-to-list 'el-get-sources 'emacs-goodies-el)) ; the debian addons for emacs

(when (el-get-executable-find "svn.bak")
  (loop for p in '(dsvn    		; M-x svn-status
		   yasnippet		; powerful snippet mode
		   )
	do (add-to-list 'el-get-sources p)))



;; install new packages and init already installed packages
(el-get) ;;;(el-get 'sync)

;;;; END el-get


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
(and (window-system)
     (add-hook 'window-setup-hook 'ns-toggle-fullscreen))

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
;;(require 'color-theme-tangotango)
;;(color-theme-tangotango)
(add-to-list 'load-path "~/.emacs.d/Tomorrow-Theme/GNU Emacs")
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night-bright)


;; http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
;(add-hook 'before-save-hook 'whitespace-cleanup)

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
(when (executable-find "erl")
  (progn
   (add-to-list 'load-path "/usr/local/Cellar/erlang/R14B04/lib/erlang/lib/tools-2.6.6.5/emacs")
   (setq erlang-root-dir "/usr/local/Cellar/erlang/R14B04/lib/erlang")
   (add-to-list 'exec-path "/usr/local/Cellar/erlang/R14B04/lib/erlang/bin")
   ;;; (require 'erlang-start)


   ;;; from http://alexott.net/en/writings/emacs-devenv/EmacsErlang.html
   (defun my-erlang-mode-hook ()
        ;; when starting an Erlang shell in Emacs, default in the node name
        (setq inferior-erlang-machine-options '("-sname" "emacs"))
        ;; add Erlang functions to an imenu menu
        (imenu-add-to-menubar "imenu")
        ;; customize keys
        (local-set-key [return] 'newline-and-indent)
        )
   ;; Some Erlang customizations
   (add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

   ;; (require 'flymake) ;; was causing all kinds of xml issues
   ;; (defun flymake-erlang-init ()
   ;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
   ;;                      'flymake-create-temp-inplace))
   ;;          (local-file (file-relative-name
   ;;                       temp-file
   ;;                       (file-name-directory buffer-file-name))))
   ;;     (list "~/my-dotfiles/erlang/eflymake" (list local-file))))
   ;; (add-to-list 'flymake-allowed-file-name-masks
   ;;              '("\\.erl\\'" flymake-erlang-init))
   ;; (add-hook 'find-file-hook 'flymake-find-file-hook)
   ;; (defun my-erlang-mode-hook ()
   ;;   (flymake-mode 1)
   ;;   (add-hook 'erlang-mode-hook 'my-erlang-mode-hook))
)

  ;; def-advice before ask-user-about-supersession-threat
  ;; to check whether the file is different than the one on disk, and if not,
  ;; then save without asking.
(defun select-next-window ()
  "Switch to the next window"
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))

(global-set-key (kbd "M-<right>") 'select-next-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)

(setenv "PAGER" "/bin/cat"))
(require 'server)
(or (server-running-p)
    (server-start))
