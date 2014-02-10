------------------------------------------------------------------------------
--              A d a   r u n - t i m e   s p e c i f i c a t i o n         --
--       ASIS implementation for Gela project, a portable Ada compiler      --
--                          http://gela.ada-ru.org                          --
--                     - - - - - - - - - - - - - - -                        --
--          Read copyright and license at the end of ada.ads file           --
------------------------------------------------------------------------------
--  $Revision$ $Date$

with Ada.Containers, Ada.Strings.Wide_Hash;

function Ada.Strings.Wide_Fixed.Wide_Hash (Key : in Wide_String)
  return Ada.Containers.Hash_Type
    renames Ada.Strings.Wide_Hash;
pragma Pure (Wide_Hash);
