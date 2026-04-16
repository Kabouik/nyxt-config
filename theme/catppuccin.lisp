(in-package #:nyxt-user)

;;; Catppuccin themes for Nyxt 4 — all four flavours
;;; https://github.com/catppuccin/catppuccin
;;;
;;; Switch at runtime with M-x catppuccin-load-flavour
;;; Default flavour: Mocha

;; ---------------------------------------------------------------------------
;; Latte (light)
;;   crust    #dce0e8   mantle   #e6e9ef   base     #eff1f5
;;   surface0 #ccd0da   surface1 #bcc0cc   surface2 #acb0be
;;   overlay0 #9ca0b0   overlay1 #8c8fa1   overlay2 #7c7f93
;;   subtext0 #6c6f85   subtext1 #5c5f77   text     #4c4f69
;;   lavender #7287fd   blue     #1e66f5   sapphire #209fb5
;;   sky      #04a5e5   teal     #179299   green    #40a02b
;;   yellow   #df8e1d   peach    #fe640b   maroon   #e64553
;;   red      #d20f39   mauve    #8839ef   pink     #ea76cb
;;   flamingo #dd7878   rosewater #dc8a78
;; ---------------------------------------------------------------------------
(defvar *catppuccin-latte*
  (make-instance 'theme:theme
    :background-color-   "#e6e9ef"  ; mantle  — subtle inset
    :background-color    "#eff1f5"  ; base    — main background
    :background-color+   "#ccd0da"  ; surface0 — panels / cards
    :on-background-color "#4c4f69"  ; text

    :primary-color-   "#7287fd"     ; lavender — lighter
    :primary-color    "#8839ef"     ; mauve
    :primary-color+   "#ea76cb"     ; pink     — punchier
    :on-primary-color "#eff1f5"     ; base

    :secondary-color-   "#ccd0da"   ; surface0
    :secondary-color    "#bcc0cc"   ; surface1
    :secondary-color+   "#acb0be"   ; surface2
    :on-secondary-color "#4c4f69"   ; text

    :action-color-   "#7287fd"      ; lavender
    :action-color    "#1e66f5"      ; blue
    :action-color+   "#209fb5"      ; sapphire
    :on-action-color "#eff1f5"      ; base

    :highlight-color-   "#dc8a78"   ; rosewater
    :highlight-color    "#df8e1d"   ; yellow
    :highlight-color+   "#fe640b"   ; peach
    :on-highlight-color "#eff1f5"   ; base

    :success-color-   "#04a5e5"     ; sky
    :success-color    "#40a02b"     ; green
    :success-color+   "#179299"     ; teal
    :on-success-color "#eff1f5"     ; base

    :warning-color-   "#fe640b"     ; peach
    :warning-color    "#d20f39"     ; red
    :warning-color+   "#e64553"     ; maroon
    :on-warning-color "#eff1f5"     ; base

    :font-family "Public Sans"
    :monospace-font-family "DejaVu Sans Mono"))

;; ---------------------------------------------------------------------------
;; Frappé
;;   crust    #232634   mantle   #292c3c   base     #303446
;;   surface0 #414559   surface1 #51576d   surface2 #626880
;;   overlay0 #737994   overlay1 #838ba7   overlay2 #949cbb
;;   subtext0 #a5adce   subtext1 #b5bfe2   text     #c6d0f5
;;   lavender #babbf1   blue     #8caaee   sapphire #85c1dc
;;   sky      #99d1db   teal     #81c8be   green    #a6d189
;;   yellow   #e5c890   peach    #ef9f76   maroon   #ea999c
;;   red      #e78284   mauve    #ca9ee6   pink     #f4b8e4
;;   flamingo #eebebe   rosewater #f2d5cf
;; ---------------------------------------------------------------------------
(defvar *catppuccin-frappe*
  (make-instance 'theme:theme
    :background-color-   "#232634"  ; crust
    :background-color    "#303446"  ; base
    :background-color+   "#414559"  ; surface0
    :on-background-color "#c6d0f5"  ; text

    :primary-color-   "#949cbb"     ; overlay2
    :primary-color    "#ca9ee6"     ; mauve
    :primary-color+   "#f4b8e4"     ; pink
    :on-primary-color "#303446"     ; base

    :secondary-color-   "#414559"   ; surface0
    :secondary-color    "#51576d"   ; surface1
    :secondary-color+   "#626880"   ; surface2
    :on-secondary-color "#c6d0f5"   ; text

    :action-color-   "#babbf1"      ; lavender
    :action-color    "#8caaee"      ; blue
    :action-color+   "#85c1dc"      ; sapphire
    :on-action-color "#303446"      ; base

    :highlight-color-   "#f2d5cf"   ; rosewater
    :highlight-color    "#e5c890"   ; yellow
    :highlight-color+   "#ef9f76"   ; peach
    :on-highlight-color "#303446"   ; base

    :success-color-   "#99d1db"     ; sky
    :success-color    "#a6d189"     ; green
    :success-color+   "#81c8be"     ; teal
    :on-success-color "#303446"     ; base

    :warning-color-   "#ef9f76"     ; peach
    :warning-color    "#e78284"     ; red
    :warning-color+   "#ea999c"     ; maroon
    :on-warning-color "#303446"     ; base

    :font-family "Public Sans"
    :monospace-font-family "DejaVu Sans Mono"))

;; ---------------------------------------------------------------------------
;; Macchiato
;;   crust    #181926   mantle   #1e2030   base     #24273a
;;   surface0 #363a4f   surface1 #494d64   surface2 #5b6078
;;   overlay0 #6e738d   overlay1 #8087a2   overlay2 #939ab7
;;   subtext0 #a5adcb   subtext1 #b8c0e0   text     #cad3f5
;;   lavender #b7bdf8   blue     #8aadf4   sapphire #7dc4e4
;;   sky      #91d7e3   teal     #8bd5ca   green    #a6da95
;;   yellow   #eed49f   peach    #f5a97f   maroon   #ee99a0
;;   red      #ed8796   mauve    #c6a0f6   pink     #f5bde6
;;   flamingo #f0c6c6   rosewater #f4dbd6
;; ---------------------------------------------------------------------------
(defvar *catppuccin-macchiato*
  (make-instance 'theme:theme
    :background-color-   "#181926"  ; crust
    :background-color    "#24273a"  ; base
    :background-color+   "#363a4f"  ; surface0
    :on-background-color "#cad3f5"  ; text

    :primary-color-   "#939ab7"     ; overlay2
    :primary-color    "#c6a0f6"     ; mauve
    :primary-color+   "#f5bde6"     ; pink
    :on-primary-color "#24273a"     ; base

    :secondary-color-   "#363a4f"   ; surface0
    :secondary-color    "#494d64"   ; surface1
    :secondary-color+   "#5b6078"   ; surface2
    :on-secondary-color "#cad3f5"   ; text

    :action-color-   "#b7bdf8"      ; lavender
    :action-color    "#8aadf4"      ; blue
    :action-color+   "#7dc4e4"      ; sapphire
    :on-action-color "#24273a"      ; base

    :highlight-color-   "#f4dbd6"   ; rosewater
    :highlight-color    "#eed49f"   ; yellow
    :highlight-color+   "#f5a97f"   ; peach
    :on-highlight-color "#24273a"   ; base

    :success-color-   "#91d7e3"     ; sky
    :success-color    "#a6da95"     ; green
    :success-color+   "#8bd5ca"     ; teal
    :on-success-color "#24273a"     ; base

    :warning-color-   "#f5a97f"     ; peach
    :warning-color    "#ed8796"     ; red
    :warning-color+   "#ee99a0"     ; maroon
    :on-warning-color "#24273a"     ; base

    :font-family "Public Sans"
    :monospace-font-family "DejaVu Sans Mono"))

;; ---------------------------------------------------------------------------
;; Mocha
;;   crust    #11111b   mantle   #181825   base     #1e1e2e
;;   surface0 #313244   surface1 #45475a   surface2 #585b70
;;   overlay0 #6c7086   overlay1 #7f849c   overlay2 #9399b2
;;   subtext0 #a6adc8   subtext1 #bac2de   text     #cdd6f4
;;   lavender #b4befe   blue     #89b4fa   sapphire #74c7ec
;;   sky      #89dceb   teal     #94e2d5   green    #a6e3a1
;;   yellow   #f9e2af   peach    #fab387   maroon   #eba0ac
;;   red      #f38ba8   mauve    #cba6f7   pink     #f5c2e7
;;   flamingo #f2cdcd   rosewater #f5e0dc
;; ---------------------------------------------------------------------------
(defvar *catppuccin-mocha*
  (make-instance 'theme:theme
    :background-color-   "#11111b"  ; crust
    :background-color    "#1e1e2e"  ; base
    :background-color+   "#313244"  ; surface0
    :on-background-color "#cdd6f4"  ; text

    :primary-color-   "#9399b2"     ; overlay2
    :primary-color    "#cba6f7"     ; mauve
    :primary-color+   "#f5c2e7"     ; pink
    :on-primary-color "#1e1e2e"     ; base

    :secondary-color-   "#313244"   ; surface0
    :secondary-color    "#45475a"   ; surface1
    :secondary-color+   "#585b70"   ; surface2
    :on-secondary-color "#cdd6f4"   ; text

    :action-color-   "#b4befe"      ; lavender
    :action-color    "#89b4fa"      ; blue
    :action-color+   "#74c7ec"      ; sapphire
    :on-action-color "#1e1e2e"      ; base

    :highlight-color-   "#f5e0dc"   ; rosewater
    :highlight-color    "#f9e2af"   ; yellow
    :highlight-color+   "#fab387"   ; peach
    :on-highlight-color "#1e1e2e"   ; base

    :success-color-   "#89dceb"     ; sky
    :success-color    "#a6e3a1"     ; green
    :success-color+   "#94e2d5"     ; teal
    :on-success-color "#1e1e2e"     ; base

    :warning-color-   "#fab387"     ; peach
    :warning-color    "#f38ba8"     ; red
    :warning-color+   "#eba0ac"     ; maroon
    :on-warning-color "#1e1e2e"     ; base

    :font-family "Public Sans"
    :monospace-font-family "DejaVu Sans Mono"))

;; ---------------------------------------------------------------------------
;; Runtime flavour switcher
;; Active flavour is set solely by theme/catppuccin-flavour.lisp (loaded after
;; this file by config.lisp), so there is no define-configuration here.
;; ---------------------------------------------------------------------------
(defvar *catppuccin-flavours*
  '(("Latte"      . *catppuccin-latte*)
    ("Frappé"     . *catppuccin-frappe*)
    ("Macchiato"  . *catppuccin-macchiato*)
    ("Mocha"      . *catppuccin-mocha*)))

