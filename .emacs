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
;; helm-grep
(global-set-key (kbd "C-c g")
                (lambda () (interactive)
                  (setq current-prefix-arg '(4)) ; C-u
                  (helm-do-grep)))


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
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(frame-background-mode (quote dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-terminal-parameter nil 'background-mode 'dark)


;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


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


;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-auto-pairing t)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'web-mode-hook 'emmet-mode)


;; use soft tab
(setq-default indent-tabs-mode nil)


;; disable backup file
(setq make-backup-files nil)

