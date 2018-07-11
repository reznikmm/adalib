--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Strings.Wide_Unbounded;

package Ada.Wide_Text_IO.Unbounded_IO is

   procedure Put
     (File : in File_Type;
      Item : in Strings.Wide_Unbounded.Wide_Unbounded_String);

   procedure Put
     (Item : in Strings.Wide_Unbounded.Wide_Unbounded_String);

   procedure Put_Line
     (File : in File_Type;
      Item : in Strings.Wide_Unbounded.Wide_Unbounded_String);

   procedure Put_Line
     (Item : in Strings.Wide_Unbounded.Wide_Unbounded_String);

   function Get_Line
     (File : in File_Type)
     return Strings.Wide_Unbounded.Wide_Unbounded_String;

   function Get_Line
     return Strings.Wide_Unbounded.Wide_Unbounded_String;

   procedure Get_Line
     (File : in File_Type;
      Item : out Strings.Wide_Unbounded.Wide_Unbounded_String);

   procedure Get_Line
     (Item : out Strings.Wide_Unbounded.Wide_Unbounded_String);

end Ada.Wide_Text_IO.Unbounded_IO;

