--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Synchronous_Barriers is
   pragma Preelaborate(Synchronous_Barriers);

   subtype Barrier_Limit is Positive range 1 .. implementation_defined;

   type Synchronous_Barrier (Release_Threshold : Barrier_Limit) is limited private;

   procedure Wait_For_Release (The_Barrier : in out Synchronous_Barrier;
                               Notified    :    out Boolean);

private
   -- not specified by the language
end Ada.Synchronous_Barriers;
