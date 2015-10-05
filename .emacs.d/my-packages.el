(require 'cl)
(defvar required-packages
  '(
    magit
    yasnippet
    company
    helm
    helm-imenu
    projectile
    helm-projectile
    js2-mode
    yaml-mode
    color-theme-solarized
    volatile-highlights
    company-jedi
    flycheck
    flx-ido
    web-mode
    emmet-mode
    ) "A list of packages to ensure on startup")

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless package-archive-contents
  (package-refresh-contents))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun ensure-package(package-name) 
  (when (not (package-installed-p package-name))
    (package-install package-name)))
