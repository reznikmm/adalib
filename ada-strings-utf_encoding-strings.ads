--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.UTF_Encoding.Strings is
   pragma Pure (Strings);

   -- Encoding / decoding between String and various encoding schemes
   function Encode (Item          : String;
                    Output_Scheme : Encoding_Scheme;
                    Output_BOM    : Boolean  := False) return UTF_String;

   function Encode (Item       : String;
                    Output_BOM : Boolean  := False) return UTF_8_String;

   function Encode (Item       : String;
                    Output_BOM : Boolean  := False)
      return UTF_16_Wide_String;

   function Decode (Item         : UTF_String;
                    Input_Scheme : Encoding_Scheme) return String;

   function Decode (Item : UTF_8_String) return String;

   function Decode (Item : UTF_16_Wide_String) return String;

end Ada.Strings.UTF_Encoding.Strings;
