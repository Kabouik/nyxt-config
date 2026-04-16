(in-package #:nyxt-user)

;; Commands to save and restore sessions
;; See (nyxt::load-lisp "~/.config/nyxt/base/commands.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/nyxt-sessions.lisp")

;; Shows current time
(define-command-global current-time ()
  "Show the current time and Unix epoch."
  (let ((now (local-time:now)))
    (echo "~a  (epoch: ~a)" now (local-time:timestamp-to-unix now))))

(define-command-global show-weather ()
  "Show the weather for current location in message area."
  (echo (str:trim (babel:octets-to-string
                   (dex:get "https://wttr.in/?format=3"
                            :headers '(("User-Agent" . "curl/7.88.1")))
                   :encoding :utf-8))))

;; Open current url in different programs
(define-command-global open-in-firefox-private ()
  "Open the current URL in Firefox private window"
  (uiop:run-program (list "firefox" "--private-window" (render-url (url (current-buffer))))))

(define-command-global open-in-firefox ()
  "Open the current URL in Firefox"
  (uiop:run-program (list "firefox" (render-url (url (current-buffer))))))

(define-command-global open-in-chromium ()
  "Open the current URL in Chromium"
  (uiop:run-program (list "chromium" (render-url (url (current-buffer))))))

(define-command-global open-in-w3m ()
  "Open the current URL in w3m"
  (uiop:run-program (list "footclient" "w3m" (render-url (url (current-buffer))))))

(define-command-global open-in-lynx ()
  "Open the current URL in lynx"
  (uiop:run-program (list "footclient" "lynx" (render-url (url (current-buffer))))))

;; ============================================================
;; External editor (emacsclient)
;;
;; WHY NOT the vanilla external-editor-program SLOT:
;;   The browser slot is typed (or string null). Its reader method splits the
;;   stored string on spaces to produce a list for uiop:run-program. This means
;;   any argument containing spaces (like -F '((name . "floating"))') is broken
;;   apart. We cannot store a list — that causes a type error at slot-set time.
;;
;; FIX 1 — override the reader method instead of the slot:
;;   Returning a list directly bypasses both the type constraint and the
;;   space-splitting. uiop:run-program with a list calls execv directly (no
;;   shell), so no quoting around the -F value is needed.
;;
;; WHY NOT ffi-buffer-paste to write back the edited content:
;;   After emacsclient opens, the Nyxt input field loses focus. On GTK/WebKit,
;;   ffi-buffer-paste checks can-execute? which returns false with no focused
;;   element and silently does nothing. On Electron it calls insertText, which
;;   also requires focus.
;;
;; FIX 2 — override edit-with-external-editor to write back via JS:
;;   We record the element's nyxt-identifier (a stable DOM attribute set by
;;   Nyxt on all elements at page load) before emacsclient steals focus, then
;;   query it back and set el.value directly — no focus required.
;;
;; WHY js-str INSTEAD OF ~s for embedding content in JS:
;;   CL's ~s (write representation) does NOT escape newlines to \n — it outputs
;;   a literal newline inside the string, which is a JS syntax error. js-str
;;   handles all characters that are special in JS string literals.
;; ============================================================

(defmethod nyxt:external-editor-program ((browser nyxt:browser))
  (list "emacsclient" "-c" "-F" "((name . \"floating\"))"))

(define-command-global edit-with-external-editor ()
  "Edit the current input field using emacsclient in a floating frame."
  (nyxt::run-thread "external editor"
    (let* ((buffer (current-buffer))
           (target-id
            (ffi-buffer-evaluate-javascript
             buffer
             "(function() {
               var el = document.activeElement;
               return el ? el.getAttribute('nyxt-identifier') : null;
             })()"))
           (original-content
            (ffi-buffer-evaluate-javascript
             buffer
             "(function() {
               var el = document.activeElement;
               return (el && (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA'))
                 ? el.value : null;
             })()")))
      (when original-content
        (labels ((js-str (s)
                   ;; Produce a quoted JS string literal with all special chars
                   ;; escaped. Must not use ~s: CL's write does not escape
                   ;; newlines to \n, producing invalid JS string literals.
                   (with-output-to-string (o)
                     (write-char #\" o)
                     (loop for c across s do
                       (case c
                         (#\\ (write-string "\\\\" o))
                         (#\" (write-string "\\\"" o))
                         (#\Newline (write-string "\\n" o))
                         (#\Return (write-string "\\r" o))
                         (#\Tab (write-string "\\t" o))
                         (t (write-char c o))))
                     (write-char #\" o))))
          (uiop:with-temporary-file
              (:directory (files:expand (make-instance 'nyxt::nyxt-temporary-directory))
               :pathname p :type "txt")
            (str:to-file p original-content :if-exists :supersede)
            (uiop:run-program (list "emacsclient" "-c" "-F" "((name . \"floating\"))"
                                    (uiop:native-namestring p)))
            (ffi-buffer-evaluate-javascript
             buffer
             (format nil
               "(function() {
                 var el = document.querySelector('[nyxt-identifier=~a]');
                 if (el) {
                   el.focus();
                   el.value = ~a;
                   el.dispatchEvent(new Event('input', {bubbles: true}));
                   el.dispatchEvent(new Event('change', {bubbles: true}));
                 }
               })()"
               (js-str target-id)
               (js-str (uiop:read-file-string p))))))))))
