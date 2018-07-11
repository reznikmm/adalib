--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Command_Line is
   pragma Preelaborate (Command_Line);

   function Argument_Count return Natural;

   function Argument (Number : in Positive) return String;

   function Command_Name return String;

   type Exit_Status is range implementation_defined .. implementation_defined;

   Success : constant Exit_Status;
   Failure : constant Exit_Status;

   procedure Set_Exit_Status (Code : in Exit_Status);

private

   pragma Import (Ada, Success);
   pragma Import (Ada, Failure);

end Ada.Command_Line;



