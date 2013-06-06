note
	description: "Summary description for {MGL_AXIS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MGL_AXIS

inherit
	MGL_ERROR_HELPER

feature {NONE} -- Initialisation

	make(a_graph_pointer:POINTER)
		do
			c_graph_pointer:=a_graph_pointer
			disable_box
			put_label_outside
			enable_label
			enable_tick_rotation_on_vertical_axis
			set_axis_order(['x','y','z'])
			create arrow
			set_origin (0.0, 0.0, 0.0)
		end

feature -- Access

	has_box:BOOLEAN

	enable_box
		do
			has_box:=true
		end

	disable_box
		do
			has_box:=false
		end

	has_label_inside:BOOLEAN

	put_label_inside
		do
			has_label_inside:=true
		end

	put_label_outside
		do
			has_label_inside:=false
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

	arrow:attached MGL_AXIS_ARROW

	origin:attached TUPLE[x,y,z:REAL_64]

	set_origin(a_x,a_y,a_z:REAL_64)
		do
			origin:=[a_x,a_y,a_z]
		end

	draw
		local
			l_opt:STRING
			l_c_dir,l_c_opt,l_c_stl:C_STRING
		do
			clear_error
			{MGL_EXTERNAL}.mgl_set_origin(c_graph_pointer,origin.x,origin.y,origin.z)
			valid_error
			if has_box then
				clear_error
				{MGL_EXTERNAL}.mgl_box(c_graph_pointer)
				valid_error
			else
				l_opt:=get_axis_order_string
				if has_label_inside then
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
				create l_c_opt.make ("")
				clear_error
				{MGL_EXTERNAL}.mgl_axis(c_graph_pointer,l_c_dir.item,l_c_stl.item,l_c_opt.item)
				valid_error
			end
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
