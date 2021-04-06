;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Helder Burato Berto"
  user-mail-address "helder.burato@gmail.com")

;; Set default to maximize frame when starts
(add-to-list 'default-frame-alist '(fullscreen . maximized))

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
(setq doom-font (font-spec :family "Hack" :size 14))
(setq doom-big-font (font-spec :family "Hack" :size 18))

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

;; It is used to Magit Forge
(setq auth-sources '("~/.authinfo"))

;; Path to discover projects with projectile
(setq projectile-project-search-path '("~/workspace"))

;; Todoist API Token
;; use token (~/.todoist-token)
(setq todoist-token
  (with-temp-buffer
    (insert-file-contents "~/.todoist-token")
    (buffer-string)))

(after! ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-re-builders-alist
    '((swiper . ivy--regex-plus)
       (counsel-rg . ivy--regex-plus)
       (t      . ivy--regex-fuzzy))))

;; Dracula color palette
;; https://draculatheme.com/contribute#color-palette
(after! org
  :config
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (setq org-log-into-drawer t)
  (setq org-startup-folded 'overview)
  (auto-fill-mode)

  (setq org-archive-location "archives/%s_archive::")

  (setq org-agenda-files (list org-directory (concat org-directory)))

  (setq org-agenda-custom-commands
    '(("w" "At Work" tags-todo "@work"
        ((org-agenda-overriding-header "Work")))
       ("h" "At Home" tags-todo "@home"
         ((org-agenda-overriding-header "Home")))
       ("p" "At Personal" tags-todo "@personal"
         ((org-agenda-overriding-header "Personal")))
       ("e" "At Education" tags-todo "@education"
         ((org-agenda-overriding-header "Education")))
       ))

  (setq org-agenda-skip-scheduled-if-done t)

  (setq org-priority-faces '((65 :foreground "#ff5555")
                             (66 :foreground "#f1fa8c")
                             (67 :foreground "#8be9fd")))

  (setq org-todo-keywords
    '((sequence "TODO(t)" "INPROGRESS(i!)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)"))
    org-todo-keyword-faces
    '(("TODO" :foreground "#8be9fd" :weight normal :underline t)
       ("INPROGRESS" :foreground "#bd93f9" :weight normal :underline t)
       ("WAITING" :foreground "#f1fa8c" :weight normal :underline t)
       ("DONE" :foreground "#50fa7b" :weight normal :underline t)
       ("CANCELLED" :foreground "#ff5555" :weight normal :underline t)))

  (setq org-capture-templates
    '(
       ("n" "Note" entry (file +org-capture-notes-file)
         "* %^{DESCRIPTION} \nEntered on %U\n%? %i\n %a")
       ("t" "Todo [inbox]" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO [#A] %i%? %^g\nSCHEDULED: %(org-insert-time-stamp
        (org-read-date nil t \"+0d\"))\n")
       ("s" "Snippet" entry (file "snippets.org")
         "* %^{DESCRIPTION} %^g \n#+begin_src %^{LANG}\n%?%i\n#+end_src")
       ("e" "Education" entry (file "education.org")
         "* %i%? \n%U")
       ("r" "Read Later" entry (file+headline "references/readlater.org" "Misc")
         "* TODO %i%? \n")
       ))
  )

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
  (setq org-journal-file-format  "%Y-%m-%d.org"))

(after! doom-modeline
  :config
  (setq doom-modeline-continuous-word-count-modes
    '(markdown-mode gfm-mod)))

(defun maybe-use-prettier ()
  "Enable prettier-js-mode if .prettierrc or .prettierrc.json file is located."
  (if (or (locate-dominating-file default-directory ".prettierrc")
          (locate-dominating-file default-directory ".prettierrc.json"))
        (prettier-js-mode +1)))

(use-package! prettier-js)
(after! prettier-js
  :config
  (setq! prettier-js-args '(
                             "--trailing-comma" "all"
                             "--bracket-spacing" "true"
                             )))
(add-hook! '(
              js2-mode-hook
              rjsx-mode-hook
              web-mode-hook
              typescript-mode-hook
              typescript-tsx-mode-hook) 'maybe-use-prettier)

(use-package! google-translate
  :custom
  (google-translate-backend-method 'curl)
  :config
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  (setq google-translate-translation-directions-alist
    '(("en" . "pt") ("pt" . "en") ))
  )
