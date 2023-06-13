(defsystem trivial-segmentation-fault
  :version "1.0.0"
  :author "Bohong Huang <1281299809@qq.com>"
  :maintainer "Bohong Huang <1281299809@qq.com>"
  :license "mit"
  :description "A Common Lisp library that provides a portable way to handle segmentation faults."
  :homepage "https://github.com/bohonghuang/trivial-segmentation-fault"
  :bug-tracker "https://github.com/bohonghuang/trivial-segmentation-fault/issues"
  :source-control (:git "https://github.com/bohonghuang/trivial-segmentation-fault.git")
  :components ((:file "package"))
  :depends-on ()
  :in-order-to ((test-op (test-op #:trivial-segmentation-fault/test))))

(defsystem trivial-segmentation-fault/test
  :depends-on (#:trivial-segmentation-fault #:parachute #:cffi)
  :pathname "./test/"
  :components ((:file "package"))
  :perform (test-op (op c) (symbol-call '#:parachute '#:test (find-symbol (symbol-name '#:suite) '#:trivial-segmentation-fault.test))))
