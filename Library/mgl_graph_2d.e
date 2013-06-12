note
	description: "Summary description for {MGL_GRAPH_2D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_GRAPH_2D

inherit
	MGL_GRAPH_3D
	rename
		axis as axis_3d,
		box as box_3d,
		plot_dots as plot_dots_3d,
		plot_lines as plot_lines_3d,
		set_range as set_range_3d,
		set_coordinate_transformation as set_coordinate_transformation_3d,
		z_axis_rotation as rotation,
		rotate_relative_to_z_axis as rotate
	export
		{NONE} 	axis_3d, box_3d, plot_dots_3d, plot_lines_3d, set_range_3d, z_min, z_max, set_z_min,
				set_z_max, set_z_range, z_coordinate_transformation, set_z_coordinate_transformation,
				set_coordinate_transformation_3d, x_axis_rotation, y_axis_rotation, rotate_relative_to_x_axis,
				rotate_relative_to_y_axis, rotate_relative_to_axis
	redefine
		make
	end

create
	make

feature {NONE} -- Initialisation

	make(a_width,a_height:INTEGER)
		do
			Precursor(a_width,a_height)
			create axis.make(c_graph_pointer)
			create box.make(c_graph_pointer)
		end

feature -- Access

	axis:attached MGL_AXIS_2D

	box: attached MGL_BOX_2D

	plot_function(a_function:attached READABLE_STRING_GENERAL)
		local
			l_c_function, l_c_pen:C_STRING
		do
			create l_c_pen.make (plotting_pen.out)
			create l_c_function.make (a_function)
			clear_error
			{MGL_EXTERNAL}.mgl_fplot(c_graph_pointer,l_c_function.item, l_c_pen.item, c_string_option.item)
			valid_error
		end

	plot_dots(a_points:attached SEQUENCE[TUPLE[x,y:REAL_64]])
		do
			plot_dots_3d(get_3d_coordinates_from_2d(a_points))
		end

	plot_lines(a_points:attached SEQUENCE[TUPLE[x,y:REAL_64]])
		do
			plot_lines_3d(get_3d_coordinates_from_2d(a_points))
		end

	set_range(a_x_min,a_x_max,a_y_min,a_y_max:REAL_64)
		require
			A_X_Valid: a_x_min<a_x_max
			A_Y_Valid: a_y_min<a_y_max
		do
			set_range_3d(a_x_min,a_x_max,a_y_min,a_y_max,0.0,0.0)
		end

	set_coordinate_transformation(a_function_x,a_function_y:READABLE_STRING_GENERAL)
		do
			set_coordinate_transformation_3d(a_function_x,a_function_y,Void)
		end

feature {NONE} -- Implementation

	get_3d_coordinates_from_2d(a_datas:attached SEQUENCE[TUPLE[x,y:REAL_64]]):attached SEQUENCE[TUPLE[x,y,z:REAL_64]]
		local
			l_datas:ARRAYED_LIST[TUPLE[x,y,z:REAL_64]]
		do
			create l_datas.make (a_datas.count)
			from
				a_datas.start
			until
				a_datas.exhausted
			loop
				if attached a_datas.item as l_item then
					l_datas.extend ([l_item.x,l_item.y,0.0])
				end
				a_datas.forth
			end
			Result:=l_datas
		end

end
