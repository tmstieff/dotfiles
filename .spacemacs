;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possiblesers/sign_in values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(shell-scripts
     erlang
     csv
     nginx
     elixir
     html
     (rust :variables rust-backend 'lsp)
     (python :variables python-backend 'lsp)
     markdown
     sql
     (javascript :variables javascript-backend 'lsp)
     (typescript :variables typescript-backend 'lsp)
     yaml
     themes-megapack
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     treemacs
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     restclient
     shell
     erc
     slack
     ;; sidebar
     syntax-checking
     lsp
     ;; lsp-intellij
     (java :variables java-backend 'lsp)
     ;; version-control
     docker
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(flycheck lsp-ui company-lsp ov frame-local sr-speedbar ob-typescript org-jira golden-ratio-scroll-screen rjsx-mode lsp-javascript-typescript lsp-python)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uniaspell-ennstalaspell-enl
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and naspell-enever uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(grandshell
                         monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-mode-line-theme 'vim-powerline
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq
   org-time-clocksum-format (quote
                             (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
   org-duration-format (quote h:mm))

  (add-hook 'typescript-mode 'lsp)
  (add-hook 'javascript-mode 'lsp)

  ;; Set the margin from the cursor
  (setq scroll-margin 10)

  (setq
   projectile-globally-ignored-directories
   '(
     "node_modules"
     ".gradle"
     "out"
     "build"
     ".idea"
     "deps"
     ".CLion2018.1"
     ".IntelliJIdea2017.3"
     ".IntelliJIdea2018.1"
     ".IntelliJIdea2018.2"
     ".cache"
     "deps"
     "_build"))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  (defun my-setup-indent (n)
    ;; java/c/c++
    (setq-local c-basic-offset (+ n 2))
    (setq-local c++-basic-offset (+ n 2))
    (setq-local java-basic-offset (+ n 2))
    (setq-local java-basic-offset (+ n 2))
    (setq-local sql-basic-offset (+ n 2))
    ;; web development
    (setq-local coffee-tab-width n) ; coffeescript
    (setq-local javascript-indent-level n) ; javascript-mode
    (setq-local js-indent-level n) ; js-mode
    (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
    (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
    (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
    (setq-local css-indent-offset n) ; css-mode
    (setq-local typescript-indent-level n))

  (defun my-code-style ()
    (interactive)
    (message "Code Style Setup")
    ;; use space instead of tab
    (setq indent-tabs-mode nil)
    ;; indent 2 spaces width
    (my-setup-indent 2))

  (my-code-style)

  (defun ts-js-import-star ()
    (interactive)
    (let ((cursor (mark-marker))
          (alias (read-from-minibuffer "Alias: "))
          (lib (read-from-minibuffer "Library name: ")))
      (goto-char (point-min))
      (insert "import * as " alias " from '" lib "';")
      (newline-and-indent)
      (goto-char cursor)))

  (defun ts-new-org-todo-bullet ()
    (interactive)
    (let ((todo-name (read-from-minibuffer "New TODO: ")))
      (newline)
      (beginning-of-line)
      (insert (concat "** TODO " todo-name))
      (newline-and-indent)
      (insert "- [ ] ")
    ))

  ;(defun ts-start-reminder-timer ()
  ;  (interactive)
  ;  (run-with-timer 2 (* 60 60 2)  #'ts-remind))

  (defun ts-remind ()
    (shell-command (concat "notify-send 'Update org-mode TODOs" (concat "") "'")))

  (defun ts-list-hhr-todos ()
    (with-temp-buffer
      (insert-file-contents "/home/taylor/Dropbox/org/hhr-tasks.org")
      (buffer-string)
      (mapcar (message) (split-string (buffer-string) "\n" t))
      ))

  (add-to-list 'load-path "~/.local/share/icons-in-terminal/")
  (add-hook 'after-init-hook #'global-emojify-mode)

  (setq org-agenda-files '("~/Dropbox/org"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (js . t)
     (sql . t)
     (typescript . t)
     (python . t)
     (http . t))
   )

  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)


  ;; Restore buffers and layouts
  ;; (desktop-save-mode 1)

  (setq projectile-indexing-method 'native)

  (setq ac-clang-flags
        (mapcar (lambda (item)(concat "-I" item))
                (split-string
                 "
                 /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/../../../../include/c++/7.3.1
                 /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/../../../../include/c++/7.3.1/x86_64-pc-linux-gnu
                 /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/../../../../include/c++/7.3.1/backward
                 /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/include
                 /usr/local/include
                 /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/include-fixed
                 /usr/include"
                 )))

  (setq gc-cons-threshold most-positive-fixnum)
  (run-with-idle-timer 2 t (lambda () (garbage-collect)))

  ;; (setq jiralib-url "http://jira.heavenhr.de/")

  (defun my-keymap-setup ()
    (interactive)
    (message "Keymap Setup")
    (global-set-key (kbd "M-h") 'previous-buffer)
    (global-set-key (kbd "M-l") 'next-buffer)
    (global-set-key (kbd "<C-tab>") 'mode-line-other-buffer)
    (global-set-key (kbd "C-w") 'kill-buffer)

    (evil-leader/set-key  "]" 'spacemacs/jump-to-definition)

    (spacemacs/set-leader-keys "jn" 'evil-jump-forward)
    (spacemacs/set-leader-keys "jp" 'evil-jump-backward)

    (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
    (define-key evil-motion-state-map (kbd "L") 'end-of-line)
    (define-key evil-motion-state-map (kbd "H") 'beginning-of-line)

    (define-key evil-normal-state-map "J" 'golden-ratio-scroll-screen-up)
    (define-key evil-normal-state-map "K" 'golden-ratio-scroll-screen-down))

  (my-keymap-setup)

  (setq lsp-java-vmargs '("-javaagent:/home/taylor/.m2/repository/org/projectlombok/lombok/1.16.20/lombok-1.16.20.jar" "-Xbootclasspath/a:/home/taylor/.m2/repository/org/projectlombok/lombok/1.16.20/lombok-1.16.20.jar"))

  ;; (define-key evil-treemacs-state-map "J" 'golden-ratio-scroll-screen-up)
  ;; (define-key evil-treemacs-state-map "K" 'golden-ratio-scroll-screen-down)

  (setq racer-rust-src-path "/home/taylor/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
  )
  '(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-hide-list (quote ("JOIN" "KICK" "PART" "QUIT" "MODE")))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (gnus-desktop-notify hackernews web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data toml-mode racer flycheck-rust cargo rust-mode request-deferred yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic stumpwm-mode company-restclient restclient-helm restclient emojify-logos circe slack dired-sidebar dash dash-functional s ov zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme threes 2048-game mmm-mode markdown-toc markdown-mode gh-md company-go sql-indent org-mime helm-company helm-c-yasnippet fuzzy company-tern dash-functional company-statistics company auto-yasnippet ac-ispell auto-complete web-beautify tern livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode tide typescript-mode unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor auto-dictionary yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async editorconfig edbi))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 )


;; do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clean-aindent-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(indent-guide-delay 0.3 t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (insert-shebang flycheck-bashate fish-mode company-shell helm-gtags ggtags erlang counsel-gtags md4rd lsp-javascript-flow writeroom-mode visual-fill-column helm-org-rifle cquery ccls dockerfile-mode docker tablist docker-tramp zenburn-theme yasnippet-snippets winum web-mode treemacs-projectile treemacs-evil treemacs toc-org tide tao-theme sql-indent solarized-theme slack rjsx-mode racer pyvenv pip-requirements paradox orgit org-mime org-jira org-brain mwim lsp-ui lsp-python lsp-javascript-typescript typescript-mode lsp-java live-py-mode kaolin-themes inkpot-theme hl-todo highlight-numbers highlight-indentation helm-make gruvbox-theme google-translate git-timemachine git-link evil-surround evil-nerd-commenter evil-matchit evil-magit evil-goggles espresso-theme emojify editorconfig dumb-jump doom-themes doom-modeline eldoc-eval darktooth-theme darkokai-theme counsel-projectile counsel swiper ivy company-lsp lsp-mode ht company-anaconda color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cargo rust-mode auto-yasnippet auto-compile apropospriate-theme anaconda-mode alect-themes aggressive-indent ace-window ace-link tern iedit smartparens request rtags avy magit magit-popup git-commit with-editor markdown-mode flycheck company yasnippet alert projectile helm helm-core spaceline which-key use-package hydra evil goto-chg async org-plus-contrib zen-and-art-theme yapfify yaml-mode xterm-color ws-butler white-sand-theme websocket web-beautify volatile-highlights vi-tilde-fringe uuidgen unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treepy toxi-theme toml-mode tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection sr-speedbar spinner spaceline-all-the-icons spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shrink-path shell-pop seti-theme scss-mode sass-mode reverse-theme restclient-helm restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js powerline popwin planet-theme pippel pipenv phoenix-dark-pink-theme phoenix-dark-mono-theme pfuture persp-mode pcre2el password-generator parent-mode packed overseer ov organic-green-theme org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-typescript ob-restclient ob-http ob-elixir oauth2 noctilux-theme nginx-mode naquadah-theme nameless mvn mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme meghanada maven-test-mode material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum log4e livid-mode link-hint light-soap-theme json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme indent-guide importmagic impatient-mode hungry-delete highlight-parentheses heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruber-darker-theme groovy-mode groovy-imports graphql grandshell-theme gradle-mode gotham-theme google-c-style golden-ratio-scroll-screen golden-ratio gnuplot gntp gitignore-templates gitconfig-mode gitattributes-mode git-messenger gh-md gandalf-theme fuzzy frame-local font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-mix flycheck-credo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-org evil-numbers evil-mc evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks ensime emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dracula-theme dotenv-mode django-theme disaster diminish define-word darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics company-rtags company-restclient company-emoji company-emacs-eclim company-c-headers column-enforce-mode clues-theme clean-aindent-mode clang-format circe cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-key badwolf-theme autothemer auto-highlight-symbol anti-zenburn-theme ample-zen-theme ample-theme alchemist afternoon-theme ace-jump-helm-line ac-ispell)))
 '(python-indent-guess-indent-offset nil)
 '(tab-always-indent (quote complete))
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)

