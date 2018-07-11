--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package System is
   pragma Pure (System);

   type Name is (implementation_defined);
   --  implementation_defined-enumeration-type;
   System_Name : constant Name := implementation_defined;

   -- System-Dependent Named Numbers:

   Min_Int               : constant := root_integer'First;
   Max_Int               : constant := root_integer'Last;

   Max_Binary_Modulus    : constant := implementation_defined;
   Max_Nonbinary_Modulus : constant := implementation_defined;

   Max_Base_Digits       : constant := root_real'Digits;
   Max_Digits            : constant := implementation_defined;

   Max_Mantissa          : constant := implementation_defined;
   Fine_Delta            : constant := implementation_defined;

   Tick                  : constant := implementation_defined;

   -- Storage-related Declarations:

   type Address is private; --  implementation_defined;
   Null_Address : constant Address;

   Storage_Unit : constant := implementation_defined;
   Word_Size    : constant := implementation_defined * Storage_Unit;
   Memory_Size  : constant := implementation_defined;

   -- Address Comparison:
   function "<"  (Left, Right : Address) return Boolean;
   function "<=" (Left, Right : Address) return Boolean;
   function ">"  (Left, Right : Address) return Boolean;
   function ">=" (Left, Right : Address) return Boolean;
   function "="  (Left, Right : Address) return Boolean;
   -- function "/=" (Left, Right : Address) return Boolean;
   -- "/=" is implicitly defined
   pragma Convention (Intrinsic, "<");
   pragma Convention (Intrinsic, "<=");
   pragma Convention (Intrinsic, ">");
   pragma Convention (Intrinsic, ">=");
   pragma Convention (Intrinsic, "=");
   -- and so on for all language-defined subprograms in this package

   -- Other System-Dependent Declarations:
   type Bit_Order is (High_Order_First, Low_Order_First);
   Default_Bit_Order : constant Bit_Order := implementation_defined;

   -- Priority-related declarations (see D.1):
   subtype Any_Priority is
     Integer range implementation_defined .. implementation_defined;
   subtype Priority is
     Any_Priority range Any_Priority'First .. implementation_defined;
   subtype Interrupt_Priority is Any_Priority
     range Priority'Last + 1 .. Any_Priority'Last;

   Default_Priority : constant Priority :=
     (Priority'First + Priority'Last) / 2;

private

   pragma Import (Ada, Address);
   pragma Import (Ada, Null_Address);
   pragma Import (Intrinsic, "<");
   pragma Import (Intrinsic, "<=");
   pragma Import (Intrinsic, ">");
   pragma Import (Intrinsic, ">=");
   pragma Import (Intrinsic, "=");

end System;



