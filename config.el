;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; MY OWN CONFIG
(setq doom-theme 'doom-one) ;;also tried monokai, doom-vibrant, wombat etc
(setq doom-font (font-spec :size 24))
(setq display-line-numbers-type 'visual)
(setq visible-cursor nil)
(setq org-cycle-separator-lines -1)

;; disable evil snipe
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; org default view overview
(use-package! org
  :config (setq org-startup-folded 'content))

; Face needs to be customized because default colors are unideal
; For monokai machine
;(custom-set-faces!
    ;'(dired-marked :foreground "#c678dd" :background nil :inverse-video nil)
    ;'(hl-line :background nil)
    ;'(org-hide :foreground "black")
    ;)
;(after! magit ( custom-set-faces!
    ;'(magit-diff-removed :foreground "#be7373" :background "black")
    ;'(magit-diff-removed-highlight :foreground "#ee9090" :background "black")))
;(after! org ( custom-set-faces! '(org-todo :foreground "#7fff50" :background "black")))

; For Doom one
;(custom-set-faces!
    ;'(orderless-match-face-0 :foreground "#51afef" :background nil)
    ;'(orderless-match-face-1 :foreground "#c678dd" :background nil)
    ;'(orderless-match-face-2 :foreground "#99bb66" :background nil)
    ;'(orderless-match-face-3 :foreground "#ecbe7b" :background nil)
    ;'(diff-refine-added :foreground "#90ee90" :background "#black" :inverse-video nil)
    ;'(diff-refine-changed :foreground "#a9a1e1" :background "black" :inverse-video nil)
    ;'(diff-refine-removed :foreground "#ee9090" :background "black" :inverse-video nil))
;(after! magit (custom-set-faces!
    ;'(magit-diff-hunk-heading-highlight :foreground "#400040")
    ;'(magit-diff-hunk-heading-selection :foreground "#805000" :background "#a9a1e1")
    ;'(magit-diff-revision-summary-highlight :foreground "#FF00FF")
    ;'(magit-diff-added :foreground "#73be73" :background "black")
    ;'(magit-diff-added-highlight :foreground "#90ee90" :background "black")))

;; For wombat
;(after! org (custom-set-faces!
    ;'(org-level-1 :foreground "#FFFFE0" :background nil)
    ;'(org-level-2 :foreground "#ABF7B1" :background nil)
    ;'(org-level-1 :foreground "light yellow" :background nil)
    ;'(org-level-2 :foreground "lime" :background nil)
    ;'(org-level-3 :foreground "pale turquoise" :background nil)
    ;'(org-document-title :foreground "orange" :background nil)))
    ;; '(diredfl-dir-heading :foreground "green" :background nil)
    ;; ))

;; Stop heading from bold
(after! org (custom-set-faces!
              '(org-level-1 :weight regular :inherit outline-7)
              '(org-level-2 :weight regular :inherit outline-6)
              '(org-level-3 :weight regular :inherit outline-5)
              '(org-level-4 :weight regular :inherit outline-4)
              '(org-level-5 :weight regular :inherit outline-3)
              '(org-level-6 :weight regular :inherit outline-2)
              '(org-level-7 :weight regular :inherit outline-1)
              '(org-level-8 :weight regular :inherit outline-8)
              ;'(org-level-1 :weight regular :inherit outline-1)
              ;'(org-level-2 :weight regular :inherit outline-2)
              ;'(org-level-3 :weight regular :inherit outline-3)
              ;'(org-level-4 :weight regular :inherit outline-4)
              ;'(org-level-5 :weight regular :inherit outline-5)
              ;'(org-level-6 :weight regular :inherit outline-6)
              ;'(org-level-7 :weight regular :inherit outline-7)
              ;'(org-level-8 :weight regular :inherit outline-8)
              ))

;; Default dired to hide details
(use-package dired
  :hook (dired-mode . dired-hide-details-mode))

;; h and l dired behaviors reusing buffer
(defun dired-up-alternate-file ()
  "In Dired, go up one directory, reusing the current buffer"
  (interactive)
  (find-alternate-file (file-name-directory (directory-file-name list-buffers-directory)))
)
(map! :after dired
      :map dired-mode-map
      :nv "-"
      'dired-up-alternate-file)
(map! :after dired
      :map dired-mode-map
      :nv "RET"
      'dired-find-alternate-file) 

(setq default-directory "/mnt/c/Users/brian/OneDrive/org")
(setq scroll-margin 4)

;;(after! evil-org
  ;;(remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))

(setq org-directory "/mnt/c/Users/brian/OneDrive/org")

(setq org-blank-before-new-entry nil)
(setq company-global-modes '(not org-mode))

;;ENG OF MY OWN CONFIG

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