(defvar *catppuccin-flavour-file*
  (merge-pathnames #p"nyxt/theme/catppuccin-flavour.lisp"
                   (uiop:xdg-config-home)))

(define-command-global catppuccin-load-flavour ()
  "Interactively switch the Catppuccin flavour.
Persists the choice to theme/catppuccin-flavour.lisp and reloads internal
pages and toolbars so the change is visible immediately."
  (let* ((name (first (prompt
                       :prompt "Catppuccin flavour"
                       :sources (make-instance 'prompter:source
                                  :name "Flavours"
                                  :constructor (mapcar #'car *catppuccin-flavours*)))))
         (var  (cdr (assoc name *catppuccin-flavours* :test #'string=))))
    (when var
      ;; 1. Apply theme
      (setf (theme *browser*) (symbol-value var))

      ;; 2. Persist immediately — before any operation that might fail
      (with-open-file (f *catppuccin-flavour-file*
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
        (format f ";; Auto-generated by catppuccin-load-flavour — do not edit manually.~%")
        (format f "(define-configuration browser~%  ((theme ~a)))~%" var))

      ;; 3. Reload nyxt: scheme pages (new-buffer page, bookmarks, etc.)
      (dolist (b (buffer-list))
        (ignore-errors
          (when (string= "nyxt" (quri:uri-scheme (url b)))
            (ffi-buffer-reload b))))

      ;; 4. Repaint each window's status bar.
      ;; make-instance gives the correct style (initform evaluated against the
      ;; new theme) but customize-instance :after registers closures that
      ;; capture window=NIL for the orphan.  Those closures sit in the inner
      ;; weak-keyed tables of *setf-handlers* until the orphan is GC'd; if
      ;; M-x fires before GC they call (active-buffer NIL) and break.
      ;; Fix: remove the orphan's entries from every inner table immediately
      ;; after extracting the style, before anything can trigger them.
      (let ((orphan (make-instance 'nyxt::status-buffer)))
        (unwind-protect
            (let ((style (slot-value orphan 'nyxt::style)))
              (dolist (w (window-list))
                (ignore-errors
                  (let ((sb (status-buffer w)))
                    (setf (slot-value sb 'nyxt::style) style)
                    (nyxt::print-status sb)))))
          ;; Always clean up — even if something above signals.
          (maphash (lambda (key inner-table)
                     (declare (ignore key))
                     (remhash orphan inner-table))
                   nyxt::*setf-handlers*)))

      ;; 5. Repaint each window's message buffer.
      ;; message-buffer has no customize-instance :after setf handlers so no
      ;; *setf-handlers* cleanup is needed.  print-message "" re-renders the
      ;; buffer with the new style and an empty body (clears any stale message).
      (let ((mb-style (ignore-errors
                        (slot-value (make-instance 'nyxt::message-buffer)
                                    'nyxt::style))))
        (when mb-style
          (dolist (w (window-list))
            (ignore-errors
              (let ((mb (message-buffer w)))
                (setf (slot-value mb 'nyxt::style) mb-style)
                (nyxt::print-message "" w))))))

      (echo "Catppuccin ~a" name))))

;; ---------------------------------------------------------------------------
;; Prompt buffer: fix selected-row text colour
;;
;; The default CSS has `.source-content td { color: on-background-color }`.
;; That rule is more specific than the `color` set on `tr#selection`, so the
;; <td> children of the selected row always inherit the background text colour
;; (dark on Latte, light on dark themes) rather than the intended
;; `on-action-color`.  Adding `#selection td` restores the correct contrast:
;; light text on the bright-blue selected row for Latte, dark text for the
;; dark themes (where the action-color is a pastel shade).
;; ---------------------------------------------------------------------------
(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (theme:themed-css (theme *browser*)
             `("#selection td"
               :color ,theme:on-action-color))))))
