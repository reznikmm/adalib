--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Tags is
   pragma Preelaborate(Tags);

   type Tag is private;
   pragma Preelaborable_Initialization(Tag);

   No_Tag : constant Tag;

   function Expanded_Name (T : Tag) return String;
   function Wide_Expanded_Name (T : Tag) return Wide_String;
   function Wide_Wide_Expanded_Name (T : Tag) return Wide_Wide_String;

   function External_Tag (T : Tag) return String;
   function Internal_Tag (External : String) return Tag;

   function Descendant_Tag (External : String; Ancestor : Tag) return Tag;

   function Is_Descendant_At_Same_Level
     (Descendant, Ancestor : Tag)
     return Boolean;

   function Parent_Tag (T : Tag) return Tag;

   type Tag_Array is array (Positive range <>) of Tag;

   function Interface_Ancestor_Tags (T : Tag) return Tag_Array;

   Tag_Error : exception;

private

   pragma Import (Ada, Tag);
   pragma Import (Ada, No_Tag);

end Ada.Tags;



