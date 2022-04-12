#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr `(html (head (title "serve-fs")))))

(define (handle-ws name)
  (string-replace name " " "%20"))

(define (filenames)
  (define not-folder-names (filter file-exists? (map path->string (directory-list))))
  (map handle-ws not-folder-names))

(define (start-servlet params)
  (define servlet-path "/index.rkt")

  (define (fmt filename)
    (format "http://localhost:~a/~a" (hash-ref params 'port) filename))

  (define (command-line-mode-info)
    (map displayln (map fmt (filenames)))
    (displayln "\nStop this program at any time to terminate the Web Server."))

  (if (hash-ref params 'headless) (command-line-mode-info) void)

  (serve/servlet start
                 #:port (hash-ref params 'port)
                 #:servlet-path "/"
                 #:extra-files-paths (list (build-path (hash-ref params 'dir)))
                 #:command-line? (hash-ref params 'headless)))

(provide start-servlet)
