--                    Standard Ada library specification
--  Copyright (c) 2003-2018 Maxim Reznik <reznikmm@gmail.com>
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

package Ada.Characters.Conversions is

   pragma Pure (Conversions);

   function Is_Character (Item : in Wide_Character) return Boolean;

   function Is_String (Item : in Wide_String) return Boolean;

   function Is_Character (Item : in Wide_Wide_Character) return Boolean;

   function Is_String (Item : in Wide_Wide_String) return Boolean;

   function Is_Wide_Character (Item : in Wide_Wide_Character) return Boolean;

   function Is_Wide_String (Item : in Wide_Wide_String) return Boolean;

   function To_Wide_Character (Item : in Character) return Wide_Character;

   function To_Wide_String (Item : in String) return Wide_String;

   function To_Wide_Wide_Character (Item : in Character)
                                   return Wide_Wide_Character;

   function To_Wide_Wide_String (Item : in String) return Wide_Wide_String;

   function To_Wide_Wide_Character (Item : in Wide_Character)
                                   return Wide_Wide_Character;

   function To_Wide_Wide_String (Item : in Wide_String)
                                return Wide_Wide_String;

   function To_Character (Item       : in Wide_Character;
                          Substitute : in Character := ' ')
                         return Character;

   function To_String (Item       : in Wide_String;
                       Substitute : in Character := ' ')
                      return String;

   function To_Character (Item       : in Wide_Wide_Character;
                          Substitute : in Character := ' ')
                         return Character;

   function To_String (Item       : in Wide_Wide_String;
                       Substitute : in Character := ' ')
                      return String;

   function To_Wide_Character (Item       : in Wide_Wide_Character;
                               Substitute : in Wide_Character := ' ')
                              return Wide_Character;

   function To_Wide_String (Item       : in Wide_Wide_String;
                            Substitute : in Wide_Character := ' ')
                           return Wide_String;

end Ada.Characters.Conversions;
