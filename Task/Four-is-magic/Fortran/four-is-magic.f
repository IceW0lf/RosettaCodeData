MODULE FOUR_IS_MAGIC
    IMPLICIT NONE
    CHARACTER(8), DIMENSION(20) :: SMALL_NUMS
    CHARACTER(7), DIMENSION(8) :: TENS
    CHARACTER(7) :: HUNDRED
    CHARACTER(8) :: THOUSAND
    CHARACTER(8) :: MILLION
    CHARACTER(8) :: BILLION
    CHARACTER(9) :: TRILLION
    CHARACTER(11) :: QUADRILLION
    CHARACTER(11) :: QUINTILLION
    CHARACTER(1) :: SEPARATOR
    CHARACTER(1) :: SPACE


    CONTAINS

    SUBROUTINE INIT_ARRAYS

        SMALL_NUMS(1) = "zero"
        SMALL_NUMS(2) = "one"
        SMALL_NUMS(3) = "two"
        SMALL_NUMS(4) = "three"
        SMALL_NUMS(5) = "four"
        SMALL_NUMS(6) = "five"
        SMALL_NUMS(7) = "six"
        SMALL_NUMS(8) = "seven"
        SMALL_NUMS(9) = "eight"
        SMALL_NUMS(10) = "nine"
        SMALL_NUMS(11) = "ten"
        SMALL_NUMS(12) = "eleven"
        SMALL_NUMS(13) = "twelve"
        SMALL_NUMS(14) = "thirteen"
        SMALL_NUMS(15) = "fourteen"
        SMALL_NUMS(16) = "fifteen"
        SMALL_NUMS(17) = "sixteen"
        SMALL_NUMS(18) = "seventeen"
        SMALL_NUMS(19) = "eighteen"
        SMALL_NUMS(20) = "nineteen"

        TENS(1) = "twenty"
        TENS(2) = "thirty"
        TENS(3) = "forty"
        TENS(4) = "fifty"
        TENS(5) = "sixty"
        TENS(6) = "seventy"
        TENS(7) = "eight"
        TENS(8) = "ninety"

        HUNDRED = "hundred"
        THOUSAND = "thousand"
        MILLION = "million"
        BILLION = "billion"
        TRILLION = "trillion"
        QUADRILLION = "quadrillion"
        QUINTILLION = "quintillion"
        SEPARATOR = "-"
        SPACE = " "

    END SUBROUTINE INIT_ARRAYS

    RECURSIVE FUNCTION STRING_REPRESENTATION(NUM) RESULT(NUM_AS_STR)
        INTEGER(16), INTENT(IN) :: NUM
        CHARACTER(1000) :: NUM_AS_STR
        INTEGER(16), DIMENSION(9) :: COMPONENTS

        CALL INIT_ARRAYS()

        COMPONENTS = GET_COMPONENTS(NUM)

        NUM_AS_STR = TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(9), QUINTILLION)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(8), QUADRILLION)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(7), TRILLION)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(6), BILLION)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(5), MILLION)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(4), THOUSAND)))
        NUM_AS_STR = TRIM(NUM_AS_STR) // SPACE // TRIM(ADJUSTL(GET_SUBSET(COMPONENTS(3), HUNDRED)))


        IF (COMPONENTS(2) .EQ. 1) THEN
            NUM_AS_STR = TRIM(ADJUSTL(NUM_AS_STR)) // SPACE // TRIM(ADJUSTL(SMALL_NUMS(10 + COMPONENTS(1) + 1)))
        ELSE

            IF (COMPONENTS(1) .GT. 0) THEN
                IF (COMPONENTS(2) .GT. 0) THEN
                    NUM_AS_STR = TRIM(ADJUSTL(NUM_AS_STR)) // SPACE // TRIM(ADJUSTL(TENS(COMPONENTS(2) - 1))) // SEPARATOR
                    NUM_AS_STR = TRIM(ADJUSTL(NUM_AS_STR)) // TRIM(ADJUSTL(SMALL_NUMS(COMPONENTS(1) + 1)))
                ELSE
                    NUM_AS_STR = TRIM(ADJUSTL(NUM_AS_STR)) // SPACE // TRIM(ADJUSTL(SMALL_NUMS(COMPONENTS(1) + 1)))
                ENDIF
            ELSE IF (COMPONENTS(2) .GT. 0) THEN
                NUM_AS_STR = TRIM(ADJUSTL(NUM_AS_STR)) // SPACE // TRIM(ADJUSTL(TENS(COMPONENTS(2) - 1)))
            ENDIF
        ENDIF

    END FUNCTION STRING_REPRESENTATION

    FUNCTION GET_COMPONENTS(NUM)
        INTEGER(16), INTENT(IN) :: NUM
        INTEGER(16), DIMENSION(9) :: GET_COMPONENTS
        INTEGER(16) :: I_UNITS
        INTEGER(16) :: I_TENS
        INTEGER(16) :: I_HUNDREDS
        INTEGER(16) :: I_THOUSANDS
        INTEGER(16) :: I_MILLIONS
        INTEGER(16) :: I_BILLIONS
        INTEGER(16) :: I_TRILLIONS
        INTEGER(16) :: I_QUADRILLIONS
        INTEGER(16) :: I_QUINTILLIONS
        REAL(16) DIVIDE_TEMP

        I_UNITS = NUM

        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000000000000000000))/1000000000000000000
        I_QUINTILLIONS = FLOOR(DIVIDE_TEMP)

        IF (I_QUINTILLIONS .NE. 0) THEN
           I_UNITS = I_UNITS - I_QUINTILLIONS*1000000000000000000
        ENDIF


        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000000000000000))/1000000000000000
        I_QUADRILLIONS = FLOOR(DIVIDE_TEMP)

        IF (I_QUADRILLIONS .NE. 0) THEN
           I_UNITS = I_UNITS - I_QUADRILLIONS*1000000000000000
        ENDIF

        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000000000000))/1000000000000
        I_TRILLIONS = FLOOR(DIVIDE_TEMP)

        IF (I_TRILLIONS .NE. 0) THEN
           I_UNITS = I_UNITS - I_TRILLIONS*1000000000000
        ENDIF

        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000000000))/1000000000
        I_BILLIONS = FLOOR(DIVIDE_TEMP)

        IF (I_BILLIONS .NE. 0) THEN
           I_UNITS = I_UNITS - I_BILLIONS*1000000000
        ENDIF

        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000000))/1000000

        I_MILLIONS = FLOOR(DIVIDE_TEMP)

        IF (I_MILLIONS .NE. 0) THEN
           I_UNITS = I_UNITS - I_MILLIONS*1000000
        ENDIF

        DIVIDE_TEMP = (I_UNITS - MOD(I_UNITS, 1000))/1000

        I_THOUSANDS = FLOOR(DIVIDE_TEMP)

        IF (I_THOUSANDS .NE. 0) THEN
           I_UNITS = I_UNITS - I_THOUSANDS*1000
        ENDIF

        DIVIDE_TEMP = I_UNITS/1E2
        I_HUNDREDS = FLOOR(DIVIDE_TEMP)

        IF (I_HUNDREDS .NE. 0) THEN
           I_UNITS = I_UNITS - I_HUNDREDS*1E2
        ENDIF

        DIVIDE_TEMP = I_UNITS/10.
        I_TENS =  FLOOR(DIVIDE_TEMP)

        IF (I_TENS .NE. 0) THEN
           I_UNITS = I_UNITS - I_TENS*10
        ENDIF

        GET_COMPONENTS(1) = I_UNITS
        GET_COMPONENTS(2) = I_TENS
        GET_COMPONENTS(3) = I_HUNDREDS
        GET_COMPONENTS(4) = I_THOUSANDS
        GET_COMPONENTS(5) = I_MILLIONS
        GET_COMPONENTS(6) = I_BILLIONS
        GET_COMPONENTS(7) = I_TRILLIONS
        GET_COMPONENTS(8) = I_QUADRILLIONS
        GET_COMPONENTS(9) = I_QUINTILLIONS

    END FUNCTION GET_COMPONENTS

    FUNCTION GET_SUBSET(COUNTER, LABEL) RESULT(OUT_STR)
        CHARACTER(*), INTENT(IN) :: LABEL
        INTEGER(16), INTENT(IN) :: COUNTER
        CHARACTER(100) :: OUT_STR

        OUT_STR = ""

        IF (COUNTER .GT. 0) THEN
            IF (COUNTER .LT. 20) THEN
                OUT_STR = SPACE // TRIM(ADJUSTL(SMALL_NUMS(COUNTER + 1)))
            ELSE
                OUT_STR = SPACE // TRIM(ADJUSTL(STRING_REPRESENTATION(COUNTER)))
            ENDIF
            OUT_STR = TRIM(ADJUSTL(OUT_STR)) // SPACE // TRIM(LABEL)
        ENDIF

    END FUNCTION GET_SUBSET


    SUBROUTINE FIND_MAGIC(NUM)
        INTEGER(16), INTENT(IN) :: NUM
        INTEGER(16) :: CURRENT, LEN_SIZE
        CHARACTER(1000) :: CURRENT_STR, CURRENT_STR_LEN
        CHARACTER(1000) :: OUT_STR

        CURRENT = NUM
        OUT_STR = ""

        DO WHILE (CURRENT .NE. 4)
            CURRENT_STR = STRING_REPRESENTATION(CURRENT)
            LEN_SIZE = LEN_TRIM(ADJUSTL(CURRENT_STR))
            CURRENT_STR_LEN = STRING_REPRESENTATION(LEN_SIZE)
            OUT_STR = TRIM(ADJUSTL(OUT_STR)) // SPACE // TRIM(ADJUSTL(CURRENT_STR))
            OUT_STR = TRIM(ADJUSTL(OUT_STR)) // " is " // TRIM(ADJUSTL(CURRENT_STR_LEN)) // ","
            CURRENT = LEN_SIZE
        ENDDO

        WRITE(*,*) TRIM(ADJUSTL(OUT_STR)) // SPACE // "four is magic."
    END SUBROUTINE FIND_MAGIC


END MODULE FOUR_IS_MAGIC

PROGRAM TEST_NUM_NAME
        USE FOUR_IS_MAGIC
        IMPLICIT NONE

        INTEGER(2) I
        INTEGER(16), DIMENSION(10) :: TEST_NUMS = (/5, 13, 78, 797, 2739, 4000, 7893, 93497412, 2673497412, 10344658531277200972/)
        CHARACTER(1000) :: NUM_NAME

        DO I=1, SIZE(TEST_NUMS)
            CALL FIND_MAGIC(TEST_NUMS(I))
        ENDDO
END PROGRAM
