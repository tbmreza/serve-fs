#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr `(html (head (title "serve-fs")))))

(define (start-servlet params)
  (define servlet-path "/index.rkt")
  (define (command-line-mode-info)
    (displayln (format "http://localhost:~a~a" (hash-ref params #\p) servlet-path))
    (displayln "Stop this program at any time to terminate the Web Server."))

  (if (hash-ref params #\s) (command-line-mode-info) void)

  (serve/servlet start
                 #:port (hash-ref params #\p)
                 #:servlet-path servlet-path
                 #:extra-files-paths (list (build-path (hash-ref params #\d)))
                 #:command-line? (hash-ref params #\s)))

(provide start-servlet)
