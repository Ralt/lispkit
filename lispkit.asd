;; -*- mode: common-lisp -*-
(defsystem lispkit
  :version "0.0.1"
  :description "Lispy browser"
  :licence "BSD"
  :components ((:file "lispkit" :depends-on ("macros" "packages" "keys"))
               (:file "keys" :depends-on ("packages" "browser" "events" "commands"))
               (:file "browser" :depends-on ("packages" "events" "jumps" "commands" "settings"))
               (:file "events" :depends-on ("packages"))
               (:file "jumps" :depends-on ("packages"))
               (:file "macros" :depends-on ("packages"))
               (:file "commands" :depends-on ("packages" "user"))
               (:file "user" :depends-on ("packages"))
               (:file "settings")
               (:file "packages"))
  :depends-on (:asdf
               :cl-cffi-gtk
               :cl-webkit2
               :cl-xkeysym
               :djula
               :parenscript
               :purl
               :split-sequence)
  :in-order-to ((test-op (test-op :lispkit-test))))

(defsystem lispkit-test
  :version "0.0.1"
  :description "Lispy browser"
  :licence "BSD"
  :components ((:module "test"
                        :components
                        ((:file "tests"))))
  :depends-on (:lispkit :lisp-unit :alexandria)
  :perform (test-op (o s)
                    ;; LISP-UNIT:RUN-ALL-TESTS is a macro, so it can't be called
                    ;; like a function.
                    (eval `(,(intern "RUN-ALL-TESTS" :lisp-unit)
                            :lispkit-test))))
