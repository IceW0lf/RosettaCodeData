--#SET TERMINATOR @

SET SERVEROUTPUT ON @

BEGIN
 DECLARE TYPE NUMBERS AS SMALLINT ARRAY[5];
 DECLARE NUMBERS NUMBERS;
 DECLARE I SMALLINT;

 SET I = 1;
 WHILE (I <= 5) DO
  SET NUMBERS[I] = I;
  SET I = I + 1;
 END WHILE;

 BEGIN
  DECLARE PROCEDURE PRINT_SQUARE (
    IN VALUE SMALLINT
   )
  BEGIN
   CALL DBMS_OUTPUT.PUT(VALUE * VALUE || ' ');
  END;

  SET I = 1;
  WHILE (I <= 5) DO
   CALL PRINT_SQUARE(NUMBERS[I]);
   SET I = I + 1;
  END WHILE;
  CALL DBMS_OUTPUT.PUT_LINE('');
 END;
END @