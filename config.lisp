(in-package :nyxt-user)

;; Base
(nyxt::load-lisp "~/.config/nyxt/misc/guix-fix.lisp")
(nyxt::load-lisp "~/.config/nyxt/theme/catppuccin.lisp")
(nyxt::load-lisp "~/.config/nyxt/theme/catppuccin-flavour.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/urlprompt.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/domainrules.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/commands.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/keybindings.lisp")
(nyxt::load-lisp "~/.config/nyxt/base/glyphs.lisp")

;; Wrap up
(echo "Loaded config.")
