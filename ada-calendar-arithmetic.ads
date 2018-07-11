--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Calendar.Arithmetic is

   --  Arithmetic on days:

   type Day_Count is
     range -366 * (1 + Year_Number'Last - Year_Number'First)
       ..  366 * (1 + Year_Number'Last - Year_Number'First);

   subtype Leap_Seconds_Count is Integer range -2047 .. 2047;

   procedure Difference (Left         : in     Time;
                         Right        : in     Time;
                         Days         :    out Day_Count;
                         Seconds      :    out Duration;
                         Leap_Seconds :    out Leap_Seconds_Count);

   function "+" (Left  : in Time;
                 Right : in Day_Count)
                return Time;

   function "+" (Left  : in Day_Count;
                 Right : in Time)
                return Time;

   function "-" (Left  : in Time;
                 Right : in Day_Count)
                return Time;

   function "-" (Left  : in Time;
                 Right : in Time)
                return Day_Count;

end Ada.Calendar.Arithmetic;
