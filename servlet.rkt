#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr `(html (head (title "serve-fs"))
                         ; (body (p "add hints here?"))
                         )))

(define (start-servlet)
  (serve/servlet start
                 #:port 8080
                 #:servlet-path "/index.rkt"
                 #:extra-files-paths (list (build-path "."))))

(provide start-servlet)
