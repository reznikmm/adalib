--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Environment_Variables is

   pragma Preelaborate (Environment_Variables);

   function Value (Name : in String) return String;

   function Value (Name : in String; Default : in String) return String;

   function Exists (Name : in String) return Boolean;

   procedure Set (Name  : in String;
                  Value : in String);

   procedure Clear (Name : in String);

   procedure Clear;

   procedure Iterate
      (Process : not null access procedure
                                (Name  : in String;
                                 Value : in String));

end Ada.Environment_Variables;
