--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
    type T (<>) is abstract tagged limited private;
    type Parameters (<>) is limited private;

    with function Constructor (Params : not null access Parameters)
           return T is abstract;

function Ada.Tags.Generic_Dispatching_Constructor
 (The_Tag : in Tag;
  Params  : not null access Parameters)
    return T'Class;
pragma Preelaborate (Ada.Tags.Generic_Dispatching_Constructor);
pragma Convention (Intrinsic, Ada.Tags.Generic_Dispatching_Constructor);
