(require 'package)

(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-refresh-contents)

(package-install 'org-plus-contrib)
(package-install 'htmlize)

(require 'org)

(setq org-publish-project-alist
  `(("org-files"
     :base-directory "./org/"
     :base-extension "org"
     :recursive nil
     :publishing-directory "./html/"
     :publishing-function org-html-publish-to-html)
    ("static-files"
     :base-directory "./org/"
     :base-extension "png\\|jpg"
     :publishing-directory "./html/"
     :recursive nil
     :publishing-function org-publish-attachment)
    ("site" :components ("org-files" "static-files"))))
