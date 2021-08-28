--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Calendar;
with Ada.IO_Exceptions;

package Ada.Directories is

   --  Directory and file operations:

   function Current_Directory return String;

   procedure Set_Directory (Directory : in String);

   procedure Create_Directory (New_Directory : in String;
                               Form          : in String := "");

   procedure Delete_Directory (Directory : in String);

   procedure Create_Path (New_Directory : in String;
                          Form          : in String := "");

   procedure Delete_Tree (Directory : in String);

   procedure Delete_File (Name : in String);

   procedure Rename (Old_Name : in String;
                     New_Name : in String);

   procedure Copy_File (Source_Name : in String;
                        Target_Name : in String;
                        Form        : in String := "");

   --  File and directory name operations:

   function Full_Name (Name : in String) return String;

   function Simple_Name (Name : in String) return String;

   function Containing_Directory (Name : in String) return String;

   function Extension (Name : in String) return String;

   function Base_Name (Name : in String) return String;

   function Compose (Containing_Directory : in String := "";
                     Name                 : in String;
                     Extension            : in String := "")
     return String;

   type Name_Case_Kind is
     (Unknown, Case_Sensitive, Case_Insensitive, Case_Preserving);

   function Name_Case_Equivalence (Name : in String) return Name_Case_Kind;

   --  File and directory queries:

   type File_Kind is (Directory, Ordinary_File, Special_File);

   type File_Size is range 0 .. implementation_defined;

   function Exists (Name : in String) return Boolean;

   function Kind (Name : in String) return File_Kind;

   function Size (Name : in String) return File_Size;

   function Modification_Time (Name : in String) return Ada.Calendar.Time;

   --  Directory searching:

   type Directory_Entry_Type is limited private;

   type Filter_Type is array (File_Kind) of Boolean;

   type Search_Type is limited private;

   procedure Start_Search
    (Search     : in out Search_Type;
     Directory  : in     String;
     Pattern    : in     String;
     Filter     : in     Filter_Type := (others => True));

   procedure End_Search (Search : in out Search_Type);

   function More_Entries (Search : in Search_Type) return Boolean;

   procedure Get_Next_Entry (Search          : in out Search_Type;
                             Directory_Entry :    out Directory_Entry_Type);

   procedure Search
    (Directory : in String;
     Pattern   : in String;
     Filter    : in Filter_Type := (others => True);
     Process   : not null access procedure
                  (Directory_Entry : in Directory_Entry_Type));

   --  Operations on Directory Entries:

   function Simple_Name (Directory_Entry : in Directory_Entry_Type)
     return String;

   function Full_Name (Directory_Entry : in Directory_Entry_Type)
     return String;

   function Kind (Directory_Entry : in Directory_Entry_Type)
     return File_Kind;

   function Size (Directory_Entry : in Directory_Entry_Type)
     return File_Size;

   function Modification_Time (Directory_Entry : in Directory_Entry_Type)
     return Ada.Calendar.Time;

   Status_Error : exception renames Ada.IO_Exceptions.Status_Error;
   Name_Error   : exception renames Ada.IO_Exceptions.Name_Error;
   Use_Error    : exception renames Ada.IO_Exceptions.Use_Error;
   Device_Error : exception renames Ada.IO_Exceptions.Device_Error;

private

   pragma Import (Ada, Directory_Entry_Type);
   pragma Import (Ada, Search_Type);

end Ada.Directories;
