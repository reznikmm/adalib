--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Interfaces.C.Strings is
   pragma Preelaborate (Strings);

   type char_array_access is access all char_array;

   type chars_ptr is private;
   pragma Preelaborable_Initialization (chars_ptr);

   type chars_ptr_array is array (size_t range <>) of aliased chars_ptr;

   Null_Ptr : constant chars_ptr;

   function To_Chars_Ptr (Item      : in char_array_access;
                          Nul_Check : in Boolean := False)
                         return chars_ptr;

   function New_Char_Array (Chars   : in char_array) return chars_ptr;

   function New_String (Str : in String) return chars_ptr;

   procedure Free (Item : in out chars_ptr);

   Dereference_Error : exception;

   function Value (Item : in chars_ptr) return char_array;

   function Value (Item : in chars_ptr; Length : in size_t)
                  return char_array;

   function Value (Item : in chars_ptr) return String;

   function Value (Item : in chars_ptr; Length : in size_t)
                  return String;

   function Strlen (Item : in chars_ptr) return size_t;

   procedure Update (Item   : in chars_ptr;
                     Offset : in size_t;
                     Chars  : in char_array;
                     Check  : in Boolean := True);

   procedure Update (Item   : in chars_ptr;
                     Offset : in size_t;
                     Str    : in String;
                     Check  : in Boolean := True);

   Update_Error : exception;

private
   pragma Import (Ada, chars_ptr);
   pragma Import (Ada, Null_Ptr);
end Interfaces.C.Strings;



