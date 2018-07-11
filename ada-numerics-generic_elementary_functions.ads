--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
   type Float_Type is digits <>;

package Ada.Numerics.Generic_Elementary_Functions is
   pragma Pure (Generic_Elementary_Functions);

   function Sqrt
     (X           : Float_Type'Base) return Float_Type'Base;
   function Log
     (X           : Float_Type'Base) return Float_Type'Base;
   function Log
     (X, Base     : Float_Type'Base) return Float_Type'Base;
   function Exp
     (X           : Float_Type'Base) return Float_Type'Base;
   function "**"    (Left, Right : Float_Type'Base) return Float_Type'Base;

   function Sin
     (X           : Float_Type'Base) return Float_Type'Base;
   function Sin
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;
   function Cos
     (X           : Float_Type'Base) return Float_Type'Base;
   function Cos
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;
   function Tan
     (X           : Float_Type'Base) return Float_Type'Base;
   function Tan
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;
   function Cot
     (X           : Float_Type'Base) return Float_Type'Base;
   function Cot
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;

   function Arcsin
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arcsin
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;
   function Arccos
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arccos
     (X, Cycle    : Float_Type'Base) return Float_Type'Base;
   function Arctan  (Y           : Float_Type'Base;
                     X           : Float_Type'Base := 1.0)
                    return Float_Type'Base;
   function Arctan  (Y           : Float_Type'Base;
                     X           : Float_Type'Base := 1.0;
                     Cycle       : Float_Type'Base) return Float_Type'Base;
   function Arccot  (X           : Float_Type'Base;
                     Y           : Float_Type'Base := 1.0)
                    return Float_Type'Base;
   function Arccot  (X           : Float_Type'Base;
                     Y           : Float_Type'Base := 1.0;
                     Cycle       : Float_Type'Base) return Float_Type'Base;

   function Sinh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Cosh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Tanh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Coth
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arcsinh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arccosh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arctanh
     (X           : Float_Type'Base) return Float_Type'Base;
   function Arccoth
     (X           : Float_Type'Base) return Float_Type'Base;

end Ada.Numerics.Generic_Elementary_Functions;



