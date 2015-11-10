;;; Packages
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
                         '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

 ;;VIM
(evil-mode 1)
(global-evil-surround-mode 1)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;;AC
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("91faf348ce7c8aa9ec8e2b3885394263da98ace3defb23f07e0ba0a76d427d46" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f5ef7ddecf161a2951048c204c2c6d9d5be08745b136dce583056ad4b234b861" default)))
 '(helm-ack-auto-set-filetype nil)
 '(helm-ack-thing-at-point (quote symbol))
 '(line-number-mode nil)
 '(php-mode-coding-style (quote psr2))
 '(sml/theme (quote light)))

  (eval-after-load "etags"
    '(progn
        (ac-etags-setup)))


 (ac-config-default)
 (setq ac-sources '(ac-source-gtags
                    ac-source-css-property
                    ac-sources-etags
                    ac-source-dictionary
                    ac-source-filename
                    ac-source-files-in-current-dir
                    ac-source-imenu
                    ac-source-words-in-buffer
                    ac-source-yasnippet))

		;;Font
(add-to-list 'default-frame-alist '(font . "Monaco"))
(set-default-font "Monaco")

;;MAC os
(defun system-is-mac ()
  "Mac OS X system checking."
   ((interactive))
   (string-equal system-type "darwin"))



;; Personal
(setq user-full-name   "qlmoriarty")
(setq user-mail-adress "qlmoriarty@gmail.com")

(setq frame-title-format " Emacs: %b")

