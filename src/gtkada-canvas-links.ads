------------------------------------------------------------------------------
--                  GtkAda - Ada95 binding for Gtk+/Gnome                   --
--                                                                          --
--      Copyright (C) 1998-2000 E. Briot, J. Brobecker and A. Charlet       --
--                     Copyright (C) 1998-2014, AdaCore                     --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  Various support utilities for the drawing of links in GtkAda.Canvas

with Cairo;   use Cairo;
with Glib;    use Glib;

package Gtkada.Canvas.Links is

   procedure Compute_Layout_For_Straight_Link
     (Canvas : access Interactive_Canvas_Record'Class;
      Link   : access Canvas_Link_Record'Class);
   --  Compute the layout for the link, with a straight line (although
   --  additional waypoints could be added).
   --  The layout is cached in the link itself, and will be used when drawing.

   procedure Compute_Layout_For_Arc_Link
     (Canvas : access Interactive_Canvas_Record'Class;
      Link   : access Canvas_Link_Record'Class;
      Offset : Gint := 1);
   --  Compute the layout for the link, with a curve link.
   --  The offset can be used to make the link more or less curved, in
   --  particular when there are multiple links between the same two objects,
   --  so that they do not override.

   procedure Compute_Layout_For_Orthogonal_Link
     (Canvas : access Interactive_Canvas_Record'Class;
      Link   : access Canvas_Link_Record'Class);
   --  Compute the layout for the link, when it is restricted to vertical and
   --  horizontal lines only.

   procedure Compute_Layout_For_Orthocurve_Link
     (Canvas : access Interactive_Canvas_Record'Class;
      Link   : access Canvas_Link_Record'Class);
   --  Compute the layout for the link

   procedure Draw_Link
     (Canvas           : access Interactive_Canvas_Record'Class;
      Link             : access Canvas_Link_Record'Class;
      Cr               : Cairo.Cairo_Context;
      Show_Annotations : Boolean := True);
   --  Draw the link, using the layout computed earlier via one of the
   --  procedures above.

end Gtkada.Canvas.Links;
