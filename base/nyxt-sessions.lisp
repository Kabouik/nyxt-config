;; This is free and unencumbered software released into the public domain.
;;
;; Anyone is free to copy, modify, publish, use, compile, sell, or
;; distribute this software, either in source code form or as a compiled
;; binary, for any purpose, commercial or non-commercial, and by any
;; means.
;;
;; In jurisdictions that recognize copyright laws, the author or authors
;; of this software dedicate any and all copyright interest in the
;; software to the public domain. We make this dedication for the benefit
;; of the public at large and to the detriment of our heirs and
;; successors. We intend this dedication to be an overt act of
;; relinquishment in perpetuity of all present and future rights to this
;; software under copyright law.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
;; OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
;; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;; OTHER DEALINGS IN THE SOFTWARE.
;;
;; For more information, please refer to <https://unlicense.org/>

;; This file implements a basic session save-and-restore system for Nyxt.
;; For this code, a "session" just refers to an ordered list of URLs to open.

;; This code was written by Arcensyl <dev@arcensyl.me>.
;; Be aware that its only a prototype, so things may break unexpectedly.

(define-class session-file (files:data-file nyxt-lisp-file)
    ((files:base-path #p"session")
     (files:name "session"))
  (:documentation "File used to save the current session."))

(defvar *session-file* (make-instance 'session-file)
  "File used to save the current session.")

(defmethod files:serialize ((profile nyxt-profile) (file session-file) stream &key)
  (write-string "(" stream)
  (loop for url in (files:content file)
        do (write-string +newline+ stream)
        do (format stream "~s" url))
  (format stream "~%)~%"))

(defmethod files:deserialize ((profile nyxt-profile) (path session-file) raw-content &key)
  (safe-read raw-content))

(defun change-buffer-id (buffer id &key clobber)
  "Update BUFFER to be known by ID.
If ID is already used, this function will error.
Though if CLOBBER is non-nil, the conflicting buffer will be deleted instead."
  (alexandria:when-let ((conflicting-buffer (gethash id (buffers *browser*))))
    (if clobber
        (ffi-buffer-delete conflicting-buffer)
        (error (format nil "Buffer ID ~d already used" id))))
  
  (let ((old-id (id buffer)))
    (unless (= id old-id)
      (setf (id buffer) id)

      (setf (gethash id (buffers *browser*)) buffer)
      (remhash old-id (buffers *browser*)))))

(define-command-global save-session ()
  "Save current session to disk.
Specifically, this writes a list of all open URLs to 'session-file'."
  (files:with-file-content (session *session-file*)
    (setf session
          (mapcar (lambda (buf)
                    (render-url (url buf)))
                  (reverse (buffer-list)))))
  
  (echo "Saved session of ~d buffer(s)" (hash-table-count (buffers *browser*))))

;; FIXME: Session restoration doesn't handle when more than one window is open.
;; When all old buffers are deleted, Nyxt opens new buffers for each non-current window.
;; Fixing this probably isn't too hard, but would require rewriting most of 'restore-session'.

(define-command-global restore-session ()
  "Restore the last saved session.
This deletes all currently open buffers, and then restores each one specified by 'session-file'."
  ;; We need a temporary buffer that isn't deleted, and has a known ID.
  (make-buffer-focus :url "about:blank")
  (change-buffer-id (current-buffer) 0)

  ;; Delete all normal buffers that are currently open.
  (loop for buffer in (cdr (reverse (buffer-list)))
        do (ffi-buffer-delete buffer))

  ;; Open new buffers for each URL in the saved session.
  (loop for url in (files:content *session-file*)
        do (make-buffer :url url))

  ;; Delete the temporary buffer, and try to switch to the first restored one.
  (let ((buffers (reverse (buffer-list))))
    (unless (= (length buffers) 1)
      (set-current-buffer (second buffers)))
    (ffi-buffer-delete (first buffers)))

  (echo "Restored session of ~d buffer(s)" (length (files:content *session-file*))))

;; FIXME: I can't find a way to automatically save when Nyxt exits.
;; I'm sure its possible, but nothing I've tried has worked.
;; I've tried using the browser's 'before-exit-hook' hook and the 'window-delete-hook'.
;; Neither seems to do anything; maybe an issue on my side?

(defun restore-session-on-start ()
  "Restore a session as Nyxt is starting.
Don't call this directly, add it to the browser's 'after-startup-hook' instead."
  (declare (ignore _))
  (restore-session))