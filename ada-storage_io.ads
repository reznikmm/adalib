--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.IO_Exceptions;
with System.Storage_Elements;

generic
   type Element_Type is private;
package Ada.Storage_IO is
   pragma Preelaborate (Storage_IO);

   Buffer_Size : constant System.Storage_Elements.Storage_Count
     := implementation_defined;

   subtype Buffer_Type is
     System.Storage_Elements.Storage_Array (1 .. Buffer_Size);

   -- Input and output operations

   procedure Read  (Buffer : in  Buffer_Type; Item : out Element_Type);
   procedure Write (Buffer : out Buffer_Type; Item : in  Element_Type);

   -- Exceptions

   Data_Error   : exception renames IO_Exceptions.Data_Error;

end Ada.Storage_IO;




