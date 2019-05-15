with Ada.Text_IO; use Ada.Text_IO;
with BinarySearchTree;
use BinarySearchTree;

procedure Lab5 is

   Root: BinarySearchTreePoint;
   Choice: Character;
   TempName: String10;
   TempPhone: String10;
   TempPtr: BinarySearchTreePoint;
   FirstPtr: BinarySearchTreePoint;

begin
   init_head;

   put("1) To add a record, press 'A'."); new_line;
   put("2) To find a customer iteratively, press 'I'."); new_line;
   put("3) To find a customer recursively, press 'R'."); new_line;
   put("4) To find the next node in inorder, press 'S'."); new_line;
   put("5) To traverse the tree using PreOrder (iterative), press 'P'."); new_line;
   put("6) To get a customer's name, press 'N'."); new_line;
   put("7) To get a customer's phone number, press '#'."); new_line;
   put("8) To traverse tree in inorder, press 'T'"); new_line;
   put("9) To traverse the tree in the reverse of inorder, press 'V'."); new_line;
   put("10) To traverse the tree in PreOrder using the threads, press 'H'."); new_line;
   put("11) To delete a node, press 'D'."); new_line;
   put("12) To quit, press 'Q'."); new_line(2);

   loop
      put("Enter choice: "); get(Choice);

      exit when Choice = 'Q' or Choice = 'q';

      if Choice = 'A' or Choice = 'a' then
         put("Enter the name of the customer to insert: "); get(TempName);
         put("Enter the phone number: "); get(TempPhone);
         InsertBinarySearchTree(Root, TempName, TempPhone);

      elsif Choice = 'I' or Choice = 'i' then
         put("Enter the name of the customer to seach: "); get(TempName);
         FindCustomerIterative(Root, TempName, TempPtr);
         if (Not_Null(TempPtr)) then
            put("Found the desired node."); new_line;
         else
            put("Did not find the desired node."); new_line;
         end if;

      elsif Choice = 'R' or Choice = 'r' then
         put("Enter the name of the customer to seach: "); get(TempName);
         FindCustomerRecursive(Root, TempName, TempPtr);
         if (Not_Null(TempPtr)) then
            put("Found the desired node."); new_line;
         else
            put("Did not find the desired node."); new_line;
         end if;

      elsif Choice = 'S' or Choice = 's' then
         if (Not_Null(TempPtr)) then
            TempPtr := InOrderSuccessor(TempPtr);
         else
            put("Cannot find inorder successor of node that does not exist.");
            new_line;
         end if;

      elsif Choice = 'P' or Choice = 'p' then
         new_line;
         if (Not_Null(Root)) then
            put("--------PREORDER (ITERATIVE)--------"); new_line;
            PreOrderTraversalIterative(Root);
         else
            put("Cannot traverse empty tree."); new_line;
         end if;

      elsif Choice = 'N' or Choice = 'n' then
         if (Not_Null(TempPtr)) then
            TempName := CustomerName(TempPtr);
            put("Name: " & TempName); new_line;
         else
            put("Cannot print name for node that does not exist.");
            new_line;
         end if;

      elsif Choice = '#' then
         if (Not_Null(TempPtr)) then
            TempPhone := CustomerPhone(TempPtr);
            put("Phone num.: " & TempPhone); new_line;
         else
            put("Cannot print number for node that does not exist.");
            new_line;
         end if;

      elsif Choice = 'T' or Choice = 't' then
         put("Enter a name in the tree for the starting point: "); get(TempName);
         new_line;
         FindCustomerIterative(Root, TempName, TempPtr);
         if (Not_Null(TempPtr)) then
            DisplayRecord(TempPtr);
            FirstPtr := TempPtr;
            TempPtr := InOrderSuccessor(TempPtr);
            while TempPtr /= FirstPtr loop
               DisplayRecord(TempPtr);
               TempPtr := InOrderSuccessor(TempPtr);
            end loop;
         else
            put("The desired node is not in the tree; it cannot be a starting point.");
            new_line;
         end if;

      elsif Choice = 'V' or Choice = 'v' then
         new_line;
         if (Not_Null(Root)) then
            put("-----REVERSE INORDER-----"); new_line;
            ReverseInOrder(Root);
         else
            put("Cannot traverse empty tree."); new_line;
         end if;

      elsif Choice = 'H' or Choice = 'h' then
         new_line;
         if (Not_Null(Root)) then
            put("-----PREORDER (USING THREADS)-----"); new_line;
            ThreadedPreOrder(Root);
         else
            put("Cannot traverse empty tree."); new_line;
         end if;

      elsif Choice = 'D' or Choice = 'd' then
         put("Enter the name of the customer to delete: "); get(TempName);
         FindCustomerIterative(Root, TempName, TempPtr);
         if (Not_Null(TempPtr)) then
            DeleteRandomNode(Root, TempPtr);
            put("Deleted the desired node."); new_line;
         else
            put("The desired node is not in the tree; it cannot be deleted.");
            new_line;
         end if;

      end if;
   end loop;

end Lab5;
