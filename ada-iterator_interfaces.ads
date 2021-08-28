--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

generic
   type Cursor;
   with function Has_Element (Position : Cursor) return Boolean;
package Ada.Iterator_Interfaces is
   pragma Pure (Iterator_Interfaces);

   type Forward_Iterator is limited interface;
   function First (Object : Forward_Iterator) return Cursor is abstract;
   function Next (Object : Forward_Iterator; Position : Cursor)
      return Cursor is abstract;

   type Reversible_Iterator is limited interface and Forward_Iterator;
   function Last (Object : Reversible_Iterator) return Cursor is abstract;
   function Previous (Object : Reversible_Iterator; Position : Cursor)
      return Cursor is abstract;

end Ada.Iterator_Interfaces;
