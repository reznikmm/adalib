--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Interrupts;
package Ada.Execution_Time.Interrupts is
   function Clock (Interrupt : Ada.Interrupts.Interrupt_Id)
        return CPU_Time;
   function Supported (Interrupt : Ada.Interrupts.Interrupt_Id)
        return Boolean;
end Ada.Execution_Time.Interrupts;
