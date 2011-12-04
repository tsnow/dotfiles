;;TURN OFF THE DAMN BUNDT SOUND
(setq visible-bell t)
(add-to-list 'load-path "~/my/dotfiles/emacs-tsnow/.emacs.d/elisp/feature-mode")
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
(add-to-list 'load-path "/Users/tsnow/my/dotfiles/emacs-tsnow/.emacs.d/tuareg-2.0.1")
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
     (expand-file-name "~/my/dotfiles/emacs-tsnow/.emacs.d/elpa/package.el"))
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
;;(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)


;;anything.el
(add-to-list 'load-path "/Users/tsnow/emacs-tsnow/anything-config")
;;(require 'anything-startup)

;;rcodetools
(add-to-list 'load-path "/Users/tsnow/emacs-tsnow/.emacs.d/")
(require 'rcodetools)

;;peepopen
(add-to-list 'load-path "~/my/dotfiles/emacs-tsnow/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)
(add-to-list 'load-path "~/my/dotfiles/emacs-tsnow/.emacs.d/vendor/")
(require 'peepopen)

;;ruby-test-mode
(add-to-list 'load-path "~/my/dotfiles/emacs-tsnow/.emacs.d/ruby-test.el")
(require 'ruby-test)


;;https://github.com/febeling/emacsd/blob/master/init.el
(defun gem-open (name)
  "Open named the ruby gem directory. Specify the require name,
not the gem's name in cases where they differ."
  (interactive "MGem: ")
  (let ((path (elt (split-string (shell-command-to-string (format "gem which %s" name)) "\n") 1)))
    (if (> (length path) 0)
	(find-file-other-window path)
      (message "Gem not found"))))

(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (and line (goto-line line))))

(defadvice find-file (around goto-line compile activate)
  "Got to a line number in a file, if one is appended to the file
name (separated by a colon).

Example:
  ~/.emacs.d/init.el:19"
  (if (string-match "\\(.*\\):\\([0-9]+\\)$" filename)
      (let ((line (string-to-number (substring filename (match-beginning 2) (match-end 2))))
	    (filename (substring filename (match-beginning 1) (match-end 1))))
	ad-do-it
	(and line (goto-line line)))
    ad-do-it))

;;http://www.emacswiki.org/emacs/TrampMode
(require 'tramp)
(setq tramp-default-method "ssh")

;;
;;(add-to-list 'load-path "~/.emacs.d/magit-1.0.0/magit.el")
(require 'magit)

;;
(require 'org)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)

;;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)


;;Repeating a command you just carried out is a surprisingly useful thing to do, yet most people are completely unaware that bound to C-x z is Emacs’s repeat command.


;;http://www.quora.com/What-are-some-must-have-additions-to-your-emacs-file
(require 'ido)
(ido-mode t)

;; Highlight extra whitespace:
(setq show-trailing-whitespace t)

;; save session state when you quit emacs
(desktop-save-mode 1)

;; midnight mode purges buffers which haven't been displayed in 3 days
(require 'midnight)
(setq midnight-mode 't)

;; make buffer names unique even if the files have the same names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; allow switching between buffers by typing substring of buffer name
;; (there are other alternatives, but iswitchb comes with std emacs)
(iswitchb-mode 1)

(prefer-coding-system 'utf-8)
(transient-mark-mode t)
(setq initial-scratch-message "")
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)


;;Stopping M-v and M-c from fucking up the buffer when trying to cut and paste
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)

;; From http://www.viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu/
(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(delete-selection-mode t)
;; (scroll-bar-mode -1)
;; (tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
;; (set-fringe-style -1)
;; (tooltip-mode -1)
(set-frame-font "Menlo-11")
;;(load-theme 'tango)

