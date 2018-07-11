--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Decimal is

   pragma Pure (Decimal);

   Max_Scale : constant := implementation_defined;
   Min_Scale : constant := implementation_defined;

   Min_Delta : constant := 10.0**(-Max_Scale);
   Max_Delta : constant := 10.0**(-Min_Scale);

   Max_Decimal_Digits : constant := implementation_defined;

   generic
      type Dividend_Type is delta <> digits <>;
      type Divisor_Type is delta <> digits <>;
      type Quotient_Type is delta <> digits <>;
      type Remainder_Type is delta <> digits <>;

   procedure Divide (Dividend  : in     Dividend_Type;
                     Divisor   : in     Divisor_Type;
                     Quotient  :    out Quotient_Type;
                     Remainder :    out Remainder_Type);
   pragma Convention (Intrinsic, Divide);

end Ada.Decimal;
