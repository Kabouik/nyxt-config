;; This file is NOT loaded. It contains code that worked in Nyxt 3 but is broken
;; in Nyxt 4 due to removed APIs. Kept here for reference or future rewriting.

(in-package #:nyxt-user)

;; REMOVED: data-profile, expand-data-path, and history-path no longer exist.
;; history-path is now history-file on the browser class.
;; A Nyxt 4 equivalent would need: (history-file *browser*)
(define-command-global quit-history ()
  "Quit nyxt and delete the history file."
  (uiop:delete-file-if-exists (expand-data-path (data-profile (current-buffer))
                                          (history-path (current-buffer))))
  (quit))

;; REMOVED: ffi-window-set-prompt-buffer-height and ffi-window-get-prompt-buffer-height
;; no longer exist. In Nyxt 4, use (ffi-height (current-prompt-buffer)) and
;; (setf (ffi-height (current-prompt-buffer)) new-height) instead.
(define-command-global incf-prompt-buffer-height (&key (delta 50) (window (current-window)))
  "Increase the WINDOW's prompt buffer height by DELTA."
  (ffi-window-set-prompt-buffer-height window (+ (ffi-window-get-prompt-buffer-height window) delta)))

(define-command-global decf-prompt-buffer-height (&key (delta 50) (window (current-window)))
  "Decrease the WINDOW's prompt buffer height by DELTA."
  (ffi-window-set-prompt-buffer-height window (- (ffi-window-get-prompt-buffer-height window) delta)))

;; REMOVED: nyxt/reduce-tracking-mode:reduce-tracking-mode no longer exists in Nyxt 4.
(define-configuration nyxt/reduce-tracking-mode:reduce-tracking-mode ((glyph "∅")))

;; REMOVED: nyxt/auto-mode:auto-mode no longer exists in Nyxt 4.
(define-configuration nyxt/auto-mode:auto-mode
  ((nyxt/auto-mode:prompt-on-mode-toggle t)
   (glyph "α")))
