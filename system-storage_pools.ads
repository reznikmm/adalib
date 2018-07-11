--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Finalization;
with System.Storage_Elements;

package System.Storage_Pools is
   pragma Preelaborate (System.Storage_Pools);

   type Root_Storage_Pool is
     abstract new Ada.Finalization.Limited_Controlled with private;
   pragma Preelaborable_Initialization (Root_Storage_Pool);

   procedure Allocate
     (Pool                     : in out Root_Storage_Pool;
      Storage_Address          :    out Address;
      Size_In_Storage_Elements : in     Storage_Elements.Storage_Count;
      Alignment                : in     Storage_Elements.Storage_Count)
      is abstract;

   procedure Deallocate
     (Pool                     : in out Root_Storage_Pool;
      Storage_Address          : in     Address;
      Size_In_Storage_Elements : in     Storage_Elements.Storage_Count;
      Alignment                : in     Storage_Elements.Storage_Count)
      is abstract;

   function Storage_Size
     (Pool : Root_Storage_Pool)
     return Storage_Elements.Storage_Count
      is abstract;

private

   pragma Import (Ada, Root_Storage_Pool);

end System.Storage_Pools;



