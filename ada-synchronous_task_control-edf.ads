--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Real_Time;
with Ada.Task_Identification;
package Ada.Dispatching.EDF is
  subtype Deadline is Ada.Real_Time.Time;
  Default_Deadline : constant Deadline :=
              Ada.Real_Time.Time_Last;
  procedure Set_Deadline (D : in Deadline;
              T : in Ada.Task_Identification.Task_Id :=
              Ada.Task_Identification.Current_Task);
  procedure Delay_Until_And_Set_Deadline (
              Delay_Until_Time : in Ada.Real_Time.Time;
              Deadline_Offset : in Ada.Real_Time.Time_Span);
  function Get_Deadline (T : Ada.Task_Identification.Task_Id :=
              Ada.Task_Identification.Current_Task) return Deadline;
end Ada.Dispatching.EDF;
