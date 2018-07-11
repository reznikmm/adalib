--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with System;

package Ada.Execution_Time.Timers is

   type Timer (T : not null access constant Ada.Task_Identification.Task_Id) is
     tagged limited private;

   type Timer_Handler is access protected procedure (TM : in out Timer);

   Min_Handler_Ceiling : constant System.Any_Priority :=
     implementation_defined;

   procedure Set_Handler (TM      : in out Timer;
                          In_Time : in     Ada.Real_Time.Time_Span;
                          Handler : in     Timer_Handler);

   procedure Set_Handler (TM      : in out Timer;
                          At_Time : in     CPU_Time;
                          Handler : in     Timer_Handler);

   function Current_Handler (TM : Timer) return Timer_Handler;

   procedure Cancel_Handler (TM            : in out Timer;
                                 Cancelled :    out Boolean);

   function Time_Remaining (TM : Timer) return Ada.Real_Time.Time_Span;

   Timer_Resource_Error : exception;

private

   pragma Import (Ada, Timer);

end Ada.Execution_Time.Timers;
