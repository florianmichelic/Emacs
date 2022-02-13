
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (smex linum-relative iedit auto-complete-c-headers yasnippet irony)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; ------------------------------------------------------------------------------------------------
;; Basic stuff
;; ------------------------------------------------------------------------------------------------

;; Hotkeys
(global-set-key (kbd "M-#") 'compile)

;; Auto-close brackets
(electric-pair-mode 1)

;; set relative line numbers
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

;; set Emacs backup directory
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; enable IDO
(require 'ido)
(ido-mode t)

;; enable SMEX
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; enable Company-Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; enable YASnippet
(require 'yasnippet)
(yas-global-mode 1)

;; ------------------------------------------------------------------------------------------------

;; ------------------------------------------------------------------------------------------------
;; C/C++ Config
;; ------------------------------------------------------------------------------------------------

;; Autocomplete C/C++-Headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/9/")

;; setup Semantic-Mode
(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)

;; C/C++ style
(c-add-style
 "C-Style"
 '((indent-tabs-mode . nil)
   (fill-column . 75)
   (c-basic-offset . 4)
   (c-offsets-alist . (
                       (access-label . /)
                       (inextern-lang . 0)
                       (innamespace . 0)
                       (member-init-intro . ++)
		       (substatement-open . 0)
		       (inline-open . 0)
                       ))))
(setq c-default-style "C-Style")

;; ------------------------------------------------------------------------------------------------
