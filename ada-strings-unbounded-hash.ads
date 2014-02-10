------------------------------------------------------------------------------
--              A d a   r u n - t i m e   s p e c i f i c a t i o n         --
--       ASIS implementation for Gela project, a portable Ada compiler      --
--                          http://gela.ada-ru.org                          --
--                     - - - - - - - - - - - - - - -                        --
--          Read copyright and license at the end of ada.ads file           --
------------------------------------------------------------------------------
--  $Revision$ $Date$

with Ada.Containers;

function Ada.Strings.Unbounded.Hash (Key : in Unbounded_String)
  return Ada.Containers.Hash_Type;

pragma Preelaborate (Hash);
