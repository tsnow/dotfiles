(put 'erase-buffer 'disabled nil)

(global-set-key (kbd "C-x f") 'find-file-at-point)
(global-set-key (kbd "C-x m") 'magit-status)
(global-set-key (kbd "M-s")   'fixup-whitespace)

(add-hook 'ruby-mode-hook 'ruby-electric-mode)

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
