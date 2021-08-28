--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------


package System.Storage_Pools.Subpools is
   pragma Preelaborate (Subpools);

   type Root_Storage_Pool_With_Subpools is
      abstract new Root_Storage_Pool with private;

   type Root_Subpool is abstract tagged limited private;

   type Subpool_Handle is access all Root_Subpool'Class;
   for Subpool_Handle'Storage_Size use 0;

   function Create_Subpool (Pool : in out Root_Storage_Pool_With_Subpools)
      return not null Subpool_Handle is abstract;

   -- The following operations are intended for pool implementers:

   function Pool_of_Subpool (Subpool : not null Subpool_Handle)
      return access Root_Storage_Pool_With_Subpools'Class;

   procedure Set_Pool_of_Subpool (
      Subpool : in not null Subpool_Handle;
      To : in out Root_Storage_Pool_With_Subpools'Class);

   procedure Allocate_From_Subpool (
      Pool : in out Root_Storage_Pool_With_Subpools;
      Storage_Address : out Address;
      Size_In_Storage_Elements : in Storage_Elements.Storage_Count;
      Alignment : in Storage_Elements.Storage_Count;
      Subpool : in not null Subpool_Handle) is abstract
         with Pre'Class => Pool_of_Subpool(Subpool) = Pool'Access;

   procedure Deallocate_Subpool (
      Pool : in out Root_Storage_Pool_With_Subpools;
      Subpool : in out Subpool_Handle) is abstract
         with Pre'Class => Pool_of_Subpool(Subpool) = Pool'Access;

   function Default_Subpool_for_Pool (
      Pool : in out Root_Storage_Pool_With_Subpools)
         return not null Subpool_Handle;

   overriding
   procedure Allocate (
      Pool : in out Root_Storage_Pool_With_Subpools;
      Storage_Address : out Address;
      Size_In_Storage_Elements : in Storage_Elements.Storage_Count;
      Alignment : in Storage_Elements.Storage_Count);

   overriding
   procedure Deallocate (
      Pool : in out Root_Storage_Pool_With_Subpools;
      Storage_Address : in Address;
      Size_In_Storage_Elements : in Storage_Elements.Storage_Count;
      Alignment : in Storage_Elements.Storage_Count) is null;

   overriding
   function Storage_Size (Pool : Root_Storage_Pool_With_Subpools)
      return Storage_Elements.Storage_Count
          is (Storage_Elements.Storage_Count'Last);

private
    -- not specified by the language
end System.Storage_Pools.Subpools;
