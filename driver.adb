with BinarySearchTree;
use BinarySearchTree;
with ada.text_IO; use ada.text_IO;

procedure Driver is
   Root: BinarySearchTreePoint;
   Temp, FirstPtr: BinarySearchTreePoint;
   TempPhone: String10;
begin
   init_head;

-- C OPTION TRANSACTIONS
   -- 1) Inserting data

   InsertBinarySearchTree(Root, "Nkwantal  ", "295-1492  "); put("Inserted Nkwantal."); new_line;
   InsertBinarySearchTree(Root, "Idle      ", "291-1864  "); put("Inserted Idle."); new_line;
   InsertBinarySearchTree(Root, "Green     ", "295-1601  "); put("Inserted Green."); new_line;
   InsertBinarySearchTree(Root, "Realzola  ", "293-6122  "); put("Inserted Realzola."); new_line;
   InsertBinarySearchTree(Root, "Ealson    ", "295-1882  "); put("Inserted Ealson."); new_line;
   InsertBinarySearchTree(Root, "Bolen     ", "291-7890  "); put("Inserted Bolen."); new_line;
   InsertBinarySearchTree(Root, "Hedreen   ", "294-8075  "); put("Inserted Hedreen."); new_line;
   InsertBinarySearchTree(Root, "Bell      ", "584-3622  "); put("Inserted Bell."); new_line;

   -- 2) Find "Bolen" iteratively, print the phone number

   new_line; put("<ITERATIVE SEARCH>"); new_line;
   FindCustomerIterative(Root, "Bolen     ", Temp);
   if (Not_Null(Temp)) then
      TempPhone := CustomerPhone(Temp);
      put("Bolen's number is: " & TempPhone); new_line;
   else
      put("Could not find 'Bolen' node in the tree."); new_line;
   end if;

   -- 3) Find "Bolen" recursively, print the phone number

   new_line; put("<RECURSIVE SEARCH>"); new_line;
   FindCustomerRecursive(Root, "Bolen     ", Temp);
   if (Not_Null(Temp)) then
      TempPhone := CustomerPhone(Temp);
      put("Bolen's number is: " & TempPhone); new_line;
   else
      put("Could not find 'Bolen' node in the tree."); new_line;
   end if;

   -- 4) Find "Penton" iteratively, print the phone number

   new_line; put("<ITERATIVE SEARCH>"); new_line;
   FindCustomerIterative(Root, "Penton    ", Temp);
   if (Not_Null(Temp)) then
      TempPhone := CustomerPhone(Temp);
      put("Penton's number is: " & TempPhone); new_line;
   else
      put("Could not find 'Penton' node in the tree."); new_line;
   end if;

   -- 5) Find "Penton" recursively, print the phone number

   new_line; put("<RECURSIVE SEARCH>"); new_line;
   FindCustomerRecursive(Root, "Penton    ", Temp);
   if (Not_Null(Temp)) then
      TempPhone := CustomerPhone(Temp);
      put("Penton's number is: " & TempPhone); new_line;
   else
      put("Could not find 'Penton' node in the tree."); new_line;
   end if;

   -- 6) Traverse tree in inorder, starting with "Ealson"

   new_line; put("<INORDER TRAVERSAL STARTING WITH EALSON>"); new_line;
   FindCustomerIterative(Root, "Ealson    ", Temp);
   if (Not_Null(Temp)) then
      DisplayRecord(Temp);
      FirstPtr := Temp;
      Temp := InOrderSuccessor(Temp);
      while (Temp /= FirstPtr) loop
         DisplayRecord(Temp);
         Temp := InOrderSuccessor(Temp);
      end loop;
   else
      put("The desired node is not in the tree; it cannot be a starting point.");
      new_line;
   end if;

   -- 7) Inserting data

   new_line;
   InsertBinarySearchTree(Root, "Altayyar  ", "294-1568  "); put("Inserted Altayyar."); new_line;
   InsertBinarySearchTree(Root, "Gammons   ", "294-1182  "); put("Inserted Gammons."); new_line;
   InsertBinarySearchTree(Root, "Whitehead ", "295-6622  "); put("Inserted Whitehead."); new_line;

   -- 8) Traverse tree in inorder, starting with Root

   new_line; put("<INORDER TRAVERSAL STARTING WITH ROOT>"); new_line;
   DisplayRecord(Root);
   Temp := InOrderSuccessor(Root);
   while (Temp /= Root) loop
      DisplayRecord(Temp);
      Temp := InOrderSuccessor(Temp);
   end loop;

   -- 9) Traverse the tree in preorder

   new_line; put("<ITERATIVE PREORDER TRAVERSAL>"); new_line;
   PreOrderTraversalIterative(Root);

-- B OPTION TRANSACTIONS
   -- 10) Delete Bolen, Najar, and Green

   new_line;
   FindCustomerIterative(Root, "Bolen     ", Temp);
   if (Not_Null(Temp)) then
      DeleteRandomNode(Root, Temp);
      put("Deleted Bolen."); new_line;
   else
      put("'Bolen' is not in the tree and cannot be deleted.");
      new_line;
   end if;

   FindCustomerIterative(Root, "Najar     ", Temp);
   if (Not_Null(Temp)) then
      DeleteRandomNode(Root, Temp);
      put("Deleted Najar."); new_line;
   else
      put("'Najar' is not in the tree and cannot be deleted.");
      new_line;
   end if;

   FindCustomerRecursive(Root, "Green     ", Temp);
   if (Not_Null(Temp)) then
      DeleteRandomNode(Root, Temp);
      put("Deleted Green."); new_line;
   else
      put("'Green' is not in the tree and cannot be deleted.");
      new_line;
   end if;

   -- 11) Insert data

   InsertBinarySearchTree(Root, "Novak     ", "294-1666  "); put("Inserted Novak."); new_line;
   InsertBinarySearchTree(Root, "Gonzales  ", "295-1882  "); put("Inserted Gonzales."); new_line;

   -- 12) Traverse tree in inorder, starting with Root

   new_line; put("<INORDER TRAVERSAL STARTING WITH ROOT>"); new_line;
   DisplayRecord(Root);
   Temp := InOrderSuccessor(Root);
   while (Temp /= Root) loop
      DisplayRecord(Temp);
      Temp := InOrderSuccessor(Temp);
   end loop;

   -- 13) Traverse tree in reverse inorder

   new_line; put("<REVERSE INORDER TRAVERSAL>"); new_line;
   ReverseInOrder(Root);

   -- 14) Preorder traversal using threads

   new_line; put("<PREORDER TRAVERSAL USING THREADS>"); new_line;
   ThreadedPreOrder(Root);

end Driver;
