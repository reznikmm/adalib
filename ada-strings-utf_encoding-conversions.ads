--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.UTF_Encoding.Conversions is
   pragma Pure (Conversions);

   -- Conversions between various encoding schemes
   function Convert (Item          : UTF_String;
                     Input_Scheme  : Encoding_Scheme;
                     Output_Scheme : Encoding_Scheme;
                     Output_BOM    : Boolean := False) return UTF_String;

   function Convert (Item          : UTF_String;
                     Input_Scheme  : Encoding_Scheme;
                     Output_BOM    : Boolean := False)
      return UTF_16_Wide_String;

   function Convert (Item          : UTF_8_String;
                     Output_BOM    : Boolean := False)
      return UTF_16_Wide_String;

   function Convert (Item          : UTF_16_Wide_String;
                     Output_Scheme : Encoding_Scheme;
                     Output_BOM    : Boolean := False) return UTF_String;

   function Convert (Item          : UTF_16_Wide_String;
                     Output_BOM    : Boolean := False) return UTF_8_String;

end Ada.Strings.UTF_Encoding.Conversions;
