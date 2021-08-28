--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
   type Element_Type (<>) is private;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Ada.Containers.Indefinite_Holders is
   pragma Preelaborate(Indefinite_Holders);
   pragma Remote_Types(Indefinite_Holders);

   type Holder is tagged private;
   pragma Preelaborable_Initialization (Holder);

   Empty_Holder : constant Holder;

   function "=" (Left, Right : Holder) return Boolean;

   function To_Holder (New_Item : Element_Type) return Holder;

   function Is_Empty (Container : Holder) return Boolean;

   procedure Clear (Container : in out Holder);

   function Element (Container : Holder) return Element_Type;

   procedure Replace_Element (Container : in out Holder;
                              New_Item  : in     Element_Type);

   procedure Query_Element
  (Container : in Holder;
   Process   : not null access procedure (Element : in Element_Type));

   procedure Update_Element
  (Container : in out Holder;
   Process   : not null access procedure (Element : in out Element_Type));

   type Constant_Reference_Type
      (Element : not null access constant Element_Type) is private
   with Implicit_Dereference => Element;

   type Reference_Type (Element : not null access Element_Type) is private
   with Implicit_Dereference => Element;

   function Constant_Reference (Container : aliased in Holder)
   return Constant_Reference_Type;

   function Reference (Container : aliased in out Holder)
   return Reference_Type;

   procedure Assign (Target : in out Holder; Source : in Holder);

   function Copy (Source : Holder) return Holder;

   procedure Move (Target : in out Holder; Source : in out Holder);

private

    -- not specified by the language

end Ada.Containers.Indefinite_Holders;
