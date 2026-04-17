;; Author: Aroze (Discord)/Arcensyl (https://gist.github.com/arcensyl)
;; HACK: This is a workaround to a problem in Nyxt's Guix package.
;; This issue prevents Nyxt's internal pages, like the manual, from loading.
;; It's caused by Nyxt trying to call the 'with-ps-gensyms' macro without importing it first.

;; This workaround imports that macro, and then recompiles the problematic code.
;; As SBCL has already interned the invalid symbol, we have to shadow it.
;; Loading the file will cause SBCL to recompile it while using the imported macro.

;; Finding the file to load is somewhat tricky.
;; This code makes the following assumptions:
;;   1. Nyxt is installed through the Guix package by Simendsjo.
;;   2. Nyxt is launched using the dedicated binary from that package.

(shadowing-import 'ps:with-ps-gensyms :spinneret)

(let* ((bin-path (isys:readlink "/proc/self/exe"))
       (pkg-path (str:substring 0 (- (length bin-path) (length "/bin/nyxt")) bin-path))
       (raw-source-path (str:concat pkg-path
                                    "/share/common-lisp/sbcl/nyxt/source/spinneret-tags.lisp"))
       (source-path (pathname raw-source-path)))
  (unless (uiop:file-exists-p source-path)
    (error "Failed to find 'spinneret-tags.lisp' file"))
  
  (load source-path))
