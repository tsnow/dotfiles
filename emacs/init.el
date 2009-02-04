(setq dot-dir (file-name-directory load-file-name))
(setq vendor-dir (concat dot-dir "/vendor"))
(setq lib-dir (concat dot-dir "/lib"))

(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path lib-dir)

(require 'my-bindings)
(require 'my-defuns)
(require 'my-ui)
(require 'my-integration)
(require 'my-loading-and-saving)
(require 'my-modes)
(require 'my-navigation)
