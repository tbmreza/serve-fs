#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr `(html (head (title "serve-fs")))))

; TODO
; (define (handle-ws ...))
(define filenames
  (filter file-exists? (map path->string (directory-list))))

; (require rackunit)
; (check-equal? (fmt "gura.jpeg") "http://localhost:5454/gura.jpeg")

(define mock
  (hash 'port 5454 'dir "." 'headless #t))

; (define (start-servlet params)
(define (start-servlet [params mock])
  (define servlet-path "/index.rkt")

  (define (fmt filename)
    (format "http://localhost:~a/~a" (hash-ref params 'port) filename))

  (define (command-line-mode-info)
    (map displayln (map fmt filenames))
    (displayln "\nStop this program at any time to terminate the Web Server."))

  (if (hash-ref params 'headless) (command-line-mode-info) void)

  (serve/servlet start
                 #:port (hash-ref params 'port)
                 #:servlet-path "/"
                 #:extra-files-paths (list (build-path (hash-ref params 'dir)))
                 #:command-line? (hash-ref params 'headless))
  )

(provide start-servlet)
