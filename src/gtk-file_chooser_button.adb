-----------------------------------------------------------------------
--              GtkAda - Ada95 binding for Gtk+/Gnome                --
--                                                                   --
--                Copyright (C) 2006, AdaCore                        --
--                                                                   --
-- This library is free software; you can redistribute it and/or     --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This library is distributed in the hope that it will be useful,   --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- As a special exception, if other files instantiate generics from  --
-- this unit, or you link this unit with other files to produce an   --
-- executable, this  unit  does not  by itself cause  the resulting  --
-- executable to be covered by the GNU General Public License. This  --
-- exception does not however invalidate any other reasons why the   --
-- executable file  might be covered by the  GNU Public License.     --
-----------------------------------------------------------------------

--  <description>
--  </description>
--  <c_version>2.8.17</c_version>
--  <group>Selectors</group>
--  <screenshot>file-button.png</screenshot>

with Gtk.File_Chooser;     use Gtk.File_Chooser;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;

package body Gtk.File_Chooser_Button is

   ---------------
   -- Get_Title --
   ---------------

   function Get_Title
     (Button : access Gtk_File_Chooser_Button_Record)
      return String
   is
      function Internal (Button : System.Address) return chars_ptr;
      pragma Import (C, Internal, "gtk_file_chooser_button_get_title");
   begin
      --  Returned value still owned by gtk+
      return Value (Internal (Get_Object (Button)));
   end Get_Title;

   ---------------------
   -- Get_Width_Chars --
   ---------------------

   function Get_Width_Chars
     (Button : access Gtk_File_Chooser_Button_Record)
      return Gint
   is
      function Internal (Button : System.Address) return Gint;
      pragma Import (C, Internal, "gtk_file_chooser_button_get_width_chars");
   begin
      return Internal (Get_Object (Button));
   end Get_Width_Chars;

   -------------
   -- Gtk_New --
   -------------

   procedure Gtk_New
     (Button : out Gtk_File_Chooser_Button;
      Title  : String;
      Action : Gtk.File_Chooser.File_Chooser_Action) is
   begin
      Button := new Gtk_File_Chooser_Button_Record;
      Initialize (Button, Title, Action);
   end Gtk_New;

   --------------------------
   -- Gtk_New_With_Backend --
   --------------------------

   procedure Gtk_New_With_Backend
     (Button  : out Gtk_File_Chooser_Button;
      Title   : String;
      Action  : Gtk.File_Chooser.File_Chooser_Action;
      Backend : String) is
   begin
      Button := new Gtk_File_Chooser_Button_Record;
      Initialize_With_Backend (Button, Title, Action, Backend);
   end Gtk_New_With_Backend;

   -------------------------
   -- Gtk_New_With_Dialog --
   -------------------------

   procedure Gtk_New_With_Dialog
     (Button  : out Gtk_File_Chooser_Button;
      Dialog  : access Gtk_File_Chooser_Dialog_Record'Class) is
   begin
      Button := new Gtk_File_Chooser_Button_Record;
      Initialize_With_Dialog (Button, Dialog);
   end Gtk_New_With_Dialog;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
     (Button : access Gtk_File_Chooser_Button_Record'Class;
      Title  : String;
      Action : Gtk.File_Chooser.File_Chooser_Action)
   is
      function Internal
        (Title : String; Action : File_Chooser_Action) return System.Address;
      pragma Import (C, Internal, "gtk_file_chooser_button_new");
   begin
      Set_Object (Button, Internal (Title & ASCII.NUL, Action));
   end Initialize;

   -----------------------------
   -- Initialize_With_Backend --
   -----------------------------

   procedure Initialize_With_Backend
     (Button  : access Gtk_File_Chooser_Button_Record'Class;
      Title   : String;
      Action  : Gtk.File_Chooser.File_Chooser_Action;
      Backend : String)
   is
      function Internal
        (Title   : String;
         Action  : File_Chooser_Action;
         Backend : String) return System.Address;
      pragma Import (C, Internal, "gtk_file_chooser_button_new_with_backend");
   begin
      Set_Object
        (Button, Internal (Title & ASCII.NUL, Action, Backend & ASCII.NUL));
   end Initialize_With_Backend;

   ----------------------------
   -- Initialize_With_Dialog --
   ----------------------------

   procedure Initialize_With_Dialog
     (Button : access Gtk_File_Chooser_Button_Record'Class;
      Dialog : access Gtk_File_Chooser_Dialog_Record'Class)
   is
      function Internal (Dialog : System.Address) return System.Address;
      pragma Import (C, Internal, "gtk_file_chooser_button_new_with_dialog");
   begin
      Set_Object (Button, Internal (Get_Object (Dialog)));
   end Initialize_With_Dialog;

   ---------------
   -- Set_Title --
   ---------------

   procedure Set_Title
     (Button : access Gtk_File_Chooser_Button_Record;
      Title  : String)
   is
      procedure Internal (Button : System.Address; Title  : String);
      pragma Import (C, Internal, "gtk_file_chooser_button_set_title");
   begin
      Internal (Get_Object (Button), Title & ASCII.NUL);
   end Set_Title;

   ---------------------
   -- Set_Width_Chars --
   ---------------------

   procedure Set_Width_Chars
     (Button  : access Gtk_File_Chooser_Button_Record;
      N_Chars : Gint)
   is
      procedure Internal (Button  : System.Address; N_Chars : Gint);
      pragma Import (C, Internal, "gtk_file_chooser_button_set_width_chars");
   begin
      Internal (Get_Object (Button), N_Chars);
   end Set_Width_Chars;

end Gtk.File_Chooser_Button;
