--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.Maps is
   pragma Pure (Maps);

   -- Representation for a set of character values:
   type Character_Set is private;
   pragma Preelaborable_Initialization (Character_Set);

   Null_Set : constant Character_Set;

   type Character_Range is
      record
         Low  : Character;
         High : Character;
      end record;
   -- Represents Character range Low..High

   type Character_Ranges is
     array (Positive range <>) of Character_Range;

   function To_Set
     (Ranges : in Character_Ranges) return Character_Set;

   function To_Set    (Span   : in Character_Range) return Character_Set;

   function To_Ranges
     (Set    : in Character_Set) return Character_Ranges;

   function "="   (Left, Right : in Character_Set) return Boolean;

   function "not" (Right : in Character_Set)       return Character_Set;
   function "and" (Left, Right : in Character_Set) return Character_Set;
   function "or"  (Left, Right : in Character_Set) return Character_Set;
   function "xor" (Left, Right : in Character_Set) return Character_Set;
   function "-"   (Left, Right : in Character_Set) return Character_Set;

   function Is_In (Element : in Character;
                   Set     : in Character_Set)
                  return Boolean;

   function Is_Subset (Elements : in Character_Set;
                       Set      : in Character_Set)
                      return Boolean;

   function "<=" (Left  : in Character_Set;
                  Right : in Character_Set)
                 return Boolean renames Is_Subset;

   -- Alternative representation for a set of character values:
   subtype Character_Sequence is String;

   function To_Set
     (Sequence  : in Character_Sequence)return Character_Set;

   function To_Set (Singleton : in Character)     return Character_Set;

   function To_Sequence
     (Set  : in Character_Set) return Character_Sequence;

   -- Representation for a character to character mapping:
   type Character_Mapping is private;
   pragma Preelaborable_Initialization (Character_Mapping);

   function Value (Map     : in Character_Mapping;
                   Element : in Character)
                  return Character;

   Identity : constant Character_Mapping;

   function To_Mapping (From, To : in Character_Sequence)
                       return Character_Mapping;

   function To_Domain (Map : in Character_Mapping)
                      return Character_Sequence;
   function To_Range  (Map : in Character_Mapping)
                      return Character_Sequence;

   type Character_Mapping_Function is
     access function (From : in Character) return Character;

private

   pragma Import (Ada, Character_Set);
   pragma Import (Ada, Null_Set);
   pragma Import (Ada, Character_Mapping);
   pragma Import (Ada, Identity);

end Ada.Strings.Maps;



