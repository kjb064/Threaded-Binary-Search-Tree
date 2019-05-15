-- File binarysearchtree.adb

with ada.text_IO; use ada.text_IO;
with ada.unchecked_deallocation;
with Gstack;

package body BinarySearchTree is

   NumCust: Integer := 0;
   Head: BinarySearchTreePoint;

   procedure Free is new ada.unchecked_deallocation(Node, BinarySearchTreePoint);

   procedure init_head is
   begin
      Head := new Node;
      Head.Rlink := Head;
      Head.Llink := Head;
      Head.Rtag := true;
      Head.Ltag := false;
   end init_head;

   procedure DisplayRecord(Pt: BinarySearchTreePoint) is
   begin
      if (Pt /= Head) then
         put("Name: "); put(Pt.Info.Name); new_line;
         put("Phone num.: "); put(Pt.Info.PhoneNumber); new_line;
      end if;
   end DisplayRecord;

   function Not_Null(Pt: BinarySearchTreePoint) return Boolean is
   begin
      return (Pt /= null);
   end Not_Null;


   procedure AllocateNode(Q: out BinarySearchTreePoint; CustName: String10;
                          CustPhone: String10) is
   begin
      Q := new Node;
      Q.Info.Name := CustName;
      Q.Info.PhoneNumber := CustPhone;
      Q.Llink := null;
      Q.Rlink := null;
      Q.Ltag := false;
      Q.Rtag := false;
   end AllocateNode;


   procedure InsertBinarySearchTree(Root: in out BinarySearchTreePoint;
                                    CustName: in String10; CustPhone: String10) is
      Ptr, Q: BinarySearchTreePoint;
   begin
      if (Head.Ltag = false) then   -- Empty tree, so insert as root of the tree
         AllocateNode(Q, CustName, CustPhone);
         Head.Llink := Q;
         Head.Ltag := true;
         Q.Rlink := Head;
         Q.Rtag := false;
         Root := Q;
      else
         Ptr := Root;
         loop
            if (CustName < Ptr.Info.Name) then
               if (Ptr.Ltag) then
                  Ptr := Ptr.Llink; -- keep looking to the left
               else
                  AllocateNode(Q, CustName, CustPhone);   -- insert as left subtree
                  Q.Llink := Ptr.Llink;
                  Q.Ltag := Ptr.Ltag;
                  Ptr.Llink := Q;
                  Ptr.Ltag := true;
                  Q.Rlink := Ptr;
                  Q.Rtag := false;
                  exit;
               end if;
            elsif (CustName > Ptr.Info.Name) then
               if (Ptr.Rtag) then
                  Ptr := Ptr.Rlink; -- keep looking to the right
               else
                  AllocateNode(Q, CustName, CustPhone);   -- insert as right subtree
                  Q.Rlink := Ptr.Rlink;
                  Q.Rtag := Ptr.Rtag;
                  Ptr.Rlink := Q;
                  Ptr.Rtag := true;
                  Q.Llink := Ptr;
                  Q.Ltag := false;
                  exit;
               end if;

            else -- Implies CustName matches Ptr.Info.Name

               -- Insert as right subtree of the equal node
               AllocateNode(Q, CustName, CustPhone);
               Q.Rlink := Ptr.Rlink;
               Q.Rtag := Ptr.Rtag;
               Ptr.Rlink := Q;
               Ptr.Rtag := true;
               Q.Llink := Ptr;
               Q.Ltag := false;

               if (Q.Rtag) then
                  InOrderSuccessor(Q).Llink := Q;
               end if;

               exit;

            end if;
         end loop;
      end if;
      NumCust := NumCust + 1;

   end InsertBinarySearchTree;

   --   DeleteRandomNode first determines the parent of the node to delete.
   -- Then the node to delete (DeletePoint) is examined in order to determine
   -- which of the following cases it falls under:
   --     1) DeletePoint is a leaf node (has no children)
   --     2) DeletePoint has only one child (left or right, but not both)
   --     3) DeletePoint has two children
   -- All of the above cases include checks for when the DeletePoint is also the
   -- root of the tree, and makes the appropriate modifications. Lastly, the
   -- node to be deleted is "freed" and the number of nodes is decremented by 1.
   -- Should the DeletePoint be the last node, then the head node is modified to
   -- reflect an empty tree.


   procedure DeleteRandomNode(Root: in out BinarySearchTreePoint;
                              DeletePoint: in BinarySearchTreePoint) is
      T, Q, R, S: BinarySearchTreePoint;
      parent, Temp: BinarySearchTreePoint;
      DeletingRoot: Boolean := false;
   begin
      if (Root = null) then
         put("Cannot delete from empty tree."); new_line;
         return;
      elsif (DeletePoint = null) then
         put("The node to delete does not exist."); new_line;
         return;
      end if;

      -- Find parent of DeletePoint

      if (Head.Llink = DeletePoint) then  -- DeletePoint = Root?
         parent := Head;
         DeletingRoot := true;
      else
         parent := Head.Llink;   -- start search at Root
         loop
            if (DeletePoint.Info.Name < parent.Info.Name) then
               if (parent.Llink = DeletePoint) then
                  exit;   -- DeletePoint is parent's left child
               else
                  parent := parent.Llink;
               end if;
            elsif (DeletePoint.Info.Name > parent.Info.Name) then
               if (parent.Rlink = DeletePoint) then
                  exit;   -- DeletePoint is parent's right child
               else
                  parent := parent.Rlink;
               end if;
            end if;
         end loop;
      end if;

      -- Begin deletion

      T := DeletePoint;
      Q := DeletePoint;

      if (T.Ltag = false and T.Rtag = false) then  -- 1) LEAF NODE CASE
         if (T = parent.Llink) then  -- DP is parent's left child
            parent.Ltag := T.Ltag;
            parent.Llink := T.Llink;

            if (DeletePoint = Root) then
               Root := null;
            end if;

         else                        -- DP is parent's right child
            parent.Rtag := T.Rtag;
            parent.Rlink := T.Rlink;
         end if;

      elsif ((T.Ltag and T.Rtag = false) or (T.Rtag and T.Ltag = false)) then -- 2) ONE CHILD CASE
         if (T = parent.Llink) then -- DP is parent's left child
            if (T.Rtag) then  -- DP has only a right child
               parent.Llink := T.Rlink;
               Temp := InOrderSuccessor(T);
               Temp.Llink := T.Llink;

               if (DeletingRoot) then
                  Root := T.Rlink;
               end if;

            else              -- DP has only a left child
               parent.Llink := T.Llink;
               Temp := InOrderPredecessor(T);
               Temp.Rlink := T.Rlink;

               if (DeletingRoot) then
                  Root := T.Llink;
               end if;

            end if;
         else            -- DP is parent's right child (can't be Root)
            if (T.Rtag) then  -- DP has only a right child
               parent.Rlink := T.Rlink;
               Temp := InOrderSuccessor(T);
               Temp.Llink := T.Llink;
            else              -- DP has only a left child
               parent.Rlink := T.Llink;
               Temp := InOrderPredecessor(T);
               Temp.Rlink := T.Rlink;
            end if;
         end if;

      elsif (T.Ltag and T.Rtag) then        -- 3) TWO CHILD CASE
         R := T.Rlink;
         if (R.Ltag = false) then
            R.Llink := T.Llink;
            R.Ltag := T.Ltag;
            Temp := InOrderPredecessor(T);
            Temp.Rlink := R;
            Q := R;
         else
            S := R.Llink;
            while (S.Ltag /= false) loop
               R := S;
               S := R.Llink;
            end loop;
            S.Llink := T.Llink;     -- S gets T's left child
            S.Ltag := T.Ltag;

            if (S.Rtag) then
               R.Llink := S.Rlink;-- If S has a right child, make R point to it
               R.Ltag := S.Rtag;
            else
               R.Llink := S;      -- S doesn't have a child, R points to S
               R.Ltag := false;
            end if;

            S.Rlink := T.Rlink;     -- S gets T's right child
            S.Rtag := T.Rtag;
            Q := S;
         end if;

         if (T = parent.Llink) then -- DP was parent's left child
            parent.Llink := Q;
         else                       -- DP was parent's right child
            parent.Rlink := Q;
         end if;

         if (DeletingRoot) then
            Root := Q;              -- Update Root pointer if necessary
         end if;

      end if;

      Free(T);                      -- Last: Return the deleted node to Avail
      NumCust := NumCust - 1;       -- and decrement the number of nodes.

      if (NumCust = 0) then    -- Update head when tree is empty
         Head.Ltag := false;
         Head.Llink := Head;
      end if;

   end DeleteRandomNode;


   procedure FindCustomerIterative(Root: in BinarySearchTreePoint;
                                   CustomerName: in String10;
                                   CustomerPoint: out BinarySearchTreePoint) is
       Ptr: BinarySearchTreePoint;
   begin
       if Root = null then
          put("Tree is currently empty."); new_line;
          CustomerPoint := null;
       else
          Ptr := Root;
         loop

            if (CustomerName < Ptr.Info.Name) then
               if (Ptr.Ltag) then
                  Ptr := Ptr.Llink;
               else
                  CustomerPoint := null;
                  exit;
               end if;
            elsif (CustomerName > Ptr.Info.Name) then
               if (Ptr.Rtag) then
                  Ptr := Ptr.Rlink;
               else
                  CustomerPoint := null;
                  exit;
               end if;
            else
                CustomerPoint := Ptr;   -- Search success
                exit;
            end if;

         end loop;

       end if;
   end FindCustomerIterative;


   procedure FindCustomerRecursive(Root: in BinarySearchTreePoint;
                                   CustomerName: in String10;
                                   CustomerPoint: out BinarySearchTreePoint) is
      Ptr: BinarySearchTreePoint;
   begin
      if (Root = null) then
         put("Tree is currently empty."); new_line;
         CustomerPoint := null;
         return;
      end if;

      Ptr := Root;
      if (CustomerName < Ptr.Info.Name) then
         if (Ptr.Ltag) then
            FindCustomerRecursive(Ptr.Llink, CustomerName, CustomerPoint);
         else
            CustomerPoint := null;
         end if;

      elsif (CustomerName > Ptr.Info.Name) then
         if (Ptr.Rtag) then
            FindCustomerRecursive(Ptr.Rlink, CustomerName, CustomerPoint);
         else
            CustomerPoint := null;
         end if;

      else
         CustomerPoint := Ptr;
      end if;
   end FindCustomerRecursive;


   function InOrderSuccessor(TreePoint: in BinarySearchTreePoint)
                             return BinarySearchTreePoint is
       Q: BinarySearchTreePoint;

   begin
       Q := TreePoint.Rlink;
       if (TreePoint.Rtag = false) then
            null;  -- Q points to inorder successor
       else
           while (Q.Ltag) loop
               Q := Q.Llink;
           end loop;
       end if;

       return Q;

   end InOrderSuccessor;

   function InOrderPredecessor(TreePoint: in BinarySearchTreePoint)
                               return BinarySearchTreePoint is
      Q : BinarySearchTreePoint;

   begin
      Q := TreePoint.Llink;

      if (TreePoint.Ltag /= false) then
         while (Q.Rtag) loop
            Q := Q.Rlink;
         end loop;
      end if;
      return Q;

   end InOrderPredecessor;

   procedure PreOrderTraversalIterative(TreePoint: in BinarySearchTreePoint) is

      package Stack is new Gstack(NumCust, BinarySearchTreePoint);
      Pt: BinarySearchTreePoint;
   begin
      Pt := TreePoint;
      loop
         if (Pt /= Head and Pt /= null) then
            DisplayRecord(Pt);
            if (Pt.Ltag) then
               Stack.push(Pt);
               Pt := Pt.Llink;
            elsif (Pt.Rtag) then
               Pt := Pt.Rlink;
            else

               while (Pt.Rtag /= true) loop
                  if (Stack.Count > 0) then
                     Stack.Pop(Pt);
                  else
                     exit;
                  end if;
               end loop;

               Pt := Pt.Rlink;
            end if;
         else
            exit;
         end if;

      end loop;
   end PreOrderTraversalIterative;


   procedure ThreadedPreOrder(TreePoint: in BinarySearchTreePoint) is
      Pt: BinarySearchTreePoint;
   begin
      Pt := TreePoint;
      loop
         exit when Pt = Head;
         put(Pt.Info.Name); new_line;
         if (Pt.Ltag) then
            Pt := Pt.Llink;
         else
            while (Pt.Rtag /= true) loop
               Pt := Pt.Rlink;
            end loop;
            Pt := Pt.Rlink;
         end if;

      end loop;

   end ThreadedPreOrder;


   procedure ReverseInOrder(TreePoint: in BinarySearchTreePoint) is
   begin
      if (TreePoint.Rtag) then
         ReverseInOrder(TreePoint.Rlink);
      end if;
      DisplayRecord(TreePoint);
      if (TreePoint.Ltag) then
         ReverseInOrder(TreePoint.Llink);
      end if;

   end ReverseInOrder;


   function CustomerName(TreePoint: in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.Info.Name;
   end CustomerName;


   function CustomerPhone(TreePoint: in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.Info.PhoneNumber;
   end CustomerPhone;

end BinarySearchTree;
