--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Iterator_Interfaces;
generic
   type Element_Type is private;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Ada.Containers.Multiway_Trees is
   pragma Pure(Multiway_Trees);
   pragma Remote_Types(Multiway_Trees);

  type Tree (Capacity : Count_Type) is tagged private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
   pragma Preelaborable_Initialization(Tree);

   type Cursor is private;
   pragma Preelaborable_Initialization(Cursor);

   Empty_Tree : constant Tree;

   No_Element : constant Cursor;

   function Has_Element (Position : Cursor) return Boolean;

   package Tree_Iterator_Interfaces is new
      Ada.Iterator_Interfaces (Cursor, Has_Element);

   function Equal_Subtree (Left_Position : Cursor;
                           Right_Position: Cursor) return Boolean;

   function "=" (Left, Right : Tree) return Boolean;

   function Is_Empty (Container : Tree) return Boolean;

   function Node_Count (Container : Tree) return Count_Type;

   function Subtree_Node_Count (Position : Cursor) return Count_Type;

   function Depth (Position : Cursor) return Count_Type;

   function Is_Root (Position : Cursor) return Boolean;

   function Is_Leaf (Position : Cursor) return Boolean;

   function Root (Container : Tree) return Cursor;

   procedure Clear (Container : in out Tree);

   function Element (Position : Cursor) return Element_Type;

   procedure Replace_Element (Container : in out Tree;
                              Position  : in     Cursor;
                              New_Item  : in     Element_Type);

   procedure Query_Element
     (Position : in Cursor;
      Process  : not null access procedure (Element : in Element_Type));

   procedure Update_Element
     (Container : in out Tree;
      Position  : in     Cursor;
      Process   : not null access procedure
                      (Element : in out Element_Type));

   type Constant_Reference_Type
         (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;

   type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;

   function Constant_Reference (Container : aliased in Tree;
                                Position  : in Cursor)
      return Constant_Reference_Type;

   function Reference (Container : aliased in out Tree;
                       Position  : in Cursor)
      return Reference_Type;

   procedure Assign (Target : in out Tree; Source : in Tree);

   function Copy (Source : Tree; Capacity : Count_Type := 0)
      return Tree;

   procedure Move (Target : in out Tree;
                   Source : in out Tree);

   procedure Delete_Leaf (Container : in out Tree;
                          Position  : in out Cursor);

   procedure Delete_Subtree (Container : in out Tree;
                             Position  : in out Cursor);

   procedure Swap (Container : in out Tree;
                   I, J      : in     Cursor);

   function Find (Container : Tree;
                  Item      : Element_Type)
      return Cursor;

   function Find_In_Subtree (Position : Cursor;
                             Item     : Element_Type)
      return Cursor;

   function Ancestor_Find (Position : Cursor;
                           Item     : Element_Type)
      return Cursor;

   function Contains (Container : Tree;
                      Item      : Element_Type) return Boolean;

   procedure Iterate
     (Container : in Tree;
      Process   : not null access procedure (Position : in Cursor));

   procedure Iterate_Subtree
     (Position  : in Cursor;
      Process   : not null access procedure (Position : in Cursor));

   function Iterate (Container : in Tree)
      return Tree_Iterator_Interfaces.Forward_Iterator'Class;

   function Iterate_Subtree (Position : in Cursor)
      return Tree_Iterator_Interfaces.Forward_Iterator'Class;

   function Child_Count (Parent : Cursor) return Count_Type;

   function Child_Depth (Parent, Child : Cursor) return Count_Type;

   procedure Insert_Child (Container : in out Tree;
                           Parent    : in     Cursor;
                           Before    : in     Cursor;
                           New_Item  : in     Element_Type;
                           Count     : in     Count_Type := 1);

   procedure Insert_Child (Container : in out Tree;
                           Parent    : in     Cursor;
                           Before    : in     Cursor;
                           New_Item  : in     Element_Type;
                           Position  :    out Cursor;
                           Count     : in     Count_Type := 1);

   procedure Insert_Child (Container : in out Tree;
                           Parent    : in     Cursor;
                           Before    : in     Cursor;
                           Position  :    out Cursor;
                           Count     : in     Count_Type := 1);

   procedure Prepend_Child (Container : in out Tree;
                            Parent    : in     Cursor;
                            New_Item  : in     Element_Type;
                            Count     : in     Count_Type := 1);

   procedure Append_Child (Container : in out Tree;
                           Parent    : in     Cursor;
                           New_Item  : in     Element_Type;
                           Count     : in     Count_Type := 1);

   procedure Delete_Children (Container : in out Tree;
                              Parent    : in     Cursor);

   procedure Copy_Subtree (Target   : in out Tree;
                           Parent   : in     Cursor;
                           Before   : in     Cursor;
                           Source   : in     Cursor);

   procedure Splice_Subtree (Target   : in out Tree;
                             Parent   : in     Cursor;
                             Before   : in     Cursor;
                             Source   : in out Tree;
                             Position : in out Cursor);

   procedure Splice_Subtree (Container: in out Tree;
                             Parent   : in     Cursor;
                             Before   : in     Cursor;
                             Position : in     Cursor);

   procedure Splice_Children (Target          : in out Tree;
                              Target_Parent   : in     Cursor;
                              Before          : in     Cursor;
                              Source          : in out Tree;
                              Source_Parent   : in     Cursor);

   procedure Splice_Children (Container       : in out Tree;
                              Target_Parent   : in     Cursor;
                              Before          : in     Cursor;
                              Source_Parent   : in     Cursor);

   function Parent (Position : Cursor) return Cursor;

   function First_Child (Parent : Cursor) return Cursor;

   function First_Child_Element (Parent : Cursor) return Element_Type;

   function Last_Child (Parent : Cursor) return Cursor;

   function Last_Child_Element (Parent : Cursor) return Element_Type;

   function Next_Sibling (Position : Cursor) return Cursor;

   function Previous_Sibling (Position : Cursor) return Cursor;

   procedure Next_Sibling (Position : in out Cursor);

   procedure Previous_Sibling (Position : in out Cursor);

   procedure Iterate_Children
     (Parent  : in Cursor;
      Process : not null access procedure (Position : in Cursor));

   procedure Reverse_Iterate_Children
     (Parent  : in Cursor;
      Process : not null access procedure (Position : in Cursor));

   function Iterate_Children (Container : in Tree; Parent : in Cursor)
      return Tree_Iterator_Interfaces.Reversible_Iterator'Class;

private
    -- not specified by the language
end Ada.Containers.Multiway_Trees;
