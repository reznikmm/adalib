--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
   type Object (<>) is limited private;
   type Name   is access  Object;
procedure Ada.Unchecked_Deallocation (X : in out Name);

pragma Convention (Intrinsic, Ada.Unchecked_Deallocation);
pragma Preelaborate (Ada.Unchecked_Deallocation);



