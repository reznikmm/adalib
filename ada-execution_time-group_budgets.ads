--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with System;

package Ada.Execution_Time.Group_Budgets is

   type Group_Budget is tagged limited private;

   type Group_Budget_Handler is
     access protected procedure (GB : in out Group_Budget);

   type Task_Array is
     array (Positive range <>) of Ada.Task_Identification.Task_Id;

   Min_Handler_Ceiling : constant System.Any_Priority
     := implementation_defined;

   procedure Add_Task (GB : in out Group_Budget;
                       T  : in     Ada.Task_Identification.Task_Id);

   procedure Remove_Task (GB : in out Group_Budget;
                          T  : in     Ada.Task_Identification.Task_Id);

   function Is_Member (GB : in Group_Budget;
                       T  : in Ada.Task_Identification.Task_Id)
     return Boolean;

   function Is_A_Group_Member (T : in Ada.Task_Identification.Task_Id)
     return Boolean;

   function Members (GB : in Group_Budget) return Task_Array;

   procedure Replenish (GB : in out Group_Budget;
                        To : in     Ada.Real_Time.Time_Span);

   procedure Add (GB       : in out Group_Budget;
                  Interval : in     Ada.Real_Time.Time_Span);

   function Budget_Has_Expired (GB : in Group_Budget) return Boolean;

   function Budget_Remaining (GB : in Group_Budget)
     return Ada.Real_Time.Time_Span;

   procedure Set_Handler (GB      : in out Group_Budget;
                          Handler : in     Group_Budget_Handler);

   function Current_Handler (GB : in Group_Budget) return Group_Budget_Handler;

   procedure Cancel_Handler (GB        : in out Group_Budget;
                             Cancelled : out    Boolean);

   Group_Budget_Error : exception;

private

   pragma Import (Ada, Group_Budget);

end Ada.Execution_Time.Group_Budgets;
