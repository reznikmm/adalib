--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Real_Time.Timing_Events is

   type Timing_Event is tagged limited private;

   type Timing_Event_Handler is
     access protected procedure (Event : in out Timing_Event);

   procedure Set_Handler (Event   : in out Timing_Event;
                          At_Time : in     Time;
                          Handler : in     Timing_Event_Handler);

   procedure Set_Handler (Event   : in out Timing_Event;
                          In_Time : in     Time_Span;
                          Handler : in     Timing_Event_Handler);

   function Current_Handler (Event : in Timing_Event)
     return Timing_Event_Handler;

   procedure Cancel_Handler (Event     : in out Timing_Event;
                             Cancelled :    out Boolean);

   function Time_Of_Event (Event : in Timing_Event) return Time;

private

   pragma Import (Ada, Timing_Event);

end Ada.Real_Time.Timing_Events;
