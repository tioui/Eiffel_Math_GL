note
	description: "Summary description for {MGL_AXIS_2D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_AXIS_2D

inherit
	MGL_AXIS_3D
		rename
			axis_order as axis_order_3d,
			set_axis_order as set_axis_order_3d,
			set_origin as set_origin_3d,
			origin as origin_3d
		export
			{NONE} 	axis_order_3d, set_axis_order_3d, draw_z_label_min, draw_z_label_max,
					draw_z_label_center, set_origin_3d, origin_3d, draw_z_grid, set_ticks_z
		redefine
			make,get_axis_order_string, draw_grid
		end

create {MGL_GRAPH_2D}
	make

feature {NONE} -- Initialisation

	make(a_graph_pointer:POINTER)
		do
			Precursor(a_graph_pointer)
			set_axis_order(['x','y'])
		end

feature -- Access

	axis_order:attached TUPLE[first,second:CHARACTER_8]

	set_axis_order(a_axis_order:attached TUPLE[first,second:CHARACTER_8])
		require else
			a_Axis_Order_First_Valid: a_axis_order.first.as_lower = 'x' or a_axis_order.first.as_lower = 'y'
			a_Axis_Order_Second_Valid: a_axis_order.second.as_lower = 'x' or a_axis_order.second.as_lower = 'y'
		do
			axis_order:=a_axis_order
		end

	origin:TUPLE[x,y:REAL_64]
		do
			Result:=[origin_3d.x,origin_3d.y]
		end

	set_origin(a_x,a_y:REAL_64)
		do
			set_origin_3d(a_x,a_y,0.0)
		end

	draw_grid
		do
			draw_grid_imp("xy")
		end

feature {NONE} -- Implementation

	get_axis_order_string:attached STRING
		do
			Result:=""
			Result.append_character (axis_order.first)
			Result.append_character (axis_order.second)
		end

end
