--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Wide_Wide_Characters.Handling is
   pragma Pure(Handling);

   function Character_Set_Version return String;

   function Is_Control (Item : Wide_Wide_Character) return Boolean;

   function Is_Letter (Item : Wide_Wide_Character) return Boolean;

   function Is_Lower (Item : Wide_Wide_Character) return Boolean;

   function Is_Upper (Item : Wide_Wide_Character) return Boolean;

   function Is_Digit (Item : Wide_Wide_Character) return Boolean;

   function Is_Decimal_Digit (Item : Wide_Wide_Character) return Boolean
      renames Is_Digit;

   function Is_Hexadecimal_Digit (Item : Wide_Wide_Character) return Boolean;

   function Is_Alphanumeric (Item : Wide_Wide_Character) return Boolean;

   function Is_Special (Item : Wide_Wide_Character) return Boolean;

   function Is_Line_Terminator (Item : Wide_Wide_Character) return Boolean;

   function Is_Mark (Item : Wide_Wide_Character) return Boolean;

   function Is_Other_Format (Item : Wide_Wide_Character) return Boolean;

   function Is_Punctuation_Connector (Item : Wide_Wide_Character) return Boolean;

   function Is_Space (Item : Wide_Wide_Character) return Boolean;

   function Is_Graphic (Item : Wide_Wide_Character) return Boolean;

   function To_Lower (Item : Wide_Wide_Character) return Wide_Wide_Character;
   function To_Upper (Item : Wide_Wide_Character) return Wide_Wide_Character;

   function To_Lower (Item : Wide_Wide_String) return Wide_Wide_String;
   function To_Upper (Item : Wide_Wide_String) return Wide_Wide_String;

end Ada.Wide_Wide_Characters.Handling;

