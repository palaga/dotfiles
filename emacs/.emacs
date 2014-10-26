(require 'whitespace)
(global-whitespace-mode 1)
(global-linum-mode 1)                   ; Enable line number
(setq truncate-lines t                  ; Disable line wrapping
      inhibit-startup-message t         ; Bring straight to scratch buffer
      inhibit-splash-screen t           ; Disable splash screen
      tab-width 4                       ; Set tab width to 4
      indent-tabs-mode nil              ; Disable tabs
      make-backup-files nil             ; Disable backup files
      echo-keystrokes 0.1               ; Lower the time to show keystrokes
      use-dialog-box nil                ; Do not use dialog boxes
      browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium"
      whitespace-style '(trailing	; Show trailing spaces
			 tabs		;      tabs
			 newline	;      newlines
			 tab-mark))	; and  mark tabs

(scroll-bar-mode -1)			; Disable scroll bars
(tool-bar-mode -1)			; Disable tool bar
(menu-bar-mode -1)			; Disable menu bar

(defalias 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode 1)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-\\") 'hippie-expand)


;;; Package configuration
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

			 
(defvar my-packages '(ac-slime
		      auctex
		      auto-complete
		      autopair
		      company
		      flycheck
		      graphviz-dot-mode
		      haskell-mode
		      lacarte
		      magit
		      markdown-mode
		      paredit
		      solarized-theme
		      org
		      org-plus-contrib
		      powerline
		      slime
		      writegood-mode
		      zenburn-theme)
  "Default packages")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(require 'cl)
(defun my-packages-installed-p ()
  (loop for pkg in my-packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;; Setting up theme
(load-theme 'solarized-dark t)
;; (load-theme 'zenburn t t)

;;; Configure la carte
(require 'lacarte)
(global-set-key [?\e ?\M-x] 'lacarte-execute-command)


;;; 
(setq inferior-lisp-program "/bin/sbcl")

(require 'dired-x)
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-omit-files-p t)

(require 'ido)
(ido-mode t)

;;; Setting up paredit
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)

;;; Powerline settings
(require 'powerline)
(powerline-center-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-plantuml-jar-path "/home/palaga/.emacs.d/plantuml.jar")
 '(powerline-buffer-size-suffix nil)
 '(powerline-default-separator (quote zigzag))
 '(powerline-height nil)
 '(powerline-text-scale-factor nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:inherit default :background "#002b36"))))
 '(powerline-active2 ((t (:inherit default :background "#073642"))))
 '(powerline-inactive1 ((t (:inherit default :background "#073642"))))
 '(powerline-inactive2 ((t (:inherit default :background "#002B36")))))
