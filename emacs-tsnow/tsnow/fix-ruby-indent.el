;;; Makes args on the next line line up with the CALLER, not the first
;;;arg.
;;; from https://github.com/dgutov/dot-emacs/blob/master/progmodes.el
;;;and http://stackoverflow.com/questions/4412739/emacs-ruby-mode-indentation-behavior

(defadvice ruby-indent-line (after line-up-args activate)
  (let (indent prev-indent arg-indent)
    (save-excursion
      (back-to-indentation)
      (when (zerop (car (syntax-ppss)))
        (setq indent (current-column))
        (skip-chars-backward " \t\n")
        (when (eq ?, (char-before))
          (ruby-backward-sexp)
          (back-to-indentation)
          (setq prev-indent (current-column))
          (skip-syntax-forward "w_.")
          (skip-chars-forward " ")
          (setq arg-indent (current-column)))))
    (when prev-indent
      (let ((offset (- (current-column) indent)))
        (cond ((< indent prev-indent)
               (indent-line-to prev-indent))
              ((= indent prev-indent)
               (indent-line-to arg-indent)))
        (when (> offset 0) (forward-char offset))))))

(defadvice ruby-indent-line (after deep-indent-dwim activate)
  (let (c paren-column indent-column)
    (save-excursion
      (back-to-indentation)
      (save-excursion
        (let ((state (syntax-ppss)))
          (unless (zerop (car state))
            (goto-char (cadr state))
            (setq c (char-after))
            (setq paren-column (current-column))
            (when (memq c '(?{ ?\())
              (forward-char)
              (skip-syntax-forward " ")
              (unless (eolp)
                (setq indent-column (current-column)))))))
      (when (and indent-column
                 (eq (char-after) (matching-paren c)))
        (setq indent-column paren-column)))
    (when indent-column
      (let ((offset (- (current-column) (current-indentation))))
        (indent-line-to indent-column)
        (when (> offset 0) (forward-char offset))))))

(defun ruby-containing-block ()
  (let ((pos (point))
        (block nil))
    (save-match-data
      (save-excursion
        (catch 'break
          ;; If in the middle of or at end of do, go back until at start
          (while (and (not (looking-at "do"))
                      (string-equal (word-at-point) "do"))
            (backward-char 1))
          ;; Keep searching for the containing block (i.e. the block that begins
          ;; before our point, and ends after it)
          (while (not block)
            (if (looking-at "do\\|{")
                (let ((start (point)))
                  (ruby-forward-sexp)
                  (if (> (point) pos)
                      (setq block (cons start (point)))
                    (goto-char start))))
            (if (not (search-backward-regexp "do\\|{" (point-min) t))
                (throw 'break nil))))))
        block))

(defun ruby-toggle-block-type ()
  (interactive)
  (save-excursion
    (let ((block (ruby-containing-block)))
      (goto-char (car block))
      (save-match-data
        (let ((strings (if (looking-at "do")
                           (cons
                            (if (= 3 (count-lines (car block) (cdr block)))
                                "do\\( *|[^|]+|\\)? *\n *\\(.*?\\) *\n *end"
                              "do\\( *|[^|]+|\\)? *\\(\\(.*\n?\\)+\\) *end")
                            "{\\1 \\2 }")
                         (cons
                          "{\\( *|[^|]+|\\)? *\\(\\(.*\n?\\)+\\) *}"
                          (if (= 1 (count-lines (car block) (cdr block)))
                              "do\\1\n\\2\nend"
                            "do\\1\\2end")))))
          (when (re-search-forward (car strings) (cdr block) t)
            (replace-match (cdr strings) t)
            (delete-trailing-whitespace (match-beginning 0) (match-end 0))
            (indent-region (match-beginning 0) (match-end 0))))))))

(eval-after-load 'ruby-mode
  '(remf ruby-deep-indent-paren ?\())
