(set-logic ALL)
(set-option :produce-models true)

; Set node colors
(declare-const p00 Bool)
(declare-const p01 Bool)
(declare-const p02 Bool)

(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const p12 Bool)

(declare-const p20 Bool)
(declare-const p21 Bool)
(declare-const p22 Bool)

(declare-const p30 Bool)
(declare-const p31 Bool)
(declare-const p32 Bool)

(declare-const p40 Bool)
(declare-const p41 Bool)
(declare-const p42 Bool)

; Each node must have one color
(assert (or (or p00 p01) p02))
(assert (or (or p10 p11) p12))
(assert (or (or p20 p21) p22))
(assert (or (or p30 p31) p32))
(assert (or (or p40 p41) p42))

; Edges of G cannot be the same color
; c0 != c1
(assert (not (and p00 p10)))
(assert (not (and p01 p11)))
(assert (not (and p02 p12)))

; c0 != c2
(assert (not (and p00 p20)))
(assert (not (and p01 p21)))
(assert (not (and p02 p22)))

; c1 != c2
(assert (not (and p10 p20)))
(assert (not (and p11 p21)))
(assert (not (and p12 p22)))

; c1 != c3
(assert (not (and p10 p30)))
(assert (not (and p11 p31)))
(assert (not (and p12 p32)))

; c_1 != c_4
(assert (not (and p10 p40)))
(assert (not (and p11 p41)))
(assert (not (and p12 p42)))

; c_2 != c_3
(assert (not (and p20 p30)))
(assert (not (and p21 p31)))
(assert (not (and p22 p32)))

; c_2 != c_4
(assert (not (and p20 p40)))
(assert (not (and p21 p41)))
(assert (not (and p22 p42)))


; check satisfiability and get model
(check-sat)
(get-model)

