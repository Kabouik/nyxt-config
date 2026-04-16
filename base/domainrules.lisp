(in-package #:nyxt-user)

;; Mode that redirects reddit.com and www.reddit.com to old.reddit.com.
;; Toggle manually with M-x old-reddit-mode.
;;
;; NOTE: request-resource-hook is only fired by the GTK/WebKit renderer and
;; never on Electron. We use on-signal-load-started (which Electron does call)
;; to intercept navigations while the mode is active.
;;
;; Auto-enable/disable is handled by an :after method on on-signal-load-finished
;; on web-buffer, so the mode (and its glyph) only appears when on reddit.
(define-mode old-reddit-mode ()
  "Redirect reddit.com to old.reddit.com."
  ())

(defmethod enable ((mode old-reddit-mode) &key)
  "Redirect immediately if the buffer is already on reddit."
  (let ((url (url (buffer mode))))
    (when (member (quri:uri-host url) '("reddit.com" "www.reddit.com")
                  :test #'string=)
      (ffi-buffer-load (buffer mode)
                       (quri:copy-uri url :host "old.reddit.com")))))

(defmethod disable ((mode old-reddit-mode) &key)
  "Redirect back to reddit when disabling on old.reddit.com."
  (let ((url (url (buffer mode))))
    (when (string= (quri:uri-host url) "old.reddit.com")
      (ffi-buffer-load (buffer mode)
                       (quri:copy-uri url :host "www.reddit.com")))))

(defmethod nyxt:on-signal-load-started ((mode old-reddit-mode) url)
  "Intercept in-session navigations to reddit and redirect them."
  (when (member (quri:uri-host url) '("reddit.com" "www.reddit.com")
                :test #'string=)
    (ffi-buffer-load (buffer mode)
                     (quri:copy-uri url :host "old.reddit.com"))))

;; Auto-enable old-reddit-mode on reddit pages and disable it elsewhere.
;; enable-modes*/disable-modes* are the programmatic (non-prompting) variants.
;; find-submode returns the mode instance if active, nil if not.
(defmethod nyxt:on-signal-load-finished :after ((buffer nyxt:web-buffer) url title)
  (declare (ignore title))
  (if (member (quri:uri-host url) '("reddit.com" "www.reddit.com" "old.reddit.com")
              :test #'string=)
      (unless (find-submode 'old-reddit-mode buffer)
        (enable-modes* '(old-reddit-mode) buffer))
      (when (find-submode 'old-reddit-mode buffer)
        (disable-modes* '(old-reddit-mode) buffer))))
