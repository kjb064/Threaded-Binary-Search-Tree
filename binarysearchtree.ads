package BinarySearchTree is
   
   subtype String10 is String(1..10);
   
   type BinarySearchTreePoint is private;

   procedure InsertBinarySearchTree(Root: in out BinarySearchTreePoint;
                                    CustName: in String10; CustPhone: String10);
   
   
   procedure DeleteRandomNode(Root: in out BinarySearchTreePoint; 
                              DeletePoint: in BinarySearchTreePoint);
   
   procedure FindCustomerIterative(Root: in BinarySearchTreePoint;
                                   CustomerName: in String10;
                                  CustomerPoint: out BinarySearchTreePoint);
   
   procedure FindCustomerRecursive(Root: in BinarySearchTreePoint;
                                   CustomerName: in String10;
                                   CustomerPoint: out BinarySearchTreePoint);
   
   function InOrderSuccessor(TreePoint: in BinarySearchTreePoint)
                             return BinarySearchTreePoint;
   
   function InOrderPredecessor(TreePoint: in BinarySearchTreePoint)   
                               return BinarySearchTreePoint;
   
   procedure PreOrderTraversalIterative(TreePoint: in BinarySearchTreePoint);
   
   procedure ThreadedPreOrder(TreePoint: in BinarySearchTreePoint);
   
   procedure ReverseInOrder(TreePoint: in BinarySearchTreePoint);
      
   function CustomerName(TreePoint: in BinarySearchTreePoint) return String10;
   
   function CustomerPhone(TreePoint: in BinarySearchTreePoint) return String10;
   
   procedure init_head;
   
   procedure DisplayRecord(Pt: BinarySearchTreePoint);
   
   function Not_Null(Pt: BinarySearchTreePoint) return Boolean;
   
private
   type Customer is record
      Name: String10;
      PhoneNumber: String10;
   end record;
   
   type Node;
   type BinarySearchTreePoint is access Node;
   type Node is record
      Llink, Rlink: BinarySearchTreePoint;
      Ltag, Rtag: Boolean;
      Info: Customer;
   end record;
   
end BinarySearchTree;
