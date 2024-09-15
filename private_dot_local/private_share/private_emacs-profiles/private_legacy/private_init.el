;;; -*- Emacs-Lisp -*-
;;; 
;;; Load config.elc file. If it does not exists, compile org file and
;;; then load it.

(setq vc-follow-symlinks nil)
(let ((org-config-file "~/.local/share/emacs-profiles/legacy/config.org")
      (elc-config-file "~/.local/share/emacs-profiles/legacy/config.elc"))
  (if (file-newer-than-file-p org-config-file elc-config-file)
      (org-babel-load-file org-config-file t)
    (load elc-config-file)))
(setq vc-follow-symlinks 'ask)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
