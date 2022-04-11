#lang racket/base

; (module+ test
;   (require rackunit))

(require racket/cmdline
         racket/port)

(define localhost-port (box 8080))
(define fs-dir (box "."))

(require net/sendurl)
(define (open-browser)
  (send-url (format "http://localhost:~a" (unbox localhost-port))))

(command-line #:program "serve-fs"
              #:once-each ; Each independent, but specified at most once.
              [("--port" "-p") port "Specify port number" (set-box! localhost-port port)]
              [("--dir" "-d") dir "Specify directory to serve" (set-box! fs-dir dir)]
              [("--open" "-o")
               "Open one file in a browser, leaving the program running in terminal"
               (open-browser)]
              ; #:args ()
              ; (printf "dir ~a~n" (unbox fs-dir))
              ; (printf "port: ~a~n" (unbox localhost-port))
              )

; (module+ test
;   ;; Any code in this `test` submodule runs when this file is run using DrRacket
;   ;; or with `raco test`. The code here does not run when this file is
;   ;; required by another module.
;   (check-equal? 12 12)
;   )

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29
  )
