(custom-set-variables
 '(ansi-color-names-vector
   [("#383a62" "#383a62")
    ("#7aa5ff" "#383a62")
    ("#ae81ff" "#383a62")
    ("#a0a0c5" "#a0a0c5")
    ("#2de0a7" "#2de0a7")
    ("#8eaee0" "#8eaee0")
    ("#6dfedf" "#6dfedf")
    ("#ccccff" "#ccccff")])
 '(custom-enabled-themes (quote (atom-one-dark))))
(custom-set-faces)

(add-to-list 'default-frame-alist '(font . "Roboto Mono Regular 10"))

(setq frame-title-format "Emacs Desktop"
      make-backup-files nil
      auto-save-default nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)
(electric-pair-mode 1)
(delete-selection-mode 1)
(global-subword-mode 1)
(global-hl-line-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)