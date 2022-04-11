#lang racket/base

; (module+ test
;   (require rackunit))

(require racket/cmdline
         racket/port)
(require "private/servlet.rkt")

(define localhost-port (box 5454))
(define fs-dir (box "."))
(define command-line-mode (box #f))

(command-line #:program "serve-fs"
              #:once-each ; Each independent, but specified at most once.
              [("--port" "-p") port "Specify port number" (set-box! localhost-port port)]
              [("--dir" "-d") dir "Specify directory to serve" (set-box! fs-dir dir)]
              [("--headless" "-s") "Do not open a browser" (set-box! command-line-mode #t)]
              #:args ()
              (start-servlet
               (hash 'port (unbox localhost-port) 'dir (unbox fs-dir) 'headless (unbox command-line-mode))))

; (module+ test
;   ;; Any code in this `test` submodule runs when this file is run using DrRacket
;   ;; or with `raco test`. The code here does not run when this file is
;   ;; required by another module.
;   (check-equal? 12 12)
;   )

; (module+ main
;   ;; (Optional) main submodule. Put code here if you need it to be executed when
;   ;; this file is run using DrRacket or the `racket` executable.  The code here
;   ;; does not run when this file is required by another module. Documentation:
;   ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29
;   )
