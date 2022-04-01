(add-load-path "." :relative)
(use mylib.a)

(print "Running local script")

(with-input-from-file "data/input.txt"
  (^[] (print (port->string (current-input-port)))))
