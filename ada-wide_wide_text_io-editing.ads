--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Wide_Wide_Text_IO.Editing is

   type Picture is private;

   function Valid (Pic_String      : in String;
                   Blank_When_Zero : in Boolean := False) return Boolean;

   function To_Picture (Pic_String      : in String;
                        Blank_When_Zero : in Boolean := False)
                       return Picture;

   function Pic_String      (Pic : in Picture) return String;
   function Blank_When_Zero (Pic : in Picture) return Boolean;

   Max_Picture_Length  : constant := implementation_defined;

   Picture_Error       : exception;

   Default_Currency    : constant Wide_Wide_String    := "$";
   Default_Fill        : constant Wide_Wide_Character := '*';
   Default_Separator   : constant Wide_Wide_Character := ',';
   Default_Radix_Mark  : constant Wide_Wide_Character := '.';

   generic
      type Num is delta <> digits <>;

      Default_Currency   : in String
        := Wide_Wide_Text_IO.Editing.Default_Currency;
      Default_Fill       : in Wide_Wide_Character
        := Wide_Wide_Text_IO.Editing.Default_Fill;
      Default_Separator  : in Wide_Wide_Character
        := Wide_Wide_Text_IO.Editing.Default_Separator;
      Default_Radix_Mark : in Wide_Wide_Character
        := Wide_Wide_Text_IO.Editing.Default_Radix_Mark;
   package Decimal_Output is
      function Length (Pic      : in Picture;
                       Currency : in Wide_Wide_String := Default_Currency)
                      return Natural;

      function Valid (Item     : in Num;
                      Pic      : in Picture;
                      Currency : in Wide_Wide_String := Default_Currency)
                     return Boolean;

      function Image
        (Item       : in Num;
         Pic        : in Picture;
         Currency   : in Wide_Wide_String    := Default_Currency;
         Fill       : in Wide_Wide_Character := Default_Fill;
         Separator  : in Wide_Wide_Character := Default_Separator;
         Radix_Mark : in Wide_Wide_Character := Default_Radix_Mark)
        return Wide_Wide_String;

      procedure Put
        (File       : in File_Type;
         Item       : in Num;
         Pic        : in Picture;
         Currency   : in Wide_Wide_String    := Default_Currency;
         Fill       : in Wide_Wide_Character := Default_Fill;
         Separator  : in Wide_Wide_Character := Default_Separator;
         Radix_Mark : in Wide_Wide_Character := Default_Radix_Mark);

      procedure Put
        (Item       : in Num;
         Pic        : in Picture;
         Currency   : in Wide_Wide_String    := Default_Currency;
         Fill       : in Wide_Wide_Character := Default_Fill;
         Separator  : in Wide_Wide_Character := Default_Separator;
         Radix_Mark : in Wide_Wide_Character := Default_Radix_Mark);

      procedure Put
        (To         : out Wide_Wide_String;
         Item       : in Num;
         Pic        : in Picture;
         Currency   : in Wide_Wide_String    := Default_Currency;
         Fill       : in Wide_Wide_Character := Default_Fill;
         Separator  : in Wide_Wide_Character := Default_Separator;
         Radix_Mark : in Wide_Wide_Character := Default_Radix_Mark);
   end Decimal_Output;

private
   pragma Import (Ada, Picture);
end Ada.Wide_Wide_Text_IO.Editing;
