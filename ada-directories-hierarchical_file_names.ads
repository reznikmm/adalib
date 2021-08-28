--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------


package Ada.Directories.Hierarchical_File_Names is

   function Is_Simple_Name (Name : in String) return Boolean;

   function Is_Root_Directory_Name (Name : in String) return Boolean;

   function Is_Parent_Directory_Name (Name : in String) return Boolean;

   function Is_Current_Directory_Name (Name : in String) return Boolean;

   function Is_Full_Name (Name : in String) return Boolean;

   function Is_Relative_Name (Name : in String) return Boolean;

   function Simple_Name (Name : in String) return String
      renames Ada.Directories.Simple_Name;

   function Containing_Directory (Name : in String) return String
      renames Ada.Directories.Containing_Directory;

   function Initial_Directory (Name : in String) return String;

   function Relative_Name (Name : in String) return String;

   function Compose (Directory      : in String := "";
                     Relative_Name  : in String;
                     Extension      : in String := "") return String;

end Ada.Directories.Hierarchical_File_Names;
