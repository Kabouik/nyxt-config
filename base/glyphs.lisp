(in-package #:nyxt-user)

;; Allow setting glyphs
(define-configuration status-buffer
  ((glyph-mode-presentation-p t)))

;; Core modes — packages always available, safe to reference directly.
(define-configuration nyxt/mode/emacs:emacs-mode ((glyph "λ")))
(define-configuration nyxt/mode/style:style-mode ((glyph "s")))
(define-configuration nyxt/mode/help:help-mode ((glyph "?")))

;;c Configure hint mode to use home-row alphabet and set glyph
(define-configuration nyxt/mode/hint:hint-mode
  ((nyxt/mode/hint:hints-alphabet "ASDFGHJKL")
   (glyph "ω")))

;; My keymapd mode.
(define-configuration nyxt-user:my-mode ((glyph "♥")))

;; Old reddit redirect mode.
(define-configuration nyxt-user:old-reddit-mode ((glyph "r")))

;; ;; Renderer-specific modes — packages live in the GTK subsystem and may not
;; ;; exist at config read time. Use find-package + read-from-string so the
;; ;; symbol is only resolved at eval time when the package is already loaded.
;; (when (find-package :nyxt/mode/force-https)
;;   (eval (read-from-string
;;     "(define-configuration nyxt/mode/force-https:force-https-mode ((glyph \"ϕ\")))")))

;; (when (find-package :nyxt/mode/blocker)
;;   (eval (read-from-string
;;     "(define-configuration nyxt/mode/blocker:blocker-mode ((glyph \"β\")))")))

;; (when (find-package :nyxt/mode/proxy)
;;   (eval (read-from-string
;;     "(define-configuration nyxt/mode/proxy:proxy-mode ((glyph \"π\")))")))

;; (when (find-package :nyxt/mode/certificate-exception)
;;   (eval (read-from-string
;;     "(define-configuration nyxt/mode/certificate-exception:certificate-exception-mode ((glyph \"ɛ\")))")))
