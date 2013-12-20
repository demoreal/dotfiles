;;;; .Emacs -------> Emacs configuration file
;;;; Much of the file is code I found interesting and
;;;; pasted in file. Need to test code and clean unnesecary options
;;;; TEST ---> forgot what it did but is must have worked
;;;;           need to experement with options
;;;; Outline:
;;;;
;;;;   1) General Apperence
;;;;   2) Key Mappings
;;;;   3) Org Mode
;;;;

;;;; General
;; set default font
;; set before loading org-mode agenda
(set-face-attribute 'default nil 
                    :family "Terminus" 
                    :foundry "xos4" 
                    :foreground "gray55"
                    :height 90)
;; Messages and Initial startup
(setq inhibit-startup-message t)
(setq-default  initial-scratch-message "")        
(setq inhibit-splash-screen t)
;; Disable echo help message
(eval-after-load "startup"  
  '(fset 'display-startup-echo-area-message 
         (lambda ())))
;; Maximize screen real estate
(setq-default mode-line-format nil)              
(menu-bar-mode -1)  
(tool-bar-mode -1)  
(scroll-bar-mode -1)
(set-fringe-mode 0)
;; Split window border
(set-face-foreground 'vertical-border "Black")
(set-face-background 'vertical-border "Black")
;; Split window behaviour
(setq split-width-threshold nil)      ; for vertical split
(setq split-width-threshold 1)        ; for horizontal split
;; ForeGround and background color
(set-foreground-color "gray")         ; set in .Xdefaults  ---> not working
(set-background-color "#000000")      ; set in .Xdefaults  ans: ?set-face?
;; new frame foreground and background color
(setq default-frame-alist
      (append default-frame-alist
              '((foreground-color . "White")
                (background-color . "Black")
                (cursor-color . "DeepPink"))))

;; Alist of parameters for initial minibuffer frame
;(setq minibuffer-frame-alist
;      '((top . 1) (left . 1) (width . 80) (height . 2)))

;; ;; does not work well on my setup 
;; (setq default-minibuffer-frame
;;       (make-frame
;;        '((name . "minibuffer")
;;          (width . 0)
;;          (height . 0)
;;          (minibuffer . only)
;;          (top . 0)
;;          (left . 0)
;;          )))
;; (setq new-frame
;;       (make-frame
;;        '((name . "editor")
;;          (width . 80)
;;          (height . 30)
;;          (minibuffer . nil)
;;          (top . 50)
;;          (left . 0)
;;          )))
;; set before loading org-mode agenda

