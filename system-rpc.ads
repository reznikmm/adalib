--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Streams; -- see 13.13.1

package System.RPC is

   type Partition_Id is range 0 .. implementation_defined;

   Communication_Error : exception;

   type Params_Stream_Type (Initial_Size : Ada.Streams.Stream_Element_Count) is
     new Ada.Streams.Root_Stream_Type with private;

   procedure Read (Stream : in out Params_Stream_Type;
                   Item   :    out Ada.Streams.Stream_Element_Array;
                   Last   :    out Ada.Streams.Stream_Element_Offset);

   procedure Write (Stream : in out Params_Stream_Type;
                    Item   : in     Ada.Streams.Stream_Element_Array);

   --  Synchronous call

   procedure Do_RPC (Partition : in Partition_Id;
                     Params    : access Params_Stream_Type;
                     Result    : access Params_Stream_Type);

   --  Asynchronous call

   procedure Do_APC (Partition : in Partition_Id;
                     Params    : access Params_Stream_Type);

   --  The handler for incoming RPCs

   type RPC_Receiver is access procedure (Params : access Params_Stream_Type;
                                          Result : access Params_Stream_Type);

   procedure Establish_RPC_Receiver (Partition : in Partition_Id;
                                     Receiver  : in RPC_Receiver);

private

   pragma Import (Ada, Params_Stream_Type);

end System.RPC;
