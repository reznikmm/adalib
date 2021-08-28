--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------


with Ada.Iterator_Interfaces;
generic
   type Element_Type (<>) is private;
   with function "=" (Left, Right : Element_Type)
      return Boolean is <>;
package Ada.Containers.Indefinite_Doubly_Linked_Lists is
   pragma Preelaborate(Indefinite_Doubly_Linked_Lists);
   pragma Remote_Types(Indefinite_Doubly_Linked_Lists);

   type List is tagged private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
   pragma Preelaborable_Initialization(List);

   type Cursor is private;
   pragma Preelaborable_Initialization(Cursor);

   Empty_List : constant List;

   No_Element : constant Cursor;

   function Has_Element (Position : Cursor) return Boolean;

   package List_Iterator_Interfaces is new
       Ada.Iterator_Interfaces (Cursor, Has_Element);

   function "=" (Left, Right : List) return Boolean;

   function Length (Container : List) return Count_Type;

   function Is_Empty (Container : List) return Boolean;

   procedure Clear (Container : in out List);

   function Element (Position : Cursor)
      return Element_Type;

   procedure Replace_Element (Container : in out List;
                              Position  : in     Cursor;
                              New_Item  : in     Element_Type);

   procedure Query_Element
     (Position : in Cursor;
      Process  : not null access procedure (Element : in Element_Type));

   procedure Update_Element
     (Container : in out List;
      Position  : in     Cursor;
      Process   : not null access procedure
                      (Element : in out Element_Type));

   type Constant_Reference_Type
         (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;

   type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;

   function Constant_Reference (Container : aliased in List;
                                Position  : in Cursor)
      return Constant_Reference_Type;

   function Reference (Container : aliased in out List;
                       Position  : in Cursor)
      return Reference_Type;

   procedure Assign (Target : in out List; Source : in List);

   function Copy (Source : List) return List;

   procedure Move (Target : in out List;
                   Source : in out List);

   procedure Insert (Container : in out List;
                     Before    : in     Cursor;
                     New_Item  : in     Element_Type;
                     Count     : in     Count_Type := 1);

   procedure Insert (Container : in out List;
                     Before    : in     Cursor;
                     New_Item  : in     Element_Type;
                     Position  :    out Cursor;
                     Count     : in     Count_Type := 1);

   procedure Insert (Container : in out List;
                     Before    : in     Cursor;
                     Position  :    out Cursor;
                     Count     : in     Count_Type := 1);

   procedure Prepend (Container : in out List;
                      New_Item  : in     Element_Type;
                      Count     : in     Count_Type := 1);

   procedure Append (Container : in out List;
                     New_Item  : in     Element_Type;
                     Count     : in     Count_Type := 1);

   procedure Delete (Container : in out List;
                     Position  : in out Cursor;
                     Count     : in     Count_Type := 1);

   procedure Delete_First (Container : in out List;
                           Count     : in     Count_Type := 1);

   procedure Delete_Last (Container : in out List;
                          Count     : in     Count_Type := 1);

   procedure Reverse_Elements (Container : in out List);

   procedure Swap (Container : in out List;
                   I, J      : in     Cursor);

   procedure Swap_Links (Container : in out List;
                         I, J      : in     Cursor);

   procedure Splice (Target   : in out List;
                     Before   : in     Cursor;
                     Source   : in out List);

   procedure Splice (Target   : in out List;
                     Before   : in     Cursor;
                     Source   : in out List;
                     Position : in out Cursor);

   procedure Splice (Container: in out List;
                     Before   : in     Cursor;
                     Position : in     Cursor);

   function First (Container : List) return Cursor;

   function First_Element (Container : List)
      return Element_Type;

   function Last (Container : List) return Cursor;

   function Last_Element (Container : List)
      return Element_Type;

   function Next (Position : Cursor) return Cursor;

   function Previous (Position : Cursor) return Cursor;

   procedure Next (Position : in out Cursor);

   procedure Previous (Position : in out Cursor);

   function Find (Container : List;
                  Item      : Element_Type;
                  Position  : Cursor := No_Element)
      return Cursor;

   function Reverse_Find (Container : List;
                          Item      : Element_Type;
                          Position  : Cursor := No_Element)
      return Cursor;

   function Contains (Container : List;
                      Item      : Element_Type) return Boolean;

   procedure Iterate
     (Container : in List;
      Process   : not null access procedure (Position : in Cursor));

   procedure Reverse_Iterate
     (Container : in List;
      Process   : not null access procedure (Position : in Cursor));

   function Iterate (Container : in List)
      return List_Iterator_Interfaces.Reversible_Iterator'Class;

   function Iterate (Container : in List; Start : in Cursor)
      return List_Iterator_Interfaces.Reversible_Iterator'Class;

   generic
      with function "<" (Left, Right : Element_Type)
         return Boolean is <>;
   package Generic_Sorting is

      function Is_Sorted (Container : List) return Boolean;

      procedure Sort (Container : in out List);

      procedure Merge (Target  : in out List;
                       Source  : in out List);

   end Generic_Sorting;

private

   -- not specified by the language

end Ada.Containers.Indefinite_Doubly_Linked_Lists;
