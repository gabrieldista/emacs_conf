;; Disable startup message
(setq inhibit-startup-message t)
(setq visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Font
(add-to-list 'default-frame-alist
	     '(font . "Source Code Pro Medium-16"))

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Evil Mode
(use-package evil
  :ensure t
  :config

  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode t)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key "e" 'find-file)
    (evil-leader/set-key "t" 'other-tab-prefix)
    (evil-leader/set-key "x" 'tab-close)
    (evil-leader/set-key "u" 'tab-undo)
    (evil-leader/set-key "d" 'dired)
;;    (evil-leader/set-key "v" 'split-find)
)

  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)
  
  (use-package evil-numbers
    :ensure t
    :config
    (evil-define-key '(normal visual) 'global (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (evil-define-key '(normal visual) 'global (kbd "C-c -") 'evil-numbers/dec-at-pt)
    (evil-define-key '(normal visual) 'global (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
    (evil-define-key '(normal visual) 'global (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)) 

  (use-package evil-org
    :ensure t
    :after org
    :hook (org-mode . (lambda () evil-org-mode))
    :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

  (use-package powerline-evil
    :ensure t
    :config
    (powerline-evil-vim-color-theme)))

(setq evil-search-module 'evil-search)

(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(use-package goto-chg
    :ensure t
    :after evil)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package timu-spacegrey-theme
  :ensure t
  :config
  (load-theme 'timu-spacegrey t))

(defun split-find ()
  "Split window and find a file."
  (interactive)
  (split-window-right)
  (find-file))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-numbers goto-chg undo-tree powerline-evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
