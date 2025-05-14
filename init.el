;;; init.el 

(setq gc-cons-threshold (* 256 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))



(let ((config-org-true-file (file-chase-links (expand-file-name "config.org" user-emacs-directory)))
      (config-org (expand-file-name "config.org" user-emacs-directory))
      (config-el (expand-file-name "config.el" user-emacs-directory)))
  (if (and (file-exists-p config-el)
	       (file-newer-than-file-p config-el config-org-true-file))
      (load-file config-el)
      (org-babel-load-file config-org)))


(provide 'init)
;;; init.el ends here

