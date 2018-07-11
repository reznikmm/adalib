--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package System.Storage_Elements is
   pragma Pure (System.Storage_Elements);

   type Storage_Offset is
     range implementation_defined .. implementation_defined;

   subtype Storage_Count is Storage_Offset range 0 .. Storage_Offset'Last;

   type Storage_Element is mod implementation_defined;
   for Storage_Element'Size use Storage_Unit;

   type Storage_Array is array
     (Storage_Offset range <>) of aliased Storage_Element;
   for Storage_Array'Component_Size use Storage_Unit;

   -- Address Arithmetic:

   function "+" (Left : Address; Right : Storage_Offset)
                return Address;
   function "+" (Left : Storage_Offset; Right : Address)
                return Address;
   function "-" (Left : Address; Right : Storage_Offset)
                return Address;
   function "-" (Left, Right : Address)
                return Storage_Offset;

   function "mod" (Left : Address; Right : Storage_Offset)
                  return Storage_Offset;

   -- Conversion to/from integers:

   type Integer_Address is mod implementation_defined;
   function To_Address (Value : Integer_Address) return Address;
   function To_Integer (Value : Address) return Integer_Address;

   pragma Convention (Intrinsic, "+");
   pragma Convention (Intrinsic, "-");
   pragma Convention (Intrinsic, "mod");
   pragma Convention (Intrinsic, "To_Address");
   pragma Convention (Intrinsic, "To_Integer");
   -- and so on for all language-defined subprograms declared in this package.
end System.Storage_Elements;



