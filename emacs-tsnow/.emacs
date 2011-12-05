;;Moved some of this stuff into tsnow.el

;;TURN OFF THE DAMN BUNDT SOUND
(setq visible-bell t)
(add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))



;;(autoload 'js2-mode "~/.emacs.d/js2.elc" nil t)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Thorfile" . ruby-mode))
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
;;(add-to-list 'auto-mode-alist '("\\.html.erb" . nxhtml-mode))

(setq js2-mode-hook 
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
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


;;anything.el
(add-to-list 'load-path "/Users/tsnow/.emacs.d/anything-config")
(require 'anything-startup)

;;rcodetools
(add-to-list 'load-path "/Users/tsnow/.emacs.d")
(require 'rcodetools)

;;peepopen
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'peepopen)

;;ruby-test-mode
(add-to-list 'load-path "~/.emacs.d/ruby-test.el")
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
(add-to-list 'load-path "~/.emacs.d/magit-1.0.0/magit.el")
(require 'magit)


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


;;Stopping M-v and M-c from fucking up the buffer when trying to cut and paste
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)


