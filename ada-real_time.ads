--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Real_Time is

   type Time is private;

   Time_First : constant Time;
   Time_Last  : constant Time;

   Time_Unit : constant := implementation_defined;

   type Time_Span is private;

   Time_Span_First : constant Time_Span;
   Time_Span_Last  : constant Time_Span;
   Time_Span_Zero  : constant Time_Span;
   Time_Span_Unit  : constant Time_Span;
   Tick            : constant Time_Span;

   function Clock return Time;

   function "+" (Left  : in Time;
                 Right : in Time_Span)
     return Time;

   function "+" (Left  : in Time_Span;
                 Right : in Time)
     return Time;

   function "-" (Left  : in Time;
                 Right : in Time_Span)
     return Time;

   function "-" (Left  : in Time;
                 Right : in Time)
     return Time_Span;

   function "<" (Left  : in Time;
                 Right : in Time)
     return Boolean;

   function "<=" (Left  : in Time;
                  Right : in Time)
     return Boolean;

   function ">" (Left  : in Time;
                 Right : in Time)
     return Boolean;

   function ">=" (Left  : in Time;
                  Right : in Time)
     return Boolean;

   function "+" (Left  : in Time_Span;
                 Right : in Time_Span)
     return Time_Span;

   function "-" (Left  : in Time_Span;
                 Right : in Time_Span)
     return Time_Span;

   function "-" (Right : in Time_Span) return Time_Span;

   function "*" (Left  : in Time_Span;
                 Right : in Integer)
     return Time_Span;

   function "*" (Left  : in Integer;
                 Right : Time_Span)
     return Time_Span;

   function "/" (Left  : in Time_Span;
                 Right : in Time_Span)
     return Integer;

   function "/" (Left  : in Time_Span;
                 Right : in Integer)
     return Time_Span;

   function "abs" (Right : in Time_Span) return Time_Span;

   function "<" (Left  : in Time_Span;
                 Right : in Time_Span)
     return Boolean;

   function "<=" (Left  : in Time_Span;
                  Right : in Time_Span)
     return Boolean;

   function ">" (Left  : in Time_Span;
                 Right : in Time_Span)
     return Boolean;

   function ">=" (Left  : in Time_Span;
                  Right : in Time_Span)
     return Boolean;

   function To_Duration (TS : in Time_Span) return Duration;

   function To_Time_Span (D : in Duration) return Time_Span;

   function Nanoseconds (NS : in Integer) return Time_Span;

   function Microseconds (US : in Integer) return Time_Span;

   function Milliseconds (MS : in Integer) return Time_Span;

   function Seconds (S : in Integer) return Time_Span;

   function Minutes (M : in Integer) return Time_Span;

   type Seconds_Count is
     range implementation_defined .. implementation_defined;

   procedure Split (T  : in     Time;
                    SC :    out Seconds_Count;
                    TS :    out Time_Span);

   function Time_Of (SC : in Seconds_Count;
                     TS : in Time_Span)
     return Time;

private

   pragma Import (Ada, Time);
   pragma Import (Ada, Time_First);
   pragma Import (Ada, Time_Last);

   pragma Import (Ada, Time_Span);
   pragma Import (Ada, Time_Span_First);
   pragma Import (Ada, Time_Span_Last);
   pragma Import (Ada, Time_Span_Zero);
   pragma Import (Ada, Time_Span_Unit);
   pragma Import (Ada, Tick);

end Ada.Real_Time;
