(in-package #:nyxt-user)

(defvar *my-keymap* (nkeymaps/core:make-keymap "my-map"))

(define-key *my-keymap*
  "C-x w"       'show-weather
  "C-x t"       'current-time
  "C-t"         'toggle-toolbars
  "C-s C-s"     'nyxt/mode/search-buffer:search-buffers
  "C-x C-x"     'delete-current-buffer
  "C-0"         'delete-current-buffer
  "C-;"         'switch-buffer-last
  "C-e"         'edit-with-external-editor
  "C-x e"       'edit-user-file-with-external-editor
  "C-x z"       'nyxt:reopen-last-buffer
  "C-x C-z"     'nyxt:reopen-buffer)

(define-mode my-mode
    nil
  "Custom keybindings."
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map
     nyxt/keyscheme:cua       *my-keymap*
     nyxt/keyscheme:emacs     *my-keymap*
     nyxt/keyscheme:vi-normal *my-keymap*))))

(define-configuration web-buffer
  "Enable my-mode by default."
  ((default-modes (pushnew 'my-mode %slot-value%))))
