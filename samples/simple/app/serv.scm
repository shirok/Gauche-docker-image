(use makiki)
(use gauche.parseopt)

(define (main args)
  (let-args (cdr args) ([port "p=i"])
    (start-http-server :port port)))

(define-http-handler "/"
  (^[req app] (respond/ok req "<h1>It worked!</h1>")))
