;; See https://orgmode.org/manual/Publishing-options.html
;;     https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
;;     https://thibaultmarin.github.io/blog/posts/2016-11-13-Personal_website_in_org.html

(require 'package)

(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-refresh-contents)

(package-install 'org-plus-contrib)
(package-install 'htmlize)

(require 'org)

(defun html-preamble (options)
  (with-temp-buffer
    (insert-file-contents "../html/preamble.html")
    (buffer-string)))

(defun html-postamble (options)
  (with-temp-buffer
    (insert-file-contents "../html/postamble.html")
    (buffer-string)))

(setq org-publish-project-alist
  `(("org-files"
     :base-directory "./org/"
     :base-extension "org"
     :recursive nil
     :publishing-directory "./public_html/"
     :publishing-function org-html-publish-to-html
     :html-head "<style type=\"text/css\">body { max-width: 38rem; padding: 2rem; margin: auto; font-family: sans-serif; background: #fff; color: #000; }</style>"
     :html-head-extra "<style type=\"text/css\">header h1 { font-size: 300%; text-align: center; background: #def; margin:0; } header nav { border-bottom: 1px solid #abc; padding-bottom: .25ex; } header nav a { text-decoration: none; color: #000; } header nav a:hover { background: #248; color: #fff; }footer { border-top: 1px solid #abc; font-style: italic; }</style>"
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :html-preamble html-preamble
     :html-postamble html-postamble
     :with-toc nil
     :section-numbers nil
     :language en
     :html-doctype "html5"
     ;;:html-html5-fancy t
     )
    ("static-files"
     :base-directory "./org/"
     :base-extension "png\\|jpg"
     :publishing-directory "./public_html/"
     :recursive nil
     :publishing-function org-publish-attachment)
    ("site" :components ("org-files" "static-files"))))

(setq user-full-name "Søren Lund")
