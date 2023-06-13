(defpackage trivial-segmentation-fault
  (:use #:cl)
  (:export #:segmentation-fault #:ignore-segmentation-fault #:+segmentation-fault-handleable-p+))

(in-package #:trivial-segmentation-fault)

(defconstant +segmentation-fault-handleable-p+
  (or (setf (find-class 'segmentation-fault)
            (or #+sbcl (find-class 'sb-sys:memory-fault-error)
                #+ccl (find-class 'ccl::invalid-memory-access)
                #+(or ecl clasp) (find-class 'ext:segmentation-violation)))
      (progn (define-condition segmentation-fault () ()) nil)))

(defmacro ignore-segmentation-fault (&body body)
  `(handler-case (progn . ,body)
     (segmentation-fault ())))
