#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr `(html (head (title "serve-fs"))
                         ; (body (p "add hints here?"))
                         )))

; (define (start-servlet)
(define (start-servlet port dir)
  (serve/servlet start
                 ; #:port 8080
                 #:port port
                 #:servlet-path "/index.rkt"
                 ; #:extra-files-paths (list (build-path "."))))
                 #:extra-files-paths (list (build-path dir))))

(provide start-servlet)
