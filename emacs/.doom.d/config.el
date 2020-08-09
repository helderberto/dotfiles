;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Helder Burato Berto"
      user-mail-address "helder.burato@gmail.com")

(display-time-mode 1)
(display-battery-mode 1)
(toggle-frame-maximized)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Hack" :size 13))
(setq doom-big-font (font-spec :family "Hack" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
           (counsel-rg . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))

  (recentf-mode 1)
  (defun eh-ivy-return-recentf-index (dir)
    (when (and (boundp 'recentf-list)
            recentf-list)
      (let ((files-list
              (cl-subseq recentf-list
                0 (min (- (length recentf-list) 1) 20)))
             (index 0))
        (while files-list
          (if (string-match-p dir (car files-list))
            (setq files-list nil)
            (setq index (+ index 1))
            (setq files-list (cdr files-list))))
        index)))

  (defun eh-ivy-sort-file-function (x y)
    (let* ((x (concat ivy--directory x))
            (y (concat ivy--directory y))
            (x-mtime (nth 5 (file-attributes x)))
            (y-mtime (nth 5 (file-attributes y))))
      (if (file-directory-p x)
        (if (file-directory-p y)
          (let ((x-recentf-index (eh-ivy-return-recentf-index x))
                 (y-recentf-index (eh-ivy-return-recentf-index y)))
            (if (and x-recentf-index y-recentf-index)
              ;; Directories is sorted by `recentf-list' index
              (< x-recentf-index y-recentf-index)
              (string< x y)))
          t)
        (if (file-directory-p y)
          nil
          ;; Files is sorted by mtime
          (time-less-p y-mtime x-mtime)))))

  (add-to-list 'ivy-sort-functions-alist
    '(read-file-name-internal . eh-ivy-sort-file-function)))

;; Dracula color palette
;; https://draculatheme.com/contribute#color-palette
(after! org
  :config
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (setq org-log-into-drawer t)
  (setq org-startup-folded 'overview)
  (auto-fill-mode)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "INPROGRESS(i!)" "HOLD(h@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)"))
    org-todo-keyword-faces
    '(("TODO" :foreground "#8be9fd" :weight normal :underline t)
       ("INPROGRESS" :foreground "#bd93f9" :weight normal :underline t)
       ("HOLD" :foreground "#f1fa8c" :weight normal :underline t)
       ("DONE" :foreground "#50fa7b" :weight normal :underline t)
       ("CANCELLED" :foreground "#ff5555" :weight normal :underline t)))

  (setq org-capture-templates
    '(
       ("n" "Note" entry (file +org-capture-notes-file)
         "* %^{DESCRIPTION} \nEntered on %U\n%? %i\n  %a")
       ("t" "Todo" entry (file+olp+datetree +org-capture-todo-file "Inbox")
         "* TODO %?\n  %i\n  %a")
       ("s" "Snippet" entry (file "snippets.org")
         "* %^{DESCRIPTION} %^g \n#+begin_src %^{LANG}\n%?%i\n#+end_src")
       ("p" "Programming" entry (file "programming.org")
         "* %U %?\n%i\n%a")
       ("c" "Changelog" entry (file+headline +org-capture-project-changelog-file "Unreleased")
         "* %U %?\n%i\n%a"))
    ))

(after! deft
  :defer t
  :config
  (setq deft-directory org-directory)
  (setq deft-extensions '("org" "md" "txt"))
  (setq deft-default-extension "org")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules '((nospace . "-"))))

(after! org-journal
  :config
  (setq org-journal-file-format  "%Y%m%d.org"))
