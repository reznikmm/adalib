--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with System;
with Ada.Containers.Synchronized_Queue_Interfaces;
generic
   with package Queue_Interfaces is new Ada.Containers.Synchronized_Queue_Interfaces (<>);
   Default_Ceiling : System.Any_Priority := System.Priority'Last;
package Ada.Containers.Unbounded_Synchronized_Queues is
   pragma Preelaborate(Unbounded_Synchronized_Queues);

   package Implementation is
       -- not specified by the language
   end Implementation;

   protected type Queue
        (Ceiling : System.Any_Priority := Default_Ceiling)
           with Priority => Ceiling is
        new Queue_Interfaces.Queue with

      overriding
      entry Enqueue (New_Item : in Queue_Interfaces.Element_Type);
      overriding
      entry Dequeue (Element : out Queue_Interfaces.Element_Type);

      overriding
      function Current_Use return Count_Type;
      overriding
      function Peak_Use return Count_Type;

   private
       -- not specified by the language
   end Queue;

private

    -- not specified by the language

end Ada.Containers.Unbounded_Synchronized_Queues;
