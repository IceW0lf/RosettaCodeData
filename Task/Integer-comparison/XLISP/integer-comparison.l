(DEFUN COMPARE-INTEGERS ()
    (DISPLAY "Enter two integers separated by a space.")
    (NEWLINE)
    (DISPLAY "> ")
    (DEFINE A (READ))
    (DEFINE B (READ))
    (COND
        ((> A B) (DISPLAY "The first number is larger."))
        ((= A B) (DISPLAY "They are equal."))
        ((< A B) (DISPLAY "The first number is smaller."))))