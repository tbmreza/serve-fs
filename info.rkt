#lang info
(define collection "cli-command")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/cli-command.scrbl" ())))
(define pkg-desc "Serve files to localhost.")
(define version "0.1")
(define pkg-authors '(tbmreza))