;; Worked
(setq initial-frame-alist (append '((minibuffer . nil)) initial-frame-alist))
(setq default-frame-alist (append '((minibuffer . nil)) default-frame-alist))
(setq minibuffer-exit-hook '(lambda () (lower-frame)))
; TODO (setq minibuffer-auto-raise t)


;; Point
(blink-cursor-mode -1)                     
;(cursor-in-non-selected-windows nil)

;; ;; 80 column rule
;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t)
;; (add-hook 'font-lock-mode-hook
;;           (function
;;            (lambda ()
;;              (setq font-lock-keywords
;;                    (append font-lock-keywords
;;                            '(("\t+" (0 'my-tab-face t))
;;                              ("^.\\{81,\\}$" (0 'my-long-line-face t))
;;                              ("[ \t]+$"      (0 'my-trailing-space-face t))))))))
;;
;; (add-hook 'font-lock-mode-hook
;;           (function
;;            (lambda ()
;;              (setq font-lock-keywords
;;                    (append font-lock-keywords
;;                             '(("\t+" (0 'my-tab-face t))))))))

;;;; Minimal Experiments
;;; Minimal mode
;; (defun toggle-minimal-mode (fs)
;;   (interactive "P")
;;   (defun fullscreen-margins nil
;;     (if (and (window-full-width-p) (not (minibufferp)))
;; 	(set-window-margins nil (/ (- (frame-width) 120) 2) (/ (- (frame-width) 120) 2))
;;       (mapcar (lambda (window) (set-window-margins window nil nil)) (window-list))))
;;   (cond (menu-bar-mode
;; 	 (menu-bar-mode -1) (tool-bar-mode -1) (scroll-bar-mode -1)
;; 	 (set-frame-height nil (+ (frame-height) 4))
;; 	 (if fs (progn (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 					      '(1 "_NET_WM_STATE_FULLSCREEN" 0))
;; 		       (add-hook 'window-configuration-change-hook 'fullscreen-margins))))
;; 	(t (menu-bar-mode 1) (tool-bar-mode 1) (scroll-bar-mode 1)
;; 	   (when (frame-parameter nil 'fullscreen)
;; 	     (remove-hook 'window-configuration-change-hook 'fullscreen-margins)
;; 	     (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 				    '(0 "_NET_WM_STATE_FULLSCREEN" 0))
;; 	     (set-window-buffer (selected-window) (current-buffer)))
;; 	   (set-frame-width nil (assoc-default 'width default-frame-alist)))))
;; ;(global-set-key [f7] 'toggle-minimal-mode)

;; ;; term settings
;; (setq term-default-fg-color "purple")
;; (setq term-default-bg-color "#211E1E")

;; creating backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; formating defaults
(setq standard-indent 2)               ; set indent to 2 instead of standard 4
(setq-default indent-tabs-mode nil)    ; space instead of tabs ?

;;truncate lines ---> get rid of $ and \
(set-default 'truncate-lines t)
(set-display-table-slot standard-display-table 0 ?\ )
  
;; ;; Mode Line experimaents 
;; (line-number-mode 1)
;; (column-number-mode 1)

;;;; Key mappings
(global-set-key (kbd "C-s-p") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "C-s-n") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-b") 'windmove-left) 
(global-set-key (kbd "s-f") 'windmove-right) 
(global-set-key (kbd "s-p") 'windmove-up) 
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-=") 'emms-volume-raise)
(global-set-key (kbd "s--") 'emms-volume-lower)
(global-set-key (kbd "M-=") 'emms-volume-raise)
(global-set-key (kbd "M--") 'emms-volume-lower)
;;; for console ------> In console my windows key is mapped to Meta
(global-set-key (kbd "M-p") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "M-n") (lambda () (interactive) (scroll-down 1)))
;;; want to find a way to do this one step at a time posible idea
(global-set-key (kbd "C-<down>") 'scroll-other-window)
(global-set-key (kbd "C-<up>") 'scroll-other-window-down)
(global-set-key (kbd "s-c") 'shell) ;execute shell
;(global-set-key (kbd "M-c") 'shell) ;steals capitalize command
(global-set-key (kbd "s-s") 'split-window-below) 
(global-set-key (kbd "s-S") 'split-window-right)
(global-set-key (kbd "s-{") 'shrink-window-horizontally)
(global-set-key (kbd "s-}") 'enlarge-window-horizontally)
(global-set-key (kbd "s-[") 'shrink-window)
(global-set-key (kbd "s-]") 'enlarge-window)
(global-set-key (kbd "s-h") 'hl-line-mode)
(global-set-key (kbd "C-<right>") 'next-buffer)
(global-set-key (kbd "C-<left>") 'previous-buffer)
(global-set-key (kbd "<f6>") 'previous-buffer)
(global-set-key (kbd "<f9>") 'next-buffer)
(global-set-key (kbd "s-SPC") 'next-buffer)
(global-set-key (kbd "S-s-SPC") 'previous-buffer)
(global-set-key (kbd "s-<backspace>") 'previous-buffer)


;;; Buffer Management
;;; Swap buffers with C-x /
;;; http://stackoverflow.com/questions
;;; /1510091/with-emacs-how-do-you-swap-the-position-of-2-windows
(defun swap-buffer ()
  (interactive)
  (cond ((one-window-p) (display-buffer (other-buffer)))
        ((let* ((buffer-a (current-buffer))
                (window-b (cadr (window-list)))
                (buffer-b (window-buffer window-b)))
           (set-window-buffer window-b buffer-a)
           (switch-to-buffer buffer-b)
           (other-window 1)))))
(global-set-key (kbd"s-,") 'swap-buffer)      ; Enabled Globaly
;; same thing different code ---------------> ; study code
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "C-x /") 'swap-buffer)   ; Enabled Globaly
;; switch buffers between frames
(defun switch-buffers-between-frames ()
  "switch-buffers-between-frames switches the buffers between the two last frames"
  (interactive)
  (let ((this-frame-buffer nil)
	(other-frame-buffer nil))
    (setq this-frame-buffer (car (frame-parameter nil 'buffer-list)))
    (other-frame 1)
    (setq other-frame-buffer (car (frame-parameter nil 'buffer-list)))
    (switch-to-buffer this-frame-buffer)
    (other-frame 1)
    (switch-to-buffer other-frame-buffer)))
(global-set-key (kbd "s-/") 'switch-buffers-between-frames)
;; rename file and buffer
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; prevents widows from loosing place when pressing esc 3 times
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

;;;; ORG MODE
;
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; (require 'org-drill) did not work
;
;;; todo keyword sequences
(setq org-todo-keywords
      '(        
        ;;todo keyword sequences
        (sequence "TODO"
                  "NEXT"
                  "DONE")
        ;;the undetermined state 
        (sequence "NOTE"
                  "WAIT")         ; TODO ---> HOLD
        ;;After Undeternined  State
        (sequence "REDO"          ; place redo date
                  "LATE"          ; missed deadline
                  "DONE")         ; Goal state
        ;;create a state for acurrate effort 
        (sequence "NOT-STARTED"
                  "IN-PROGRESS")
        ;;this is where you want to be
        (sequence "!!WAITING!!" "|"
                  "!COMPLETED!" "!CANCELLED!")
        ;;not completed but need to Review
        (sequence "!PAST--DUE!"
                  "!REVIEWING!")
        ;;proofs,lemmas,def
        (sequence "DEF"
                  "THM"
                  "COR"
                  "LEMMA"
                  "Proof"
                  "EXP")))

;;; define faces of keywords
(setq org-todo-keyword-faces
      '(
        ;; TODO --> NEXT --> DONE 
        ("TODO".(:foreground "yellow1" :background "red4"
                             :weight bold))
        ("NEXT".(:foreground "magenta" :background "gray25"        ; inversevideo "true"
                             :weight thin))
        ("DONE".(:foreground "yellow" :background "blue"
                             :weight bold))
        ;; REDO --> LATE --> DONE 
        ("REDO". (:foreground "magenta" :background "gray25"
                              :weight thin))
        ("LATE". (:foreground "yellow" :background "blue"
                              :weight thin))
        ;; NOTE --> WAIT 
        ("NOTE". (:foreground "yellow" :background "red"
                              :weight bold))
        ("WAIT". (:foreground "black" :background "magenta"
                              :weight thin))
        ;; usually used for heading in a way to keep agenda clean
        ("NOT-STARTED". (:foreground "yellow" :background "magenta"
                                     :weight bold))
        ("IN-PROGRESS". (:foreground "yellow1" :background "red4"
                                     :weight bold))
        ;; Almost Done with Project
        ("!!WAITING!!". (:foreground "black" :background "white"
                                     :weight thin))
        ("!COMPLETED!". (:foreground "black" :background "cyan"
                                     :weight thin))
        ("!CANCELLED!". (:foreground "black" :background "cyan"
                                     :weight thin))
        ;; At some point you may wish to Review the things you skipped
        ("!PAST--DUE!". (:foreground "yellow" :background "blue"
                                     :weight bold))
        ("!REVIEWING!". (:foreground "yellow" :background "blue"
                                     :weight bold ))
        ;; still experimental --> idea for agenda views
        ("LEMMA". (:foreground "magenta" :background "black"
                               :weight bold))
        ("Proof". (:foreground "magenta" :background "blue"
                               :weight bold))
        ("DEF".  (:foreground "black" :background "orange"
                               :weight bold))
        ("THM".  (:foreground "black" :background "orange"
                               :weight thin))
        ("EXP".  (:foreground "black" :background "orange"
                               :weight thin))
        ("COR".  (:foreground "black" :background "orange"
                               :weight thin))))

(setq org-priority-faces
      '(
        (?A.(:foreground "white" :background "red4" :weight bold ))
        (?B.(:foreground "gold2" :background "gray25"))
        (?C.(:foreground "magenta" :background "gray25"))))

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/refile.org")
(setq org-columns-default-format "%26TIMESTAMP(        TIME STAMP)
                                  %22ITEM(           TASK)
                                  %5Effort( EST){:}
                                  %5CLOCKSUM
                                  %11TODO( TODO STATE)
                                  %1PRIORITY
                                  %15SCHEDULED(    SCHEDULED) 
                                  %15DEADLINE(   DEADLINE) 
                                  %20CLOSED(       CLOSED)
                                  %11Status(  STATUS)
                                  %3Approved(APR)")

(setq org-agenda-columns-add-appointments-to-effort-sum t)
(setq org-agenda-files (quote ("~/math/185/review/Definitions.org"
                               "~/math/185/review/Notes.org"
                               "~/math/185/review/Theorems.org"
                               "~/math/185/review/Final.org"
                               "~/math/185/185.org"
                               "~/org/refile.org"
                               "~/org/tasks.org" 
                               "~/org/linux.org")))

;;;; (setq org-global-properties nil) what is this ?

;;; org capture  --------------------------> taken from webpage (bookmarked)
(global-set-key (kbd "C-c c") 'org-capture)
;;; Capture templates for:
;;; TODO tasks, Notes, appointments, 
;;; phone calls, meetings, and org-protocol
;;; guitar, hacking
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/refile.org")
               "* TODO %?\n%U\n%a\n"
               :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/org/refile.org")
               "* next respond to %:from on %:subject\nscheduled: %t\n%u\n%a\n"
              :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/org/refile.org")
               "* %? :note:\n%U\n%a\n"
               :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("g" "Guitar" entry (file "~/org/refile.org")
               "* GUITAR %? :GUITAR:\n%U" :clock-in t :clock-resume t)
              ("H" "HACKING" entry (file "~/org/refile.org")
               "* HACKING %? :HACKING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string\"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;;; Category property function
;; to set up icons ----------> org-agenda-category-icon-alist variable
(defun set-category ()
                (interactive "P")
                (let* ((marker (or (org-get-at-bol 'org-hd-marker)
                                   (org-agenda-error)))
                       (buffer (marker-buffer marker)))
                  (with-current-buffer buffer
                    (save-excursion
                      (save-restriction
                        (widen)
                        (goto-char marker)
                        (org-back-to-heading t)
                        (org-set-property "CATEGORY" "Prove"))))))

;;; taken from custom-set-variables
;;; test to slowly learn and rid my system of auto stuff
(setq org-scheduled-past-days 1000) ; first test

;;; Latex export
;
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

;; standard export to a LaTeX book Class
(add-to-list 'org-export-latex-classes
             '("book"
               "\\documentclass{book}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;; ;; article class
;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")))

;;; Diary Mode Settings
(setq diary-file "~/.diary")
(setq org-agenda-include-diary t)
;;(setq view-diary-entries-initially t
;;      mark-diary-entries-in-calendar t
;;      number-of-diary-entries 7)
;(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;;; GNUPLOT
;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode 
;; (global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------

;;;; GNUS MAIL
;                                                                       ______
;                                                            \_______/  |GNUS|
(setq gnus-select-method                                  ;  | -   - |  |----|
      '(nnimap "gmail"                                    ;  |   P   |  |MAIL|
                      (nnimap-address "imap.gmail.com")   ;  |-------|  |----|
                             (nnimap-server-port 993)     ;   /     \ ---/
                                    (nnimap-stream ssl))) ;   |_     \_
                                                          ;^^^^^^^^^^^^^^
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587
                                   "dpgruen@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;;; Unicode tests ---> TODO test a bit more
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

; * CLEAN ME ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;auto save ----> supposet to help smooth scrolling
;(setq auto-save-interval 1000)   ; unsure of results

;;scrolling options
;(setq scroll-step 1)       ; not sure why this is commented out ???

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(defun set-my-frame-options ()
;"Set frame color so I can distinguish between two sessions."
;(interactive)
;(setq my-bgcolor "DarkBlue")
;(setq default-frame-alist
; For a reason I do not understand, Lisp fusses about the parameter
; type in background-color below if I substitute (unquoted) my-bgcolor.
;(append default-frame-alist
;'((background-color . "DarkBlue"))))
;(set-background-color my-bgcolor))
;(global-set-key [f10] 'set-my-frame-options)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;No Backup Files
;;(setq make-backup-files nil)

;;pasting to other programs 
(setq x-select-enable-clipboard t)    ; ???

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ------------------------------------------------------------- ;
;;(setq mode-line-in-non-selected-windows nil) this did nothing ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                            ;;;                    ; ;
;;; *  still experimental      ;;;                    ; ;
;;;                            ;;;                    ; ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;              ,     ; ;
;                                ;   ?^^^^^^?  `@'    ; ;
;   ** emms ----> `multimedia'   ;   | 0  0 |  `|`    ; ;
;                                ;   |  __  |   |     ; ;
(require 'emms-setup)            ;   \      / ----    ; ;
(emms-standard)                  ;    \----/   /      ; ;
(emms-default-players)           ;     |  |  /        ; ;
;                                ;    |    |          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                      ;;
;   *** set global emms keys                           ;;
;                                                      ;;
;(global-set-key (kbd "C-c e <up>") 'emms-start)       ;;
;(global-set-key (kbd "C-c e <down>") 'emms-stop)      ;;
;(global-set-key (kbd "C-c e <left>") 'emms-previous)  ;;
;(global-set-key (kbd "C-c e <right>") 'emms-next)     ;;
;                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; *** Still experimenting
;;
;(setq emms-mode-line-icon-before-format "["
;      emms-mode-line-format " %s]"
;      emms-mode-line-icon-color "red")
;(require 'emms-info-libtag)
;(require 'emms-player-mpg321-remote)
;(require 'emms-mode-line-icon)
(require 'emms-playlist-mode)
(emms-devel)
;(emms-default-players)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)
(setq emms-source-file-default-directory "~/.emacs.d/playlists/")
;(setq
; emms-info-asynchronously t
; later-do-interval 0.0001
; emms-source-file-default-directory "~/.emacs.d/playlists/"
; emms-show-format "NP: %s")

;(global-set-key (kbd "<kp-subtract>") 'emms-previous)
;(global-set-key (kbd "<kp-add>") 'emms-next)
;(global-set-key (kbd "<kp-multiply>") 'emms-random)
;; global key-map
;; all global keys prefix is C-c e
;; compatible with emms-playlist mode keybindings
;; you can view emms-playlist-mode.el to get details about
;; emms-playlist mode keys map
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e P") 'emms-pause)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)
;; temporary experiments
(global-set-key (kbd "M-+") 'emms-seek-forward)
(global-set-key (kbd "M-_") 'emms-seek-backward)
(global-set-key (kbd "s-+") 'emms-seek-forward)
(global-set-key (kbd "s-_") 'emms-seek-backward)
;
;; these keys maps were derivations of above keybindings
(global-set-key (kbd "C-c e S") 'emms-start)
(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e l") 'emms-play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;             ;;;                                                            ;
;;; * emacs-w3m ;;;                                                            ;
;;;             ;;;                                                            ;
;(setq browser-url-browser-function 'w3m-browser-url)                          ;
;(autoload 'w3m-browser-url "w3m" "Ask a WWW browser to show a URL " t)        ;
;;                                                                             ;
;(eval-when-compile                                                            ;
;  (autoload 'browse-url-interative-org "browse-url"))                         ;
;                                                                              ;
; ** the following fixed it for some:                                          ;
;                                                                              ;
;(autoload 'browse-url-interactive-arg "browse-url")                           ;
;                                                                              ;
; ** did not work trying code:                                                 ;
;                                                                              ;
;(require 'w3m-e21)                                                            ;
;(provide 'w3m-e23)                                                            ;
;                                                                              ;
; ** FAIL From arch site 2008                                                  ;
;                                                                              ;
;(require 'w3m-load)                                                           ;
;(require 'meme-w3m)                                                           ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; OCTAVE MODE
;
;(autoload 'run-octave "octave-inf" nil t)
;(add-hook 'inferior-octave-mode-hook                         /\--------------\
;               (lambda ()                                 __/  \--------------|
;                 (turn-on-font-lock)                            | OCTAVE TODO |
;                 (define-key inferior-octave-mode-map [up]      |-------------|
;                   'comint-previous-input)                       Custom-Clean
;                 (define-key inferior-octave-mode-map [down]
;                   'comint-next-input)))
;;Rename buffer function, looks good for later
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;;octave mode
(autoload 'octave-mode "octave-mod" nil t)
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;(defcustom inferior-octave-startup-args (\"q\" \"--traditional\"))
;  "List of command line arguments for the inferior Octave process.
;For example, for suppressing the startup message and using `traditional'
;mode, set this to (\"-q\" \"--traditional\")."
;  :type '(repeat string)
;  :group 'octave-inferior)
;(global-set-key (kbd "C-c C-i C-l") figure out insert line function names TODO

;;; lilypnond-mode
(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
(put 'upcase-region 'disabled nil)

;;;Unicode miscalanius
;(setq locale-coding-system 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)
;(prefer-coding-system 'utf-8)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                                                                 !!!!!!!!!!!
;;;;                                                                 !TEST AREA!
;;;;                                                                 !!!!!!!!!!!
;;;; TESTING LOCATION - stolen code for modification ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq visible-cursor 1)                             ; Current options
;(blink-cursor-mode (- (*) (*) (*)))                 ;
;;color of cursor in text mode                       ;      /-----//
;(send-string-to-terminal '\e[?17;14;224c)           ;     /     //
;;(setq term-file-prefix nil)                        ;    /----|//
                                                     ;   / _ _ |/
;(setq-default visible-cursor nil)                   ;   |  -  /
;(setq cursor-in-non-selected-windows 0)             ;   |----/
;;(setq cursor-type nil)                   |----->   ;   -----> experiment  WAIT
                                          ;|                    --\-------------
;;;TEST attempt to change strike through --|                       \
;(require 'cl)   ; for delete*                                      \
;(setq org-emphasis-alist                                            |
;      (cons '("+" '(:strike-through t :foreground "gray"))          |
;          (delete* "+" org-emphasis-alist :key 'car :test 'equal))) |
;---\----------------------------------------------------\-----------|
;    \                                                    \
;     \                                                    \
;      \                                                    \
;       \----------------------------------------------------\
;        ;                                                   ;
;        ; * SCROLLING                         @->--         ;
;        ;                                                   ;
;        ;   ;; online test -----------------------          ;
;        ;   (setq scroll-margin 1                           ;
;        ;      scroll-conservatively 0                      ;
;        ;      scroll-up-aggressevely 0.01                  ;
;        ;      scroll-down-aggressively 0.01)               ;
;        ;   ;; end test --------------------------          ;
;        ;                                                   ;
;        ;    ==========================================     ;
;        ;   (setq scroll-step             1                 ;
;        ;   (setq      scroll-conservatively   10000)       ;
;        ;   (setq auto-window-vscroll nil)                  ;
;        ;   scroll other window binding                     ;
;        ;    the above is my current configuration ====     ;
;        ;                                                   ;
;        ;                                                   ;
;        ;   ;;;;;;;TEST ONLINE SCROLL ONE LINE;;;; TEST     ;
;        ;   (defun scroll-other-window-up ()                ;
;        ;     "Scroll the other window one line up."        ;
;\       ;     (interactive)                                 ;
; \      ;     (scroll-other-window -1)                      ;
;  \     ;      )                                            ;
;   \    ;   (defun scroll-other-window-down ()              ;
;    \   ;     "Scroll the other window one line down."      ;
;     \  ;     (interactive)                                 ;
;      \ ;     (scroll-other-window 1)                       ;
;       \;   )                                               ;
;        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; * Custom-set-variables
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode nil)
 '(blink-cursor-mode nil)
 '(cursor-in-non-selected-windows nil)
 '(diary-header-line-flag nil)
 '(diary-show-holidays-flag nil)
 '(echo-keystrokes 0)
 '(emms-mode-line-mode-line-function nil)
 '(help-enable-auto-load t)
 '(hscroll-margin 0)
 '(hscroll-step 1)
 '(inferior-octave-startup-args (quote ("-q" "--traditional")))
 '(minibuffer-auto-raise nil)
 '(org-agenda-columns-add-appointments-to-effort-sum t)
 '(org-agenda-current-time-string #("- - - - - - - - - - - - - - - - - - - - - - - - - - - ->" 0 48 (org-heading t) 48 54 (org-heading t) 54 56 (org-heading t)))
 '(org-agenda-include-diary t)
 '(org-agenda-inhibit-startup nil)
 '(org-agenda-insert-diary-extract-time t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown (quote not-today))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-with-clockreport-mode t)
 '(org-agenda-time-grid (quote ((daily weekly today remove-match) #("----------------------------" 0 28 (org-heading t)) (800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400))))
 '(org-agenda-time-leading-zero t)
 '(org-agenda-window-setup (quote current-window))
 '(org-clock-into-drawer 2)
 '(org-columns-ellipses "")
 '(org-deadline-warning-days 7)
 '(org-format-latex-options (quote (:foreground default :background default :scale 1.3 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-hide-emphasis-markers t)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 '(org-show-entry-below (quote ((agenda . t) (default))))
 '(org-src-fontify-natively t)
 '(pop-up-windows nil)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1000)
 '(scroll-down-aggressively 0.0)
 '(scroll-preserve-screen-position 100)
 '(scroll-up-aggressively 0.0)
 '(x-gtk-file-dialog-help-text nil))
;; Console font lock face 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:background "white" :foreground "black"))))
 '(bold-italic ((t (:foreground "magenta"))))
 '(calendar-today ((t (:background "red" :foreground "white"))))
 '(custom-group-tag ((t (:inherit default :foreground "light blue"))))
 '(diary ((t (:foreground "cyan"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :foreground "RoyalBlue4"))))
 '(emms-playlist-selected-face ((t (:background "chartreuse"))))
 '(emms-playlist-track-face ((t (:background "magenta" :foreground "black" :inverse-video t :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "blue"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "chocolate"))))
 '(font-lock-comment-face ((t (:foreground "dark red"))))
 '(font-lock-function-name-face ((t (:foreground "cyan"))))
 '(font-lock-keyword-face ((t (:foreground "chartreuse" :weight ultra-bold))))
 '(font-lock-string-face ((t (:foreground "dark magenta" :weight ultra-bold))))
 '(header-line ((t (:inherit mode-line :foreground "grey90"))))
 '(highlight ((t (:foreground "yellow1" :weight bold))))
 '(hl-line ((t (:foreground "green" :weight ultra-bold))))
 '(italic ((t (:foreground "yellow"))))
 '(mode-line ((t (:foreground "black" :family "Terminus"))))
 '(mode-line-inactive ((t (:inherit mode-line :foreground "black" :family "Terminus"))))
 '(org-agenda-calendar-event ((t (:foreground "orange"))))
 '(org-agenda-current-time ((t (:inherit org-time-grid :foreground "blue" :weight thin))) t)
 '(org-agenda-date ((t (:foreground "blue" :weight ultra-bold))) t)
 '(org-agenda-date-today ((t (:inherit org-agenda-date :foreground "blue" :slant normal :weight thin))) t)
 '(org-agenda-done ((t (:foreground "green" :weight ultra-bold))))
 '(org-column ((t (:inverse-video t :height 90 :family "Terminus"))))
 '(org-column-title ((t (:background "red" :weight bold :foreground "yellow"))))
 '(org-date ((t (:foreground "magenta" :weight thin :family "Terminus"))))
 '(org-footnote ((t (:background "gainsboro" :foreground "maroon" :underline nil))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "royal blue" :weight ultra-bold))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "light salmon" :weight ultra-bold))))
 '(org-level-3 ((t (:inherit outline-3 :background "deep sky blue" :foreground "black" :inverse-video t :weight thin))))
 '(org-level-4 ((t (:inherit outline-4 :background "black" :foreground "deep pink"))))
 '(org-level-5 ((t (:inherit outline-5 :foreground "lawn green"))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "red"))))
 '(org-level-7 ((t (:inherit outline-7 :foreground "goldenrod" :weight thin))))
 '(org-scheduled ((t (:background "black" :foreground "green" :weight thin))))
 '(org-scheduled-previously ((t (:foreground "red" :weight thin))))
 '(org-scheduled-today ((t (:foreground "dark violet"))))
 '(org-table ((t (:inverse-video t))))
 '(org-time-grid ((t (:foreground "yellow" :weight ultra-bold))))
 '(org-todo ((t (:foreground "red" :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "red"))))
 '(org-verbatim ((t (:foreground "green"))))
 '(org-warning ((t (:inherit nil :background "red" :foreground "black"))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :foreground "orange"))))
 '(underline ((t (:background "red" :foreground "white"))))
 '(warning ((t (:foreground "red" :weight bold)))))

