(in-package #:nyxt-user)

;;search engines setup | first one in list becomes default
;;format: :name "Display Name" :shortcut "shortcut" :control-url "url with ~a for query"
(defvar *my-search-engines*
  (list
   (make-instance 'search-engine :name "Amazon FR"    :shortcut "afr"  :control-url "https://amazon.fr/s?k=~a")
   (make-instance 'search-engine :name "Amazon"       :shortcut "a"    :control-url "https://amazon.com/s?k=~a")
   (make-instance 'search-engine :name "DOI"          :shortcut "doi"  :control-url "https://dx.doi.org/~a")
   (make-instance 'search-engine :name "GitHub"       :shortcut "gh"   :control-url "https://github.com/search?q=~a")
   (make-instance 'search-engine :name "IMDb"         :shortcut "imdb" :control-url "https://www.imdb.com/find?q=~a")
   (make-instance 'search-engine :name "Lens"         :shortcut "lns"  :control-url "https://www.lens.org/lens/search/scholar/list?preview=true&q=~a")
   (make-instance 'search-engine :name "OpenStreetMap":shortcut "osm"  :control-url "https://www.openstreetmap.org/search?query=~a")
   (make-instance 'search-engine :name "Startpage"    :shortcut "sp"   :control-url "https://startpage.com/do/search?sc=g4dHFVhCiD5Z20&query=~a&cat=web")
   (make-instance 'search-engine :name "Startpage Img":shortcut "spi"  :control-url "https://startpage.com/do/search?sc=g4dHFVhCiD5Z20&query=~a&cat=pics")
   (make-instance 'search-engine :name "Wikipedia FR" :shortcut "wfr"  :control-url "https://fr.wikipedia.org/w/index.php?search=~a")
   (make-instance 'search-engine :name "Wikipedia"    :shortcut "w"    :control-url "https://en.wikipedia.org/w/index.php?search=~a")
   (make-instance 'search-engine :name "17track"      :shortcut "17t"  :control-url "https://t.17track.net/en#nums=~a")
   (make-instance 'search-engine :name "DuckDuckGo"   :shortcut "ddg"  :control-url "https://duckduckgo.com/?q=~a")))

(define-configuration browser
  ((search-engines (append %slot-default% *my-search-engines*))))
