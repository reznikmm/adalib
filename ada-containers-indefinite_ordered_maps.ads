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
   type Key_Type (<>) is private;
   type Element_Type (<>) is private;
   with function "<" (Left, Right : Key_Type) return Boolean is <>;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Ada.Containers.Indefinite_Ordered_Maps is
   pragma Preelaborate(Indefinite_Ordered_Maps);
   pragma Remote_Types(Indefinite_Ordered_Maps);

   function Equivalent_Keys (Left, Right : Key_Type) return Boolean;

   type Map is tagged private
      with Constant_Indexing => Constant_Reference,
           Variable_Indexing => Reference,
           Default_Iterator  => Iterate,
           Iterator_Element  => Element_Type;
   pragma Preelaborable_Initialization(Map);

   type Cursor is private;
   pragma Preelaborable_Initialization(Cursor);

   Empty_Map : constant Map;

   No_Element : constant Cursor;

   function Has_Element (Position : Cursor) return Boolean;

   package Map_Iterator_Interfaces is new
       Ada.Iterator_Interfaces (Cursor, Has_Element);

   function "=" (Left, Right : Map) return Boolean;

   function Length (Container : Map) return Count_Type;

   function Is_Empty (Container : Map) return Boolean;

   procedure Clear (Container : in out Map);

   function Key (Position : Cursor) return Key_Type;

   function Element (Position : Cursor) return Element_Type;

   procedure Replace_Element (Container : in out Map;
                              Position  : in     Cursor;
                              New_Item  : in     Element_Type);

   procedure Query_Element
     (Position : in Cursor;
      Process  : not null access procedure (Key     : in Key_Type;
                                            Element : in Element_Type));

   procedure Update_Element
     (Container : in out Map;
      Position  : in     Cursor;
      Process   : not null access procedure
                      (Key     : in     Key_Type;
                       Element : in out Element_Type));

   type Constant_Reference_Type
         (Element : not null access constant Element_Type) is private
      with Implicit_Dereference => Element;

   type Reference_Type (Element : not null access Element_Type) is private
      with Implicit_Dereference => Element;

   function Constant_Reference (Container : aliased in Map;
                                Position  : in Cursor)
      return Constant_Reference_Type;

   function Reference (Container : aliased in out Map;
                       Position  : in Cursor)
      return Reference_Type;

   function Constant_Reference (Container : aliased in Map;
                                Key       : in Key_Type)
      return Constant_Reference_Type;

   function Reference (Container : aliased in out Map;
                       Key       : in Key_Type)
      return Reference_Type;

   procedure Assign (Target : in out Map; Source : in Map);

   function Copy (Source : Map) return Map;

   procedure Move (Target : in out Map;
                   Source : in out Map);

   procedure Insert (Container : in out Map;
                     Key       : in     Key_Type;
                     New_Item  : in     Element_Type;
                     Position  :    out Cursor;
                     Inserted  :    out Boolean);

   procedure Insert (Container : in out Map;
                     Key       : in     Key_Type;
                     New_Item  : in     Element_Type);

   procedure Include (Container : in out Map;
                      Key       : in     Key_Type;
                      New_Item  : in     Element_Type);

   procedure Replace (Container : in out Map;
                      Key       : in     Key_Type;
                      New_Item  : in     Element_Type);

   procedure Exclude (Container : in out Map;
                      Key       : in     Key_Type);

   procedure Delete (Container : in out Map;
                     Key       : in     Key_Type);

   procedure Delete (Container : in out Map;
                     Position  : in out Cursor);

   procedure Delete_First (Container : in out Map);

   procedure Delete_Last (Container : in out Map);

   function First (Container : Map) return Cursor;

   function First_Element (Container : Map) return Element_Type;

   function First_Key (Container : Map) return Key_Type;

   function Last (Container : Map) return Cursor;

   function Last_Element (Container : Map) return Element_Type;

   function Last_Key (Container : Map) return Key_Type;

   function Next (Position : Cursor) return Cursor;

   procedure Next (Position : in out Cursor);

   function Previous (Position : Cursor) return Cursor;

   procedure Previous (Position : in out Cursor);

   function Find (Container : Map;
                  Key       : Key_Type) return Cursor;

   function Element (Container : Map;
                     Key       : Key_Type) return Element_Type;

   function Floor (Container : Map;
                   Key       : Key_Type) return Cursor;

   function Ceiling (Container : Map;
                     Key       : Key_Type) return Cursor;

   function Contains (Container : Map;
                      Key       : Key_Type) return Boolean;



   function "<" (Left, Right : Cursor) return Boolean;

   function ">" (Left, Right : Cursor) return Boolean;

   function "<" (Left : Cursor; Right : Key_Type) return Boolean;

   function ">" (Left : Cursor; Right : Key_Type) return Boolean;

   function "<" (Left : Key_Type; Right : Cursor) return Boolean;

   function ">" (Left : Key_Type; Right : Cursor) return Boolean;

   procedure Iterate
     (Container : in Map;
      Process   : not null access procedure (Position : in Cursor));

   procedure Reverse_Iterate
     (Container : in Map;
      Process   : not null access procedure (Position : in Cursor));

   function Iterate (Container : in Map)
      return Map_Iterator_Interfaces.Reversible_Iterator'Class;

   function Iterate (Container : in Map; Start : in Cursor)
      return Map_Iterator_Interfaces.Reversible_Iterator'Class;

private

   -- not specified by the language

   type Map is tagged null record;

   Empty_Map : constant Map := (null record);

   type Cursor is null record;

   No_Element : constant Cursor := (null record);

end Ada.Containers.Indefinite_Ordered_Maps;
