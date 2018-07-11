--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Task_Identification; -- See C.7.1
with System;

package Ada.Dynamic_Priorities is

   pragma Preelaborate (Dynamic_Priorities);

   procedure Set_Priority (Priority : in System.Any_Priority;
                           T        : in Ada.Task_Identification.Task_Id
                             := Ada.Task_Identification.Current_Task);

   function Get_Priority (T : in Ada.Task_Identification.Task_Id
                            := Ada.Task_Identification.Current_Task)
     return System.Any_Priority;

end Ada.Dynamic_Priorities;
