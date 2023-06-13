(defpackage trivial-segmentation-fault.test
  (:use #:cl #:parachute #:cffi #:trivial-segmentation-fault))

(in-package #:trivial-segmentation-fault.test)

(define-test suite
  (when (true +segmentation-fault-handleable-p+)
    (false (ignore-segmentation-fault
             (setf (mem-ref (null-pointer) :uint8) 0)))))
