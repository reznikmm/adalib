--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.Maps.Constants is
   pragma Pure (Constants);

   Control_Set           : constant Character_Set;
   Graphic_Set           : constant Character_Set;
   Letter_Set            : constant Character_Set;
   Lower_Set             : constant Character_Set;
   Upper_Set             : constant Character_Set;
   Basic_Set             : constant Character_Set;
   Decimal_Digit_Set     : constant Character_Set;
   Hexadecimal_Digit_Set : constant Character_Set;
   Alphanumeric_Set      : constant Character_Set;
   Special_Set           : constant Character_Set;
   ISO_646_Set           : constant Character_Set;

   Lower_Case_Map        : constant Character_Mapping;
   --Maps to lower case for letters, else identity
   Upper_Case_Map        : constant Character_Mapping;
   --Maps to upper case for letters, else identity
   Basic_Map             : constant Character_Mapping;
   --Maps to basic letter for letters, else identity

private

   pragma Import (Ada, Control_Set);
   pragma Import (Ada, Graphic_Set);
   pragma Import (Ada, Letter_Set);
   pragma Import (Ada, Lower_Set);
   pragma Import (Ada, Upper_Set);
   pragma Import (Ada, Basic_Set);
   pragma Import (Ada, Decimal_Digit_Set);
   pragma Import (Ada, Hexadecimal_Digit_Set);
   pragma Import (Ada, Alphanumeric_Set);
   pragma Import (Ada, Special_Set);
   pragma Import (Ada, ISO_646_Set);

   pragma Import (Ada, Lower_Case_Map);
   pragma Import (Ada, Upper_Case_Map);
   pragma Import (Ada, Basic_Map);

end Ada.Strings.Maps.Constants;



