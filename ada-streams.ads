--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Streams is
   pragma Pure (Streams);

   type Root_Stream_Type is abstract tagged limited private;
   pragma Preelaborable_Initialization (Root_Stream_Type);

   type Stream_Element is mod implementation_defined;
   type Stream_Element_Offset is range
     implementation_defined .. implementation_defined;

   subtype Stream_Element_Count is
     Stream_Element_Offset range 0..Stream_Element_Offset'Last;

   type Stream_Element_Array is
     array (Stream_Element_Offset range <>) of aliased Stream_Element;

   procedure Read (Stream : in out Root_Stream_Type;
                   Item   : out Stream_Element_Array;
                   Last   : out Stream_Element_Offset) is abstract;

   procedure Write (Stream : in out Root_Stream_Type;
                    Item   : in Stream_Element_Array) is abstract;

private

   pragma Import (Ada, Root_Stream_Type);

end Ada.Streams;



