--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Containers, Ada.Strings.Wide_Wide_Hash;

function Ada.Strings.Wide_Wide_Fixed.Wide_Wide_Hash (Key : in Wide_Wide_String)
  return Ada.Containers.Hash_Type
    renames Ada.Strings.Wide_Wide_Hash;
pragma Pure (Wide_Wide_Hash);
