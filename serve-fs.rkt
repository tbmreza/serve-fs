#lang racket/base

(require racket/cmdline
         racket/port)
(require "private/servlet.rkt")

(define localhost-port (box 5454))
(define fs-dir (box "."))
(define command-line-mode (box #f))

(define (as-number n)
  (if (string? n) (string->number n) n))

(command-line
 #:program "serve-fs"
 #:once-each ; Each independent, but specified at most once.
 [("--port" "-p") port "Specify port number" (set-box! localhost-port port)]
 [("--dir" "-d") dir "Specify directory to serve" (set-box! fs-dir dir)]
 [("--headless" "-s") "Do not open a browser" (set-box! command-line-mode #t)]
 #:args ()
 (start-servlet (params (as-number (unbox localhost-port)) (unbox fs-dir) (unbox command-line-mode))))
