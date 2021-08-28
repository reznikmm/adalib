--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Strings.UTF_Encoding is
   pragma Pure (UTF_Encoding);

   -- Declarations common to the string encoding packages
   type Encoding_Scheme is (UTF_8, UTF_16BE, UTF_16LE);

   subtype UTF_String is String;

   subtype UTF_8_String is String;

   subtype UTF_16_Wide_String is Wide_String;

   Encoding_Error : exception;

   BOM_8    : constant UTF_8_String :=
                Character'Val(16#EF#) &
                Character'Val(16#BB#) &
                Character'Val(16#BF#);

   BOM_16BE : constant UTF_String :=
                Character'Val(16#FE#) &
                Character'Val(16#FF#);

   BOM_16LE : constant UTF_String :=
                Character'Val(16#FF#) &
                Character'Val(16#FE#);

   BOM_16   : constant UTF_16_Wide_String :=
               (1 => Wide_Character'Val(16#FEFF#));

   function Encoding (Item    : UTF_String;
                      Default : Encoding_Scheme := UTF_8)
      return Encoding_Scheme;

end Ada.Strings.UTF_Encoding;