;; Inhibit startup/splash screen
(setq inhibit-splash-screen t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode 1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

;; Delete selection
(delete-selection-mode t)

;;run shell
(global-set-key (kbd "C-x /") 'shell-command) ;; run shell

;; Special settings
(menu-bar-mode 1)
;; (menu-bar-mode	   -1) ;; отключаем графическое меню

(tool-bar-mode	   -1) ;; отключаем tool-bar
;; (scroll-bar-mode   -1) ;;  отключаем scroll-bar
(tooltip-mode	   -1)

(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; Disable backup/autosave files
(setq make-backup-files		   nil)
(setq auto-save-default		   nil)
(setq auto-save-list-file-name nil) 

;; Encoding
(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read	'utf-8)
(setq file-name-coding-system			'utf-8)
(set-selection-coding-system			'utf-8)
(set-keyboard-coding-system		   'utf-8-unix)
(set-terminal-coding-system				'utf-8)
(prefer-coding-system					'utf-8)

(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать
;; linum
(line-number-mode	t) ;; показать номер строки в mode-line
(global-linum-mode	t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

;;Time && visual line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode			   t) ;; показывать часы в mode-line
(global-visual-line-mode t)

;; evil visualstart
(global-evil-visualstar-mode)

;;IDO
(ido-mode  t)
(icomplete-mode t)
;; (ido-everywhere  t)
(setq ido-vitrual-buffers  t)
(ido-vertical-mode 1)
(setq ido-enable-flex-matching t)
(flx-ido-mode 1)
		   ;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

;; Terminals

(global-set-key (kbd "C-x C-t") 'eshell) ;; запуск buffer selection кнопкой F2
(global-set-key (kbd "C-x t") 'eshell) ;; запуск buffer selection Indent кнопкой

;; Tabs 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) 

;; php-mode-tab-hook Hook
(add-hook 'php-mode-hook
          (lambda () (setq indent-tabs-mode t))) 

;; (setq lisp-indent-function  'common-lisp-indent-function)

 ;; Always end a file with a newline
(setq require-final-newline nil)

            ;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

            ;; Clipboard settings
(setq x-select-enable-clipboard t)

            ;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

            ;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

;;Yas Global mode
(yas-global-mode t)

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6
				
        ;; emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

            ;;web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.md?\\'" . web-mode))


;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.min.js\\'" . js2-mode))

(defun my-js2-mode-hook()
  (ac-js2-mode t)
  (jquery-mode t) 
  (setq-default indent-tabs-mode nil)
 (setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
 (global-set-key (kbd "C-x j") 'jquery-doc))

(setq web-mode-enable-current-element-highlight t)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; HOOK for web mode
(defun my-web-mode-hook ()
              "Hooks for Web mode."
              (setq web-mode-markup-indent-offset 2)
              (setq web-mode-css-indent-offset 2)
              (setq web-mode-code-indent-offset 4)
              (rainbow-mode t)
              (emmet-mode t)
              (require 'ac-php)
              (setq ac-sources  '(ac-source-php ) )
			  
              (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
              (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
              )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flymake-css)
(add-hook 'css-mode-hook 'flymake-css-load)
(require 'flymake-jslint)
(add-hook 'js2-mode-hook 'flymake-jslint-load)
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; scss
;;expand Region
(global-set-key (kbd "C-q") 'er/expand-region)

;; POWERLINE
(require 'powerline)
(require 'powerline-evil)
(powerline-default-theme)

;;NeoTREE
(require 'neotree)
(global-set-key (kbd "s-1") 'neotree-toggle)

(setq projectile-switch-project-action 'neotree-projectile-action)
 (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


;;drag Drag
(drag-stuff-mode t)

;;Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;Exec PATH From shell

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;shell-prompt-extras
(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

;;HELM ACK
(require 'helm)
(require 'helm-ack)



;; Projectile
(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)

;;JAVASCRIPT MODE
(require 'tern)
(require 'tern-auto-complete)

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))



;; Ruby dev
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist
               '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
;; Rsence
(require 'rsense)


;; DASH
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)


;; (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

;;helm
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(helm-mode 1)

 (global-set-key (kbd "M-x") 'helm-M-x)
;; Helm ACK
(require 'helm-config)
(require 'helm-ack)



;;jquery-doc
(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

;; Angular
(add-to-list 'ac-dictionary-directories "/path/to/angularjs-mode/ac-dict")
(add-to-list 'ac-modes 'angular-mode)
(add-to-list 'ac-modes 'angular-html-mode)

;;js-comint
  (require 'js-comint) 
    (setq inferior-js-program-command "node") ;; not "node-repl"
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))

;;WEB BEAUTY
 (require 'web-beautify) ;; Not necessary if using ELPA package
    (eval-after-load 'js2-mode
      '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
    (eval-after-load 'json-mode
      '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
    (eval-after-load 'sgml-mode
      '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
    (eval-after-load 'css-mode
      '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; If you want to automatically format before saving a file,
;; add the following hook to your Emacs configuration:

    (eval-after-load 'js2-mode
      '(add-hook 'js2-mode-hook
                 (lambda ()
                   (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

    (eval-after-load 'json-mode
      '(add-hook 'json-mode-hook
                 (lambda ()
                   (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

    (eval-after-load 'sgml-mode
      '(add-hook 'html-mode-hook
                 (lambda ()
                   (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

    (eval-after-load 'css-mode
      '(add-hook 'css-mode-hook
                 (lambda ()
                   (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
;;Google this
 ;; (google-this-mode 1)
 ;; (global-set-key (kbd "C-x C-g") 'google-this)

;;last visual plugins
(indent-guide-global-mode)  
(global-git-gutter-mode +1)
(require 'smooth-scrolling)


;;My arrow moves
(global-set-key (kbd "M-DEL") 'backward-kill-word)

(global-set-key (kbd "<M-left>") 'backward-word)
(global-set-key (kbd "<M-right>") 'forward-word)
(global-set-key (kbd "<s-left>") 'evil-first-non-blank)
(global-set-key (kbd "<s-right>") 'evil-end-of-line)

(global-set-key (kbd "<s-backspace>") 'backward-kill-sentence)

;; Enable helm-gtags-mode
 (add-hook 'web-mode-hook 'helm-gtags-mode)
 (add-hook 'php-mode-hook 'helm-gtags-mode)
 (add-hook 'js-mode-hook 'helm-gtags-mode)
 (add-hook 'js2-mode-hook 'helm-gtags-mode)

;; Set key bindings
    (eval-after-load "helm-gtags"
      '(progn
         (define-key helm-gtags-mode-map (kbd "C-t") 'helm-gtags-find-tag)
         (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
         (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
         (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
         (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
         (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
         (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
