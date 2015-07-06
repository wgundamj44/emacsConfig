; first we initialize our package management
(require 'package)
(package-initialize)

(load "~/.emacs.d/my-packages.el")

(require 'magit)
(define-key global-map (kbd "<f10>") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)
;(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))


; Alt-q to other window
(define-key global-map (kbd "M-q") 'other-window)


; helm
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)

;; ido
(ido-mode t)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; solarized color theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote light)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-terminal-parameter nil 'background-mode 'light)


;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; jedi direx
(add-hook 'jedi-mode-hook 'jedi-direx:setup)


;; hightlight currernt line
(hl-line-mode t)

;; highlight matching parenthesis
(show-paren-mode)

;; imenu
(global-set-key (kbd "M-n") 'helm-imenu)

;; turn on projectile
(projectile-global-mode)


;; turn on flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
