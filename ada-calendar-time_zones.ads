--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Calendar.Time_Zones is

   --  Time zone manipulation:

   type Time_Offset is range -28 * 60 .. 28 * 60;

   Unknown_Zone_Error : exception;

   function UTC_Time_Offset (Date : in Time := Clock) return Time_Offset;

end Ada.Calendar.Time_Zones;
