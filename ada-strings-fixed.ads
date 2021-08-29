--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Strings.Maps;

package Ada.Strings.Fixed is
   pragma Preelaborate (Fixed);

   -- "Copy" procedure for strings of possibly different lengths

   procedure Move (Source  : in  String;
                   Target  : out String;
                   Drop    : in  Truncation := Error;
                   Justify : in  Alignment  := Left;
                   Pad     : in  Character  := Space);

   -- Search subprograms

   function Index (Source  : in String;
                   Pattern : in String;
                   From    : in Positive;
                   Going   : in Direction := Forward;
                   Mapping : in Maps.Character_Mapping := Maps.Identity)
                  return Natural;

   function Index (Source  : in String;
                   Pattern : in String;
                   From    : in Positive;
                   Going   : in Direction := Forward;
                   Mapping : in Maps.Character_Mapping_Function)
                  return Natural;

   function Index (Source   : in String;
                   Pattern  : in String;
                   Going    : in Direction := Forward;
                   Mapping  : in Maps.Character_Mapping
                     := Maps.Identity)
                  return Natural;

   function Index (Source   : in String;
                   Pattern  : in String;
                   Going    : in Direction := Forward;
                   Mapping  : in Maps.Character_Mapping_Function)
                  return Natural;

   function Index (Source  : in String;
                   Set     : in Maps.Character_Set;
                   From    : in Positive;
                   Test    : in Membership := Inside;
                   Going   : in Direction := Forward)
                  return Natural;

   function Index (Source : in String;
                   Set    : in Maps.Character_Set;
                   Test   : in Membership := Inside;
                   Going  : in Direction  := Forward)
                  return Natural;

   function Index_Non_Blank (Source : in String;
                             From   : in Positive;
                             Going  : in Direction := Forward)
                            return Natural;

   function Index_Non_Blank (Source : in String;
                             Going  : in Direction := Forward)
                            return Natural;

   function Count (Source   : in String;
                   Pattern  : in String;
                   Mapping  : in Maps.Character_Mapping
                     := Maps.Identity)
                  return Natural;

   function Count (Source   : in String;
                   Pattern  : in String;
                   Mapping  : in Maps.Character_Mapping_Function)
                  return Natural;

   function Count (Source   : in String;
                   Set      : in Maps.Character_Set)
                  return Natural;

   procedure Find_Token (Source : in String;
                         Set    : in Maps.Character_Set;
                         Test   : in Membership;
                         First  : out Positive;
                         Last   : out Natural);

   procedure Find_Token (Source : in String;
                         Set    : in Maps.Character_Set;
                         Test   : in Membership;
                         First  : out Positive;
                         Last   : out Natural);

   -- String translation subprograms

   function Translate (Source  : in String;
                       Mapping : in Maps.Character_Mapping)
                      return String;

   procedure Translate (Source  : in out String;
                        Mapping : in Maps.Character_Mapping);

   function Translate (Source  : in String;
                       Mapping : in Maps.Character_Mapping_Function)
                      return String;

   procedure Translate (Source  : in out String;
                        Mapping : in Maps.Character_Mapping_Function);

   -- String transformation subprograms

   function Replace_Slice (Source   : in String;
                           Low      : in Positive;
                           High     : in Natural;
                           By       : in String)
                          return String;

   procedure Replace_Slice (Source   : in out String;
                            Low      : in Positive;
                            High     : in Natural;
                            By       : in String;
                            Drop     : in Truncation := Error;
                            Justify  : in Alignment  := Left;
                            Pad      : in Character  := Space);

   function Insert (Source   : in String;
                    Before   : in Positive;
                    New_Item : in String)
                   return String;

   procedure Insert (Source   : in out String;
                     Before   : in Positive;
                     New_Item : in String;
                     Drop     : in Truncation := Error);

   function Overwrite (Source   : in String;
                       Position : in Positive;
                       New_Item : in String)
                      return String;

   procedure Overwrite (Source   : in out String;
                        Position : in Positive;
                        New_Item : in String;
                        Drop     : in Truncation := Right);

   function Delete (Source  : in String;
                    From    : in Positive;
                    Through : in Natural)
                   return String;

   procedure Delete (Source  : in out String;
                     From    : in Positive;
                     Through : in Natural;
                     Justify : in Alignment := Left;
                     Pad     : in Character := Space);

   --String selector subprograms
   function Trim (Source : in String;
                  Side   : in Trim_End)
                 return String;

   procedure Trim (Source  : in out String;
                   Side    : in Trim_End;
                   Justify : in Alignment := Left;
                   Pad     : in Character := Space);

   function Trim (Source : in String;
                  Left   : in Maps.Character_Set;
                  Right  : in Maps.Character_Set)
                 return String;

   procedure Trim (Source  : in out String;
                   Left    : in Maps.Character_Set;
                   Right   : in Maps.Character_Set;
                   Justify : in Alignment := Strings.Left;
                   Pad     : in Character := Space);

   function Head (Source : in String;
                  Count  : in Natural;
                  Pad    : in Character := Space)
                 return String;

   procedure Head (Source  : in out String;
                   Count   : in Natural;
                   Justify : in Alignment := Left;
                   Pad     : in Character := Space);

   function Tail (Source : in String;
                  Count  : in Natural;
                  Pad    : in Character := Space)
                 return String;

   procedure Tail (Source  : in out String;
                   Count   : in Natural;
                   Justify : in Alignment := Left;
                   Pad     : in Character := Space);

   --String constructor functions

   function "*" (Left  : in Natural;
                 Right : in Character) return String;

   function "*" (Left  : in Natural;
                 Right : in String) return String;

end Ada.Strings.Fixed;
