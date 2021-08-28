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
   with function Hash (Element : Element_Type) return Hash_Type;
   with function Equivalent_Elements (Left, Right : Element_Type)
                 return Boolean;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Ada.Containers.Hashed_Sets is
   pragma Preelaborate(Hashed_Sets);
   pragma Remote_Types(Hashed_Sets);

  type Set (Capacity : Count_Type;
            Modulus  : Hash_Type) is tagged private
      with Constant_Indexing => Constant_Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
   pragma Preelaborable_Initialization(Set);

   type Cursor is private;
   pragma Preelaborable_Initialization(Cursor);

   Empty_Set : constant Set;

   No_Element : constant Cursor;

   function Has_Element (Position : Cursor) return Boolean;

   package Set_Iterator_Interfaces is new
       Ada.Iterator_Interfaces (Cursor, Has_Element);

   function "=" (Left, Right : Set) return Boolean;

   function Equivalent_Sets (Left, Right : Set) return Boolean;

   function To_Set (New_Item : Element_Type) return Set;

   function Capacity (Container : Set) return Count_Type;

   procedure Reserve_Capacity (Container : in out Set;
                               Capacity  : in     Count_Type);

   function Default_Modulus (Capacity : Count_Type) return Hash_Type;

   function Length (Container : Set) return Count_Type;

   function Is_Empty (Container : Set) return Boolean;

   procedure Clear (Container : in out Set);

   function Element (Position : Cursor) return Element_Type;

   procedure Replace_Element (Container : in out Set;
                              Position  : in     Cursor;
                              New_Item  : in     Element_Type);

   procedure Query_Element
     (Position : in Cursor;
      Process  : not null access procedure (Element : in Element_Type));

   type Constant_Reference_Type
         (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;

   function Constant_Reference (Container : aliased in Set;
                                Position  : in Cursor)
      return Constant_Reference_Type;

   procedure Assign (Target : in out Set; Source : in Set);

   function Copy (Source   : Set;
                  Capacity : Count_Type := 0;
                  Modulus  : Hash_Type := 0) return Set;
   
   procedure Move (Target : in out Set;
                   Source : in out Set);

   procedure Insert (Container : in out Set;
                     New_Item  : in     Element_Type;
                     Position  :    out Cursor;
                     Inserted  :    out Boolean);

   procedure Insert (Container : in out Set;
                     New_Item  : in     Element_Type);

   procedure Include (Container : in out Set;
                      New_Item  : in     Element_Type);

   procedure Replace (Container : in out Set;
                      New_Item  : in     Element_Type);

   procedure Exclude (Container : in out Set;
                      Item      : in     Element_Type);

   procedure Delete (Container : in out Set;
                     Item      : in     Element_Type);

   procedure Delete (Container : in out Set;
                     Position  : in out Cursor);

   procedure Union (Target : in out Set;
                    Source : in     Set);

   function Union (Left, Right : Set) return Set;

   function "or" (Left, Right : Set) return Set renames Union;

   procedure Intersection (Target : in out Set;
                           Source : in     Set);

   function Intersection (Left, Right : Set) return Set;

   function "and" (Left, Right : Set) return Set renames Intersection;

   procedure Difference (Target : in out Set;
                         Source : in     Set);

   function Difference (Left, Right : Set) return Set;

   function "-" (Left, Right : Set) return Set renames Difference;

   procedure Symmetric_Difference (Target : in out Set;
                                   Source : in     Set);

   function Symmetric_Difference (Left, Right : Set) return Set;

   function "xor" (Left, Right : Set) return Set
     renames Symmetric_Difference;

   function Overlap (Left, Right : Set) return Boolean;

   function Is_Subset (Subset : Set;
                       Of_Set : Set) return Boolean;

   function First (Container : Set) return Cursor;

   function Next (Position : Cursor) return Cursor;

   procedure Next (Position : in out Cursor);

   function Find (Container : Set;
                  Item      : Element_Type) return Cursor;

   function Contains (Container : Set;
                      Item      : Element_Type) return Boolean;



   function Equivalent_Elements (Left, Right : Cursor)
     return Boolean;

   function Equivalent_Elements (Left  : Cursor;
                                 Right : Element_Type)
     return Boolean;

   function Equivalent_Elements (Left  : Element_Type;
                                 Right : Cursor)
     return Boolean;

   procedure Iterate
     (Container : in Set;
      Process   : not null access procedure (Position : in Cursor));

   function Iterate (Container : in Set)
      return Set_Iterator_Interfaces.Forward_Iterator'Class;

   generic
      type Key_Type (<>) is private;
      with function Key (Element : Element_Type) return Key_Type;
      with function Hash (Key : Key_Type) return Hash_Type;
      with function Equivalent_Keys (Left, Right : Key_Type)
                                     return Boolean;
   package Generic_Keys is

      function Key (Position : Cursor) return Key_Type;

      function Element (Container : Set;
                        Key       : Key_Type)
        return Element_Type;

      procedure Replace (Container : in out Set;
                         Key       : in     Key_Type;
                         New_Item  : in     Element_Type);

      procedure Exclude (Container : in out Set;
                         Key       : in     Key_Type);

      procedure Delete (Container : in out Set;
                        Key       : in     Key_Type);

      function Find (Container : Set;
                     Key       : Key_Type)
         return Cursor;

      function Contains (Container : Set;
                         Key       : Key_Type)
         return Boolean;

      procedure Update_Element_Preserving_Key
        (Container : in out Set;
         Position  : in     Cursor;
         Process   : not null access procedure
                         (Element : in out Element_Type));

      type Reference_Type
            (Element : not null access Element_Type) is private
         with Implicit_Dereference => Element;

      function Reference_Preserving_Key (Container : aliased in out Set;
                                         Position  : in Cursor)
         return Reference_Type;

      function Constant_Reference (Container : aliased in Set;
                                   Key       : in Key_Type)
         return Constant_Reference_Type;

      function Reference_Preserving_Key (Container : aliased in out Set;
                                         Key       : in Key_Type)
         return Reference_Type;

   end Generic_Keys;

private

    -- not specified by the language

end Ada.Containers.Hashed_Sets;
