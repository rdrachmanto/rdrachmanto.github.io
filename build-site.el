(require 'ox-publish)

(defun read-template (filename)
  "Read template contents from filename"
  (with-temp-buffer
    (insert-file-contents filename)
    (buffer-string)))

(setq my-custom-header (read-template "./templates/my-header.html"))
(setq my-custom-footer (read-template "./templates/my-footer.html"))

(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :with-author nil
             :with-creator t
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil
             :publishing-function 'org-html-publish-to-html
             :html-preamble my-custom-header
             :html-postamble my-custom-footer)))

(setq org-html-validation-link nil)

(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"./static/style.css\"")
      ;; org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(setq org-export-with-sub-superscripts '{})

(org-publish-all t)
(message "Build complete!")
