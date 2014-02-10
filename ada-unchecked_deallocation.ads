------------------------------------------------------------------------------
--              A d a   r u n - t i m e   s p e c i f i c a t i o n         --
--       ASIS implementation for Gela project, a portable Ada compiler      --
--                          http://gela.ada-ru.org                          --
--                     - - - - - - - - - - - - - - -                        --
--          Read copyright and license at the end of ada.ads file           --
------------------------------------------------------------------------------
--  $Revision$ $Date$

generic
   type Object (<>) is limited private;
   type Name   is access  Object;
procedure Ada.Unchecked_Deallocation (X : in out Name);

pragma Convention (Intrinsic, Ada.Unchecked_Deallocation);
pragma Preelaborate (Ada.Unchecked_Deallocation);



