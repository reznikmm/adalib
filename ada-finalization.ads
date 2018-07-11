--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Finalization is
   pragma Preelaborate (Finalization);
   pragma Remote_Types (Finalization);

   type Controlled is abstract tagged private;
   pragma Preelaborable_Initialization (Controlled);

   procedure Initialize  (Object : in out Controlled) is null;
   procedure Adjust      (Object : in out Controlled) is null;
   procedure Finalize    (Object : in out Controlled) is null;

   type Limited_Controlled is abstract tagged limited private;
   pragma Preelaborable_Initialization (Limited_Controlled);

   procedure Initialize  (Object : in out Limited_Controlled) is null;
   procedure Finalize    (Object : in out Limited_Controlled) is null;

private

   pragma Import (Ada, Controlled);
   pragma Import (Ada, Limited_Controlled);

end Ada.Finalization;



