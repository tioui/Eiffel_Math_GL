note
	description: "Summary description for {MGL_BOX_3D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_BOX_3D

inherit
	MGL_AXIS_HELPER

create
	make

feature {NONE} -- Initialisation

	make(a_graph_pointer:POINTER)
		do
			c_graph_pointer:=a_graph_pointer
			create panel_color
			create vertices_color
			enable_ticks
			create grid_pen
		end


feature -- Access

	panel_color:attached MGL_COLOR

	vertices_color:attached MGL_COLOR

	has_ticks:BOOLEAN

	enable_ticks
		do
			has_ticks:=True
		end

	disable_ticks
		do
			has_ticks:=False
		end

	draw
		local
			l_color:STRING
			l_c_color:C_STRING
		do
			if panel_color.is_default then
				l_color:=""
			else
				l_color:="@"
			end
			l_color.append (panel_color.out)
			l_color.append (vertices_color.out)
			create l_c_color.make (l_color)
			clear_error
			{MGL_EXTERNAL}.mgl_box_str(c_graph_pointer,l_c_color.item,has_ticks.to_integer)
			valid_error
		end
end
