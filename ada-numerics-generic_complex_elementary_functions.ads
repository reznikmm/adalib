--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Numerics.Generic_Complex_Types;

generic
   with package Complex_Types is new Ada.Numerics.Generic_Complex_Types (<>);

package Ada.Numerics.Generic_Complex_Elementary_Functions is

   pragma Pure (Generic_Complex_Elementary_Functions);

   function Sqrt (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Log (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Exp (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Exp (X : in Complex_Types.Imaginary) return Complex_Types.Complex;

   function "**" (Left  : in Complex_Types.Complex;
                  Right : in Complex_Types.Complex)
     return Complex_Types.Complex;

   function "**" (Left  : in Complex_Types.Complex;
                  Right : in Complex_Types.Real'Base)
     return Complex_Types.Complex;

   function "**" (Left  : in Complex_Types.Real'Base;
                  Right : in Complex_Types.Complex)
     return Complex_Types.Complex;

   function Sin (X : in  Complex_Types.Complex) return Complex_Types.Complex;

   function Cos (X : in  Complex_Types.Complex) return Complex_Types.Complex;

   function Tan (X : in  Complex_Types.Complex) return Complex_Types.Complex;

   function Cot (X : in  Complex_Types.Complex) return Complex_Types.Complex;

   function Arcsin (X : in  Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arccos (X : in  Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arctan (X : in  Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arccot (X : in  Complex_Types.Complex)
     return Complex_Types.Complex;

   function Sinh (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Cosh (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Tanh (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Coth (X : in Complex_Types.Complex) return Complex_Types.Complex;

   function Arcsinh (X : in Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arccosh (X : in Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arctanh (X : in Complex_Types.Complex)
     return Complex_Types.Complex;

   function Arccoth (X : in Complex_Types.Complex)
     return Complex_Types.Complex;

end Ada.Numerics.Generic_Complex_Elementary_Functions;
