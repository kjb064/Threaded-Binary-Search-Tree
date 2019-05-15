-- in file Gstack.adb

PACKAGE BODY Gstack IS
   S: ARRAY(1..Max) OF Item;
   Top: Integer RANGE 0..Max;

   PROCEDURE Push(X: IN Item) IS
   BEGIN
      Top := Top + 1;       -- simple stack, no overflow checking here
      S(Top) := X;
   END Push;

   PROCEDURE Pop(X: OUT Item) IS
   BEGIN
      X := S(Top);
      Top := Top - 1;
   END Pop;

   FUNCTION Count RETURN Integer IS
   BEGIN
      RETURN Top;
   END Count;

BEGIN
   Top := 0;       -- initialize top of stack to empty
END Gstack;


