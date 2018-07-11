--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with System;

package Ada.Interrupts is

   type Interrupt_ID is (Implementation_Defined);

   type Parameterless_Handler is access protected procedure;

   function Is_Reserved (Interrupt : in Interrupt_ID) return Boolean;

   function Is_Attached (Interrupt : in Interrupt_ID) return Boolean;

   function Current_Handler (Interrupt : in Interrupt_ID)
     return Parameterless_Handler;

   procedure Attach_Handler (New_Handler : in Parameterless_Handler;
                             Interrupt   : in Interrupt_ID);

   procedure Exchange_Handler (Old_Handler :    out Parameterless_Handler;
                               New_Handler : in     Parameterless_Handler;
                               Interrupt   : in     Interrupt_ID);

   procedure Detach_Handler (Interrupt : in Interrupt_ID);

   function Reference (Interrupt : in Interrupt_ID) return System.Address;

private

end Ada.Interrupts;
