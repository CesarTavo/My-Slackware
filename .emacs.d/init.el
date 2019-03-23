
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Copy-right (C) 2018 César Tavo
;;; Version: 25.2.2
;;; Este es mi configuración emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;    MANEJADOR DE    ;;;;;
;;;;;      PAQUETES      ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PACKAGE
;;Administrador de paquetes
(require 'package)

;;IDO
;;Facilita la búsqueda y ubicación de archivos
(require 'ido)

;;MULTIPLE CURSORS
;;Agrega cursores
;(require 'multiple-cursors)

(setq package-enable-at-startup nil
      package-archives '(("gnu"          . "https://elpa.gnu.org/packages/")
			 ("marmalade"    . "https://marmalade-repo.org/packages/")
			 ("melpa"        . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org"          . "https://orgmode.org/elpa/"))
      package-archive-priorities '(("org"          . 20)
				   ("melpa"        . 15)
				   ("melpa-stable" . 12)
				   ("marmalade"    . 10)
				   ("gnu"          . 5)))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;;El-Get
;;Es el apt get de emacs

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;      DEFAULT       ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;    INFORMACION     ;;;;;
;;;;;      PERSONAL      ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "César Gustavo Sánchez de la Rosa")
(setq user-mail-address "cesartavo@ciencias.unam.mx")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;    ELOGIO A LA     ;;;;;
;;;;;       PEREZA       ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Preguntar "y" o "n" eb lugar de "yes" o "no".
(fset 'yes-or-no-p 'y-or-n-p)

;;Resaltar el paréntesis correspondiente cuando el cursor pase sobre él.
(show-paren-mode t)

;;Resaltar tabulaciones
(setq-default highlight-tabs t)

;;Mostrar los espacios en blanco arrastrados
(setq-default show-trailing-whitespaces t)

;;Remover los espacios en blanco sin usar antes de guardar un documento
;(add-hook 'before-save-hook 'whitespace-cleanup)
;(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;;Guardar los archidos autoguardados en el directorio 
(setq backup-directory-alist '(("/home/tavo/.emacs.d/" . "auto-save-list/")))
(setq auto-saves-dir '(("/home/tavo/.emacs.d/backups/")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;    VARIABLES       ;;;;;
;;;;;       EMACS        ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode)))
 '(ahs-edit-mode-off-hook nil)
 '(ahs-exclude nil)
 '(ahs-modes
   (quote
    (actionscript-mode apache-mode bat-generic-mode c++-mode c-mode csharp-mode css-mode dos-mode emacs-lisp-mode html-mode ini-generic-mode java-mode javascript-mode js-mode lisp-interaction-mode lua-mode latex-mode makefile-mode makefile-gmake-mode markdown-mode moccur-edit-mode nxml-mode nxhtml-mode outline-mode perl-mode cperl-mode php-mode python-mode rc-generic-mode reg-generic-mode ruby-mode sgml-mode sh-mode squirrel-mode text-mode tcl-mode visual-basic-mode)))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode t)
 '(cursor-in-non-selected-windows (quote hollow))
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (misterioso)))
 '(fit-frame-to-buffer nil)
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoctor asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cwl d-dmd dockerfile-hadolint emacs-lisp ## erlang-rebar3 erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-megacheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-emacs-lisp-check-declare nil)
 '(flycheck-emacs-lisp-checkdoc-executable nil)
 '(flycheck-highlighting-mode (quote symbols))
 '(global-auto-highlight-symbol-mode t)
 '(global-flycheck-mode t)
 '(ido-auto-merge-delay-time 0.5)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-decorations
   (quote
    ("
-->> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]" "
-->> " "")))
 '(ido-default-buffer-method (quote raise-frame))
 '(ido-enable-dot-prefix t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-make-buffer-list-hook nil)
 '(ido-make-file-list-hook nil)
 '(ido-mode t nil (ido))
 '(ido-rotate-file-list-default t)
 '(ido-vertical-define-keys (quote C-n-C-p-up-and-down))
 '(ido-vertical-disable-if-short nil)
 '(ido-vertical-indicator "->>")
 '(ido-vertical-mode t)
 '(ido-vertical-show-count t)
 '(inhibit-startup-screen t)
 '(major-mode-icons-icons-path "/home/tavo/.emacs.d/elpa/")
 '(major-mode-icons-icons-style (quote all-the-icons))
 '(mc/always-repeat-command nil)
 '(menu-bar-mode t)
 '(package-selected-packages
   (quote
    (all-the-icons-dired all-the-icons-gnus neotree php-cs-fixer php-auto-yasnippets php-refactor-mode phpactor web-mode php-mode indent-guide switch-window smartparens hlinum yasnippet-snippets ac-c-headers ac-python auto-complete-c-headers basic-c-compile cff cmm-mode company-c-headers cpputils-cmake demangle-mode ac-math paced auto-complete-auctex auctex-latexmk auctex-lua bibretrieve bibtex-utils cdlatex company-auctex ebib gscholar-bibtex latex-math-preview latex-preview-pane magic-latex-buffer latex-extra auctex multiple-cursors ido-vertical-mode ido-hacks auto-highlight-symbol highlight-symbol flycheck-color-mode-line flycheck buffer-move auto-complete python-mode ruby-test-mode clojure-mode fwb-cmds fit-frame framesize ## toggle-window use-package major-mode-icons)))
 '(scroll-bar-mode nil)
 '(show-smartparens-global-mode t)
 '(smartparens-global-mode t)
 '(smartparens-global-strict-mode nil)
 '(sp-autodelete-closing-pair t)
 '(sp-autodelete-opening-pair t)
 '(sp-autodelete-pair t)
 '(sp-autodelete-wrap t)
 '(sp-autoinsert-pair t)
 '(sp-autoinsert-quote-if-followed-by-closing-pair t)
 '(sp-navigate-close-if-unbalanced t)
 '(sp-undo-pairs-separately t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top))
 '(widget-choice-toggle nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 95 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(ahs-definition-face ((t (:box (:line-width 1 :color "dark slate gray")))))
 '(ahs-face ((t (:box (:line-width 1 :color "dark slate gray")))))
 '(ahs-plugin-defalt-face ((t nil)))
 '(completions-common-part ((t (:weight ultra-bold))))
 '(completions-first-difference ((t (:box (:line-width 1 :style released-button) :weight semi-light))))
 '(cursor ((t (:background "rosy brown" :foreground "indian red"))))
 '(error ((t (:foreground "red" :weight extra-bold))))
 '(highlight ((t (:background "light sea green" :foreground "#e1e1e0" :underline t))))
 '(icomplete-first-match ((t (:weight bold))))
 '(ido-first-match ((t (:underline t :weight bold))))
 '(ido-hacks-flex-match ((t (:weight bold))))
 '(lazy-highlight ((t (:background "#338f86" :foreground "white"))))
 '(match ((t (:background "RoyalBlue3"))))
 '(mode-line-buffer-id ((t (:underline t :weight ultra-bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "grey60" :style released-button)))))
 '(region ((t (:background "dark cyan" :foreground "white"))))
 '(shadow ((t (:foreground "grey70"))))
 '(sp-pair-overlay-face ((t (:background "dark slate gray"))))
 '(underline ((t (:underline t)))))

;;PANTALLA COMPLETA
(when (display-graphic-p)
  (toggle-frame-maximized))

;;AUTOPAIR
;;(use-package autopair :ensure t :diminish autopair-mode
;;  :config (autopair-global-mode t))   

;;ANZU
(use-package anzu :ensure t :diminish anzu-mode
  :config (progn (global-anzu-mode +1)
                 (set-face-attribute 'anzu-mode-line nil :foreground "grey13")))
;;ICONOS
(use-package major-mode-icons :ensure t
  :config (major-mode-icons-mode 1))

;;AUTOCOMPLETADO
(use-package auto-complete :ensure t :diminish auto-complete-mode
  :config (global-auto-complete-mode t))

;;BUFFER MOVE
;;Permite reorganizar y moverse entre los buffers desde una ventana a otra
(use-package buffer-move :ensure t
  :bind (("<M-s-up>"    . buf-move-up)
	 ("<M-s-down>"  . buf-move-down)
	 ("<M-s-left>"  . buf-move-left)
      	 ("<M-s-right>" . buf-move-right)))

;;Multiple-cursors
;;Añade cursores para escribir
(use-package multiple-cursors :ensure t :diminish multiple-cursors-mode
  :bind (("M-." . mc/mark-next-like-this)
	 ("M-," . mc/unmark-next-like-this)
	 ("C-s-<mouse-1>" . mc/add-cursor-on-click)))

;;Smartparents
(require 'smartparens)

;;Paquete indent-guide
;;Muestra la guia de identaciones
(require 'indent-guide)
(use-package indent-guide :ensure t
  :config (indent-guide-global-mode))



;;Yasnipet

;;switchWindow
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;;PHP
(require 'php-mode)
(use-package php-mode :ensure t
  :config (php-mode))


;;linum-mode
;;Enumera las lineas
(global-linum-mode)

;;NeoTree
;;(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;Icons NeoTree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;All-Icons
(require 'all-the-icons)
;; or
(use-package all-the-icons)


;;Paquetes para LaTeX
;;LaTeX es mi editor favorito para muchas cosas
(load "auctex.el" nil t t)
(require 'tex-mik)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq auto-complete-mode t)






