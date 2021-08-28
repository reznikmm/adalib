--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Locales is
   pragma Preelaborate(Locales);
   pragma Remote_Types(Locales);

   type Language_Code is new String (1 .. 3)
      with Dynamic_Predicate =>
         (for all E of Language_Code => E in 'a' .. 'z');
   type Country_Code is new String (1 .. 2)
      with Dynamic_Predicate =>
         (for all E of Country_Code  => E in 'A' .. 'Z');

   Language_Unknown : constant Language_Code := "und";
   Country_Unknown : constant Country_Code := "ZZ";

   function Language return Language_Code;
   function Country return Country_Code;

end Ada.Locales;
