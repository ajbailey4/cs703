(set-logic ALL)
(set-option :produce-models true)

; define constants
(declare-const l0 Real)
(declare-const u0 Real)

(declare-const l1 Real)
(declare-const u1 Real)

(declare-const l2 Real)
(declare-const u2 Real)

(declare-const l3 Real)
(declare-const u3 Real)

; consts should be intervals
(assert (not (< u0 l0)))
(assert (not (< u1 l1)))
(assert (not (< u2 l2)))
(assert (not (< u3 l3)))

; formalize edges
(assert (or
    (not (or (< u0 l1) (< u1 u0)))
    (not (or (< l0 l1) (< u1 l0)))))
(assert (or
    (not (or (< u1 l2) (< u2 u1)))
    (not (or (< l1 l2) (< u2 l1)))))
(assert (or
    (not (or (< u2 l3) (< u3 u2)))
    (not (or (< l2 l3) (< u3 l2)))))
(assert (or
    (not (or (< u3 l0) (< u0 u3)))
    (not (or (< l3 l0) (< u0 l3)))))

; formalize not-edges
(assert (or (< u0 l2) (< u2 l0)))
(assert (or (< u1 l3) (< u3 l1)))


; check satisfiability and get model
(check-sat)
(get-model)

