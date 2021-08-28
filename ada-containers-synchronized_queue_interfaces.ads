--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
   type Element_Type is private;
package Ada.Containers.Synchronized_Queue_Interfaces is
   pragma Pure(Synchronized_Queue_Interfaces);

   type Queue is synchronized interface;

   procedure Enqueue
     (Container : in out Queue;
      New_Item  : in     Element_Type) is abstract
       with Synchronization => By_Entry;

   procedure Dequeue
     (Container : in out Queue;
      Element   :    out Element_Type) is abstract
       with Synchronization => By_Entry;

   function Current_Use (Container : Queue) return Count_Type is abstract;
   function Peak_Use (Container : Queue) return Count_Type is abstract;

end Ada.Containers.Synchronized_Queue_Interfaces;
