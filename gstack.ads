 -- in file Gstack.ads (specification file)

GENERIC
   Max: Integer;            -- size of stack
   TYPE Item IS PRIVATE;    -- type to stack

PACKAGE Gstack IS
   PROCEDURE Push(X: IN Item);
   PROCEDURE Pop(X: OUT Item);
   FUNCTION Count return Integer;
END Gstack;


