--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Task_Identification;

package Ada.Asynchronous_Task_Control is

   pragma Preelaborate (Asynchronous_Task_Control);

   procedure Hold (T : in Ada.Task_Identification.Task_Id);

   procedure Continue (T : in Ada.Task_Identification.Task_Id);

   function Is_Held (T : in Ada.Task_Identification.Task_Id) return Boolean;

end Ada.Asynchronous_Task_Control;
