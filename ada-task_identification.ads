--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Task_Identification is
   pragma Preelaborate(Task_Identification);

   type Task_Id is private;
   pragma Preelaborable_Initialization (Task_Id);

   Null_Task_Id : constant Task_Id;

   function  "=" (Left, Right : Task_Id) return Boolean;

   function  Image        (T : Task_Id) return String;

   function  Current_Task return Task_Id;
   procedure Abort_Task   (T : in out Task_Id);

   function  Is_Terminated (T : Task_Id) return Boolean;
   function  Is_Callable   (T : Task_Id) return Boolean;
private
   pragma Import (Ada, Task_Id);
   pragma Import (Ada, Null_Task_Id);
end Ada.Task_Identification;
