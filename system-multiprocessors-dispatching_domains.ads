--                    Standard Ada library specification
--  Copyright (c) 2004-2016 AXE Consultants
--  Copyright (c) 2004, 2005, 2006 Ada-Europe
--  Copyright (c) 2000 The MITRE Corporation, Inc.
--  Copyright (c) 1992, 1993, 1994, 1995 Intermetrics, Inc.
--  SPDX-License-Identifier: BSD-3-Clause and LicenseRef-AdaReferenceManual
---------------------------------------------------------------------------

with Ada.Real_Time;
with Ada.Task_Identification;
package System.Multiprocessors.Dispatching_Domains is

   Dispatching_Domain_Error : exception;

   type Dispatching_Domain (<>) is limited private;

   System_Dispatching_Domain : constant Dispatching_Domain;

   function Create (First : CPU; Last : CPU_Range) return Dispatching_Domain;

   function Get_First_CPU (Domain : Dispatching_Domain) return CPU;

   function Get_Last_CPU  (Domain : Dispatching_Domain) return CPU_Range;

   type CPU_Set is array(CPU range <>) of Boolean;

   function Create (Set : CPU_Set) return Dispatching_Domain;

   function Get_CPU_Set (Domain : Dispatching_Domain) return CPU_Set;

   function Get_Dispatching_Domain
      (T   : Ada.Task_Identification.Task_Id :=
                 Ada.Task_Identification.Current_Task)
           return Dispatching_Domain;

   procedure Assign_Task
      (Domain : in out Dispatching_Domain;
       CPU    : in     CPU_Range := Not_A_Specific_CPU;
       T      : in     Ada.Task_Identification.Task_Id :=
                 Ada.Task_Identification.Current_Task);

   procedure Set_CPU
      (CPU : in CPU_Range;
       T   : in Ada.Task_Identification.Task_Id :=
                 Ada.Task_Identification.Current_Task);

   function Get_CPU
      (T   : Ada.Task_Identification.Task_Id :=
                 Ada.Task_Identification.Current_Task)
           return CPU_Range;

   procedure Delay_Until_And_Set_CPU
      (Delay_Until_Time : in Ada.Real_Time.Time; CPU : in CPU_Range);

private
    -- not specified by the language
end System.Multiprocessors.Dispatching_Domains;
