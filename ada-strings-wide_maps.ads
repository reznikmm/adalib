--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.Wide_Maps is
   pragma Preelaborate (Wide_Maps);

   -- Representation for a set of Wide_Character values:
   type Wide_Character_Set is private;
   pragma Preelaborable_Initialization (Wide_Character_Set);

   Null_Set : constant Wide_Character_Set;

   type Wide_Character_Range is
      record
         Low  : Wide_Character;
         High : Wide_Character;
      end record;
   -- Represents Wide_Character range Low..High

   type Wide_Character_Ranges is array (Positive range <>)
     of Wide_Character_Range;

   function To_Set    (Ranges : in Wide_Character_Ranges)
                      return Wide_Character_Set;

   function To_Set    (Span   : in Wide_Character_Range)
                      return Wide_Character_Set;

   function To_Ranges (Set    : in Wide_Character_Set)
                      return Wide_Character_Ranges;

   function "="   (Left, Right : in Wide_Character_Set) return Boolean;

   function "not" (Right : in Wide_Character_Set)
                  return Wide_Character_Set;
   function "and" (Left, Right : in Wide_Character_Set)
                  return Wide_Character_Set;
   function "or"  (Left, Right : in Wide_Character_Set)
                  return Wide_Character_Set;
   function "xor" (Left, Right : in Wide_Character_Set)
                  return Wide_Character_Set;
   function "-"   (Left, Right : in Wide_Character_Set)
                  return Wide_Character_Set;

   function Is_In (Element : in Wide_Character;
                   Set     : in Wide_Character_Set)
                  return Boolean;

   function Is_Subset (Elements : in Wide_Character_Set;
                       Set      : in Wide_Character_Set)
                      return Boolean;

   function "<=" (Left  : in Wide_Character_Set;
                  Right : in Wide_Character_Set)
                 return Boolean renames Is_Subset;

   -- Alternative representation for a set of Wide_Character values:
   subtype Wide_Character_Sequence is Wide_String;

   function To_Set (Sequence  : in Wide_Character_Sequence)
                   return Wide_Character_Set;

   function To_Set (Singleton : in Wide_Character)
                   return Wide_Character_Set;

   function To_Sequence (Set  : in Wide_Character_Set)
                        return Wide_Character_Sequence;

   -- Representation for a Wide_Character to Wide_Character mapping:
   type Wide_Character_Mapping is private;
   pragma Preelaborable_Initialization (Wide_Character_Mapping);

   function Value (Map     : in Wide_Character_Mapping;
                   Element : in Wide_Character)
                  return Wide_Character;

   Identity : constant Wide_Character_Mapping;

   function To_Mapping (From, To : in Wide_Character_Sequence)
                       return Wide_Character_Mapping;

   function To_Domain (Map : in Wide_Character_Mapping)
                      return Wide_Character_Sequence;

   function To_Range  (Map : in Wide_Character_Mapping)
                      return Wide_Character_Sequence;

   type Wide_Character_Mapping_Function is
     access function (From : in Wide_Character) return Wide_Character;

private

   pragma Import (Ada, Wide_Character_Set);
   pragma Import (Ada, Null_Set);
   pragma Import (Ada, Wide_Character_Mapping);
   pragma Import (Ada, Identity);

end Ada.Strings.Wide_Maps;



