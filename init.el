;;; init.el --- GNU Emacs Configuration

;; Copyright (C) 2014 Terencio Agozzino

;; Author: Terencio Agozzino <terencio.agozzino@gmail.com>
;; Created: February 16, 2014
;; Homepage: https://github.com/rememberYou/.emacs.d
;; Keywords: abbrev, convenience, faces, maint, outlines, vc

;; This program is free software. You can redistribute it and/or modify it under
;; the terms of the Do What The Fuck You Want To Public License, version 2 as
;; published by Sam Hocevar.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.
;;
;; You should have received a copy of the Do What The Fuck You Want To Public
;; License along with this program. If not, see http://www.wtfpl.net/.

;;; Commentary:

;; Following lines build the configuration code out of the config.el file.

;;; Code:

;; Adjust garbage collection thresholds during startup, and thereafter
(setq gc-cons-threshold (* 256 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

(require 'package)
(package-initialize)

(let ((config-org-true-file (file-chase-links (expand-file-name "config.org" user-emacs-directory)))
      (config-org (expand-file-name "config.org" user-emacs-directory))
      (config-el (expand-file-name "config.el" user-emacs-directory)))
  (if (and (file-exists-p config-el)
	       (file-newer-than-file-p config-el config-org-true-file))
      (load-file config-el)
      (org-babel-load-file config-org)))

;;; init.el ends here
