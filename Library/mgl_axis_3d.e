note
	description: "Summary description for {MGL_AXIS_3D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_AXIS_3D

inherit
	MGL_AXIS_HELPER

create {MGL_GRAPH_3D}
	make

feature {NONE} -- Initialisation

	make(a_graph_pointer:POINTER)
		do
			c_graph_pointer:=a_graph_pointer
			put_ticks_label_outside
			enable_label
			enable_tick_rotation_on_vertical_axis
			set_axis_order(['x','y','z'])
			create arrow
			set_ticks_label_size(0.0)
			set_origin (0.0, 0.0, 0.0)
			create grid_pen
		end

feature -- Access


	ticks_label_size:REAL_64 assign set_ticks_label_size

	set_ticks_label_size(a_size: like ticks_label_size)
		require
			a_Size_Not_Negative: a_size>=0
		do
			ticks_label_size:=a_size
		end

	has_ticks_label_inside:BOOLEAN

	put_ticks_label_inside
		do
			has_ticks_label_inside:=true
		end

	put_ticks_label_outside
		do
			has_ticks_label_inside:=false
		end

	has_tick_label:BOOLEAN

	enable_label
		do
			has_tick_label:=true
		end

	disable_label
		do
			has_tick_label:=false
		end

	is_tick_label_rotated_on_vertical_axis:BOOLEAN

	enable_tick_rotation_on_vertical_axis
		do
			is_tick_label_rotated_on_vertical_axis:=True
		end


	disable_tick_rotation_on_vertical_axis
		do
			is_tick_label_rotated_on_vertical_axis:=False
		end

	axis_order:attached TUPLE[first,second,third:CHARACTER_8]

	set_axis_order(a_axis_order:attached TUPLE[first,second,third:CHARACTER_8])
		require
			a_Axis_Order_First_Valid: a_axis_order.first.as_lower = 'x' or a_axis_order.first.as_lower = 'y' or a_axis_order.first.as_lower = 'z'
			a_Axis_Order_Second_Valid: a_axis_order.second.as_lower = 'x' or a_axis_order.second.as_lower = 'y' or a_axis_order.second.as_lower = 'z'
			a_Axis_Order_Third_Valid: a_axis_order.third.as_lower = 'x' or a_axis_order.third.as_lower = 'y' or a_axis_order.third.as_lower = 'z'
		do
			axis_order:=a_axis_order
		end

	origin:attached TUPLE[x,y,z:REAL_64]

	set_origin(a_x,a_y,a_z:REAL_64)
		do
			origin:=[a_x,a_y,a_z]
			clear_error
			{MGL_EXTERNAL}.mgl_set_origin(c_graph_pointer,origin.x,origin.y,origin.z)
			valid_error
		end

	arrow:attached MGL_AXIS_ARROW

	draw
		local
			l_opt:STRING
			l_c_dir,l_c_opt,l_c_stl:C_STRING
		do
			l_opt:=get_axis_order_string
			if has_ticks_label_inside then
				l_opt.to_upper
			end
			if not has_tick_label then
				l_opt:=l_opt+"_"
			end
			if not is_tick_label_rotated_on_vertical_axis then
				l_opt:=l_opt+"U"
			end
			l_opt:=l_opt+arrow.internal_string
			create l_c_dir.make (l_opt)
			create l_c_stl.make ("")
			if ticks_label_size > 0.0 then
				create l_c_opt.make ("size "+ticks_label_size.out)
			else
				create l_c_opt.make ("")
			end
			clear_error
			{MGL_EXTERNAL}.mgl_axis(c_graph_pointer,l_c_dir.item,l_c_stl.item,l_c_opt.item)
			valid_error
		end

feature {NONE} -- Implementation

	get_axis_order_string:attached STRING
		do
			Result:=""
			Result.append_character (axis_order.first)
			Result.append_character (axis_order.second)
			Result.append_character (axis_order.third)
		end

end
