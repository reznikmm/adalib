--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Strings.Wide_Maps;
package Ada.Strings.Wide_Unbounded is
   pragma Preelaborate (Wide_Unbounded);

   type Unbounded_Wide_String is private;
   pragma Preelaborable_Initialization (Unbounded_Wide_String);

   Null_Unbounded_Wide_String : constant Unbounded_Wide_String;

   function Length (Source : in Unbounded_Wide_String) return Natural;

   type Wide_String_Access is access all Wide_String;
   procedure Free (X : in out Wide_String_Access);

   -- Conversion, Concatenation, and Selection functions

   function To_Unbounded_Wide_String (Source : in Wide_String)
                                return Unbounded_Wide_String;

   function To_Unbounded_Wide_String (Length : in Natural)
                                return Unbounded_Wide_String;

   function To_Wide_String (Source : in Unbounded_Wide_String)
                           return Wide_String;

   procedure Set_Unbounded_Wide_String
     (Target :    out Unbounded_Wide_String;
      Source : in     Wide_String);

   procedure Append (Source   : in out Unbounded_Wide_String;
                     New_Item : in Unbounded_Wide_String);

   procedure Append (Source   : in out Unbounded_Wide_String;
                     New_Item : in Wide_String);

   procedure Append (Source   : in out Unbounded_Wide_String;
                     New_Item : in Wide_Character);

   function "&" (Left, Right : in Unbounded_Wide_String)
                return Unbounded_Wide_String;

   function "&" (Left  : in Unbounded_Wide_String;
                 Right : in Wide_String)
                return Unbounded_Wide_String;

   function "&" (Left  : in Wide_String;
                 Right : in Unbounded_Wide_String)
                return Unbounded_Wide_String;

   function "&" (Left  : in Unbounded_Wide_String;
                 Right : in Wide_Character)
                return Unbounded_Wide_String;

   function "&" (Left  : in Wide_Character;
                 Right : in Unbounded_Wide_String)
                return Unbounded_Wide_String;

   function Element (Source : in Unbounded_Wide_String;
                     Index  : in Positive)
                    return Wide_Character;

   procedure Replace_Element (Source : in out Unbounded_Wide_String;
                              Index  : in Positive;
                              By     : in Wide_Character);

   function Slice (Source : in Unbounded_Wide_String;
                   Low    : in Positive;
                   High   : in Natural)
                  return Wide_String;

   function Unbounded_Slice
     (Source : in Unbounded_Wide_String;
      Low    : in Positive;
      High   : in Natural)
     return Unbounded_Wide_String;

   procedure Unbounded_Slice
     (Source : in     Unbounded_Wide_String;
      Target :    out Unbounded_Wide_String;
      Low    : in     Positive;
      High   : in     Natural);

   function "="  (Left, Right : in Unbounded_Wide_String) return Boolean;

   function "="  (Left  : in Unbounded_Wide_String;
                  Right : in Wide_String)
                 return Boolean;

   function "="  (Left  : in Wide_String;
                  Right : in Unbounded_Wide_String)
                 return Boolean;

   function "<"  (Left, Right : in Unbounded_Wide_String) return Boolean;

   function "<"  (Left  : in Unbounded_Wide_String;
                  Right : in Wide_String)
                 return Boolean;

   function "<"  (Left  : in Wide_String;
                  Right : in Unbounded_Wide_String)
                 return Boolean;

   function "<=" (Left, Right : in Unbounded_Wide_String) return Boolean;

   function "<="  (Left  : in Unbounded_Wide_String;
                   Right : in Wide_String)
                  return Boolean;

   function "<="  (Left  : in Wide_String;
                   Right : in Unbounded_Wide_String)
                  return Boolean;

   function ">"  (Left, Right : in Unbounded_Wide_String) return Boolean;

   function ">"  (Left  : in Unbounded_Wide_String;
                  Right : in Wide_String)
                 return Boolean;

   function ">"  (Left  : in Wide_String;
                  Right : in Unbounded_Wide_String)
                 return Boolean;

   function ">=" (Left, Right : in Unbounded_Wide_String) return Boolean;

   function ">="  (Left : in Unbounded_Wide_String; Right : in Wide_String)
                  return Boolean;

   function ">="  (Left  : in Wide_String;
                   Right : in Unbounded_Wide_String)
                  return Boolean;

   -- Search subprograms

   function Index (Source  : in Unbounded_Wide_String;
                   Pattern : in Wide_String;
                   From    : in Positive;
                   Going   : in Direction := Forward;
                   Mapping : in Wide_Maps.Wide_Character_Mapping
                     := Wide_Maps.Identity)
                  return Natural;

   function Index (Source  : in Unbounded_Wide_String;
                   Pattern : in Wide_String;
                   From    : in Positive;
                   Going   : in Direction := Forward;
                   Mapping : in Wide_Maps.Wide_Character_Mapping_Function)
                  return Natural;

   function Index (Source   : in Unbounded_Wide_String;
                   Pattern  : in Wide_String;
                   Going    : in Direction := Forward;
                   Mapping  : in Wide_Maps.Wide_Character_Mapping
                     := Wide_Maps.Identity)
                  return Natural;

   function Index (Source   : in Unbounded_Wide_String;
                   Pattern  : in Wide_String;
                   Going    : in Direction := Forward;
                   Mapping  : in Wide_Maps.Wide_Character_Mapping_Function)
                  return Natural;

   function Index (Source : in Unbounded_Wide_String;
                   Set    : in Wide_Maps.Wide_Character_Set;
                   From   : in Positive;
                   Test   : in Membership := Inside;
                   Going  : in Direction := Forward)
                  return Natural;

   function Index (Source : in Unbounded_Wide_String;
                   Set    : in Wide_Maps.Wide_Character_Set;
                   Test   : in Membership := Inside;
                   Going  : in Direction  := Forward) return Natural;

   function Index_Non_Blank (Source : in Unbounded_Wide_String;
                             From   : in Positive;
                             Going  : in Direction := Forward)
                            return Natural;

   function Index_Non_Blank (Source : in Unbounded_Wide_String;
                             Going  : in Direction := Forward)
                            return Natural;

   function Count (Source   : in Unbounded_Wide_String;
                   Pattern  : in Wide_String;
                   Mapping  : in Wide_Maps.Wide_Character_Mapping
                     := Wide_Maps.Identity)
                  return Natural;

   function Count (Source   : in Unbounded_Wide_String;
                   Pattern  : in Wide_String;
                   Mapping  : in Wide_Maps.Wide_Character_Mapping_Function)
                  return Natural;

   function Count (Source   : in Unbounded_Wide_String;
                   Set      : in Wide_Maps.Wide_Character_Set)
                  return Natural;

   procedure Find_Token (Source : in Unbounded_Wide_String;
                         Set    : in Wide_Maps.Wide_Character_Set;
                         Test   : in Membership;
                         First  : out Positive;
                         Last   : out Natural);

   -- Wide_String translation subprograms

   function Translate (Source  : in Unbounded_Wide_String;
                       Mapping : in Wide_Maps.Wide_Character_Mapping)
                      return Unbounded_Wide_String;

   procedure Translate (Source  : in out Unbounded_Wide_String;
                        Mapping : in Wide_Maps.Wide_Character_Mapping);

   function Translate (Source  : in Unbounded_Wide_String;
                       Mapping : in Wide_Maps.Wide_Character_Mapping_Function)
                      return Unbounded_Wide_String;

   procedure Translate
     (Source  : in out Unbounded_Wide_String;
      Mapping : in Wide_Maps.Wide_Character_Mapping_Function);

   -- Wide_String transformation subprograms

   function Replace_Slice (Source   : in Unbounded_Wide_String;
                           Low      : in Positive;
                           High     : in Natural;
                           By       : in Wide_String)
                          return Unbounded_Wide_String;

   procedure Replace_Slice (Source   : in out Unbounded_Wide_String;
                            Low      : in Positive;
                            High     : in Natural;
                            By       : in Wide_String);

   function Insert (Source   : in Unbounded_Wide_String;
                    Before   : in Positive;
                    New_Item : in Wide_String)
                   return Unbounded_Wide_String;

   procedure Insert (Source   : in out Unbounded_Wide_String;
                     Before   : in Positive;
                     New_Item : in Wide_String);

   function Overwrite (Source    : in Unbounded_Wide_String;
                       Position  : in Positive;
                       New_Item  : in Wide_String)
                      return Unbounded_Wide_String;

   procedure Overwrite (Source    : in out Unbounded_Wide_String;
                        Position  : in Positive;
                        New_Item  : in Wide_String);

   function Delete (Source  : in Unbounded_Wide_String;
                    From    : in Positive;
                    Through : in Natural)
                   return Unbounded_Wide_String;

   procedure Delete (Source  : in out Unbounded_Wide_String;
                     From    : in Positive;
                     Through : in Natural);

   function Trim (Source : in Unbounded_Wide_String;
                  Side   : in Trim_End)
                 return Unbounded_Wide_String;

   procedure Trim (Source : in out Unbounded_Wide_String;
                   Side   : in Trim_End);

   function Trim (Source : in Unbounded_Wide_String;
                  Left   : in Wide_Maps.Wide_Character_Set;
                  Right  : in Wide_Maps.Wide_Character_Set)
                 return Unbounded_Wide_String;

   procedure Trim (Source : in out Unbounded_Wide_String;
                   Left   : in Wide_Maps.Wide_Character_Set;
                   Right  : in Wide_Maps.Wide_Character_Set);

   function Head (Source : in Unbounded_Wide_String;
                  Count  : in Natural;
                  Pad    : in Wide_Character := Wide_Space)
                 return Unbounded_Wide_String;

   procedure Head (Source : in out Unbounded_Wide_String;
                   Count  : in Natural;
                   Pad    : in Wide_Character := Wide_Space);

   function Tail (Source : in Unbounded_Wide_String;
                  Count  : in Natural;
                  Pad    : in Wide_Character := Wide_Space)
                 return Unbounded_Wide_String;

   procedure Tail (Source : in out Unbounded_Wide_String;
                   Count  : in Natural;
                   Pad    : in Wide_Character := Wide_Space);

   function "*" (Left  : in Natural;
                 Right : in Wide_Character)
                return Unbounded_Wide_String;

   function "*" (Left  : in Natural;
                 Right : in Wide_String)
                return Unbounded_Wide_String;

   function "*" (Left  : in Natural;
                 Right : in Unbounded_Wide_String)
                return Unbounded_Wide_String;

private

   pragma Import (Ada, Unbounded_Wide_String);
   pragma Import (Ada, Null_Unbounded_Wide_String);

end Ada.Strings.Wide_Unbounded;



