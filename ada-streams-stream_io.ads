--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.IO_Exceptions;
package Ada.Streams.Stream_IO is
   pragma Preelaborate(Stream_IO);

   type Stream_Access is access all Root_Stream_Type'Class;

   type File_Type is limited private;

   type File_Mode is (In_File, Out_File, Append_File);

   type    Count          is range 0 .. implementation_defined;
   subtype Positive_Count is Count range 1 .. Count'Last;
   -- Index into file, in stream elements.

   procedure Create (File : in out File_Type;
                     Mode : in File_Mode := Out_File;
                     Name : in String    := "";
                     Form : in String    := "");

   procedure Open (File : in out File_Type;
                   Mode : in File_Mode;
                   Name : in String;
                   Form : in String := "");

   procedure Close  (File : in out File_Type);
   procedure Delete (File : in out File_Type);
   procedure Reset  (File : in out File_Type; Mode : in File_Mode);
   procedure Reset  (File : in out File_Type);

   function Mode (File : in File_Type) return File_Mode;
   function Name (File : in File_Type) return String;
   function Form (File : in File_Type) return String;

   function Is_Open     (File : in File_Type) return Boolean;
   function End_Of_File (File : in File_Type) return Boolean;

   function Stream (File : in File_Type) return Stream_Access;
   -- Return stream access for use with T'Input and T'Output

   -- Read array of stream elements from file
   procedure Read (File : in  File_Type;
                   Item : out Stream_Element_Array;
                   Last : out Stream_Element_Offset;
                   From : in  Positive_Count);

   procedure Read (File : in  File_Type;
                   Item : out Stream_Element_Array;
                   Last : out Stream_Element_Offset);

   -- Write array of stream elements into file
   procedure Write (File : in File_Type;
                    Item : in Stream_Element_Array;
                    To   : in Positive_Count);

   procedure Write (File : in File_Type;
                    Item : in Stream_Element_Array);

   -- Operations on position within file

   procedure Set_Index(File : in File_Type; To : in Positive_Count);

   function Index(File : in File_Type) return Positive_Count;
   function Size (File : in File_Type) return Count;

   procedure Set_Mode(File : in out File_Type; Mode : in File_Mode);

   procedure Flush(File : in out File_Type);

   -- exceptions
   Status_Error : exception renames IO_Exceptions.Status_Error;
   Mode_Error   : exception renames IO_Exceptions.Mode_Error;
   Name_Error   : exception renames IO_Exceptions.Name_Error;
   Use_Error    : exception renames IO_Exceptions.Use_Error;
   Device_Error : exception renames IO_Exceptions.Device_Error;
   End_Error    : exception renames IO_Exceptions.End_Error;
   Data_Error   : exception renames IO_Exceptions.Data_Error;

private

   pragma Import (Ada, File_Type);

end Ada.Streams.Stream_IO;



