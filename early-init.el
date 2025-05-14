;;; early-init.el --- Shaowei's Emacs Configuration --- Early Init  -*- lexical-binding: t; -*-
;;
;; Author: Shaowei Wang
;;

;;; Commentary:
;;  Early init configuration for Emacs Solo
;;

;;; Code:

;; Startup performace boost
(setq gc-cons-threshold (* 256 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

;; Better Window Management handling
(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      frame-title-format
      (list (format "%s %%S: %%j " (system-name))
      '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq inhibit-compacting-font-caches t)


;; Disables unused UI Elements
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))


;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)


;; Avoid raising the *Messages* buffer if anything is still without
;; lexical bindings
(setq warning-minimum-level :error)
(setq warning-suppress-types '((lexical-binding)))

(defun my/load-init-file ()
  (interactive)
  (load-file user-init-file))

(defun my/edit-init-file ()
  (interactive)
  (find-file (expand-file-name "config.org" user-emacs-directory)))


(provide 'early-init)
;;; early-init.el ends here
