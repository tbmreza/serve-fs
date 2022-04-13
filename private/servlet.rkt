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

(struct params (port dir headless?))
(define (start-servlet params)
  (define servlet-path "/index.rkt")

  (define (fmt filename)
    (format "http://localhost:~a/~a" (params-port params) filename))

  (define (command-line-mode-info)
    (map displayln (map fmt (filenames)))
    (displayln "\nStop this program at any time to terminate the Web Server."))

  (if (params-headless? params) (command-line-mode-info) void)

  (serve/servlet start
                 #:port (params-port params)
                 #:servlet-path "/"
                 #:extra-files-paths (list (build-path (params-dir params)))
                 #:command-line? (params-headless? params)))

(provide start-servlet
         params)
