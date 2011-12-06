(setq-default indent-tabs-mode nil)

(setq whitespace-style '(tabs trailing lines)
      whitespace-line-column 80
      line-number-mode t
      column-number-mode t)

;;from http://xahlee.org/emacs/whitespace-mode.html
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne, ¶
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))


(global-whitespace-mode t)
