--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Real_Time;
with System;

package Ada.Dispatching.Round_Robin is

   Default_Quantum : constant Ada.Real_Time.Time_Span :=
     implementation_defined;

   procedure Set_Quantum (Pri     : in System.Priority;
                          Quantum : in Ada.Real_Time.Time_Span);

   procedure Set_Quantum (Low     : in System.Priority;
                          High    : in System.Priority;
                          Quantum : in Ada.Real_Time.Time_Span);

   function Actual_Quantum (Pri : in System.Priority)
     return Ada.Real_Time.Time_Span;

   function Is_Round_Robin (Pri : in System.Priority) return Boolean;

end Ada.Dispatching.Round_Robin;
