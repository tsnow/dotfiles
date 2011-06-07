;;TURN OFF THE DAMN BUNDT SOUND
(setq visible-bell t)
(add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(setq mac-command-modifier 'meta) ;;Set the command key back to meta for christsakes
(setq-default indent-tabs-mode nil)
;;(autoload 'js2-mode "~/.emacs.d/js2.elc" nil t)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))


(add-to-list 'auto-mode-alist '("\\..*ss" . sass-mode))
(add-to-list 'load-path "/Users/tsnow/.emacs.d/tuareg-2.0.1")
  (add-to-list 'auto-mode-alist '("\\.ml\\w?" . tuareg-mode))
  (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
  (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;;    (autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
;;      "Configuration of imenu for tuareg" t) 
;;    (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
;;    (setq auto-mode-alist 
;;        (append '(("\\.ml[ily]?$" . tuareg-mode)
;;	          ("\\.topml$" . tuareg-mode))
;;                  auto-mode-alist))
;;(load "~/.emacs.d/nxml-mode/rng-auto.el")
;;(load "~/.emacs.d/nxhtml/autostart.el")
(defalias 'qrr 'query-replace-regexp)
;; M-x list-matching-lines :for lines matching regexp
;; M-p :fill-paragraph intelligent line wrapping for comments and such
;; C-x C-o :delete-blank-lines
;; M-x delete-trailing-whitespace
;; M-x align-regexp
;;(load "~/.emacs.d/maxframe.el")
;;(require 'maxframe)
(defun maximize-frame () 
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))
(add-hook 'window-setup-hook 'maximize-frame t)
;;(add-to-list 'auto-mode-alist '("\\.html.erb" . nxhtml-mode))


(global-set-key (kbd "M-`") 'other-frame)

;;http://random-state.net/log/3512630740.html
(setq font-lock-verbose nil)

;;Tabs = 2 spaces for Amiel
(setq js2-mode-hook 
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq ruby-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq ruby-indent-level 2)
                  (setq c-indent-level 2)
                  (setq c-basic-offset 2)
                  (setq tab-width 2))))

(setq-default show-paren-mode t)
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ns-alternate-modifier (quote none)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;;;auctex

(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)





;; From http://www.viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu/
(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(set-frame-font "Menlo-11")
;;(load-theme 'tango)