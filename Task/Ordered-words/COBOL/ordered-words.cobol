       IDENTIFICATION DIVISION.
       PROGRAM-ID. ABC-WORDS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DICT ASSIGN TO DISK
           ORGANIZATION LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD DICT
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "unixdict.txt".
       01 ENTRY.
          03 WORD         PIC X(32).
          03 LETTERS      PIC X OCCURS 32 TIMES, REDEFINES WORD.

       WORKING-STORAGE SECTION.
       01 LEN             PIC 99.
       01 MAXLEN          PIC 99 VALUE 0.
       01 I               PIC 99.
       01 OK-FLAG         PIC X.
          88 OK           VALUE '*'.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT DICT.

       FIND-LONGEST-WORD.
           READ DICT, AT END CLOSE DICT, GO TO PRINT-LONGEST-WORDS.
           PERFORM CHECK-WORD.
           GO TO FIND-LONGEST-WORD.

       PRINT-LONGEST-WORDS.
           ALTER VALID-WORD TO PROCEED TO SHOW-WORD.
           OPEN INPUT DICT.

       READ-WORDS.
           READ DICT, AT END CLOSE DICT, STOP RUN.
           PERFORM CHECK-WORD.
           GO TO READ-WORDS.

       CHECK-WORD.
           MOVE ZERO TO LEN.
           INSPECT WORD TALLYING LEN
               FOR CHARACTERS BEFORE INITIAL SPACE.
           MOVE '*' TO OK-FLAG.
           PERFORM CHECK-CHAR-PAIR VARYING I FROM 2 BY 1
               UNTIL NOT OK OR I IS GREATER THAN LEN.
           IF OK, PERFORM DO-WORD.

       CHECK-CHAR-PAIR.
           IF LETTERS(I - 1) IS GREATER THAN LETTERS(I),
               MOVE SPACE TO OK-FLAG.

       DO-WORD SECTION.
       VALID-WORD.
           GO TO CHECK-LENGTH.
       CHECK-LENGTH.
           IF LEN IS GREATER THAN MAXLEN, MOVE LEN TO MAXLEN.
           GO TO DONE.
       SHOW-WORD.
           IF LEN IS EQUAL TO MAXLEN, DISPLAY WORD.
       DONE.
           EXIT.