--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Task_Identification; use Ada.Task_Identification;

generic
   type Attribute is private;
   Initial_Value : in Attribute;
package Ada.Task_Attributes is

   type Attribute_Handle is access all Attribute;

   function Value (T : Task_Id := Current_Task) return Attribute;

   function Reference (T : Task_Id := Current_Task) return Attribute_Handle;

   procedure Set_Value (Val : in Attribute;
                        T   : in Task_Id := Current_Task);

   procedure Reinitialize (T : in Task_Id := Current_Task);

end Ada.Task_Attributes;

