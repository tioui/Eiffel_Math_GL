note
	description: "Summary description for {MGL_GRAPH_2D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_GRAPH_2D
inherit
	DISPOSABLE
	MGL_ERROR_HELPER

create
	make
feature {NONE} -- Initialisation

	make(a_width,a_height:INTEGER)
		require
			A_Width_Valid: a_width>0
			A_Width_Valid: a_height>0
		do
			c_graph_pointer:={MGL_EXTERNAL}.mgl_create_graph(a_width,a_height)
			valid_error
			clear_error
			create {MGL_AXIS_2D} axis.make(c_graph_pointer)
			valid_error
			create c_string_pen.make ("")
			create c_string_option.make ("")
			create plotting_pen
		end

feature -- Access

	title:READABLE_STRING_GENERAL

	title_size:REAL_64

	set_title(a_title:attached READABLE_STRING_GENERAL; a_size:REAL_64)
			-- Set the title of the graph.
		local
			l_c_title, l_c_font:C_STRING
		do
			title:=a_title
			title_size:=a_size
			create l_c_title.make (a_title)
			create l_c_font.make ("")
			clear_error
			{MGL_EXTERNAL}.mgl_title(c_graph_pointer,l_c_title.item, l_c_font.item, a_size)
			valid_error
		end

	width:INTEGER
		do
			clear_error
			Result:={MGL_EXTERNAL}.mgl_get_width(c_graph_pointer)
			valid_error
		end

	height:INTEGER
		do
			clear_error
			Result:={MGL_EXTERNAL}.mgl_get_height(c_graph_pointer)
			valid_error
		end

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
		local
			l_c_sch, l_c_opt:C_STRING
			l_c_data:TUPLE[c_x_data, c_y_data, c_z_data:POINTER]
		do

			l_c_data:=get_3_c_data_from_2d(a_points)
			create l_c_sch.make (plotting_pen.out)
			create l_c_opt.make ("")
			clear_error
			{MGL_EXTERNAL}.mgl_dots(c_graph_pointer,l_c_data.c_x_data,l_c_data.c_y_data,l_c_data.c_z_data, l_c_sch.item, l_c_opt.item)
			valid_error
		end

	plot_lines(a_points:attached SEQUENCE[TUPLE[x,y:REAL_64]])
		local
			l_c_sch, l_c_opt:C_STRING
			l_c_data:TUPLE[c_x_data, c_y_data, c_z_data:POINTER]
		do

			l_c_data:=get_3_c_data_from_2d(a_points)
			create l_c_sch.make (plotting_pen.out)
			create l_c_opt.make ("")
			clear_error
			{MGL_EXTERNAL}.mgl_plot_xyz(c_graph_pointer,l_c_data.c_x_data,l_c_data.c_y_data,l_c_data.c_z_data, l_c_sch.item, l_c_opt.item)
			valid_error
		end

	clear
		do
			clear_error
			{MGL_EXTERNAL}.mgl_clf(c_graph_pointer)
			valid_error
		end

	clear_with_color(a_red,a_green,a_blue:REAL_64)
		do
			clear_error
			{MGL_EXTERNAL}.mgl_clf_rgb(c_graph_pointer,a_red,a_green,a_blue)
			valid_error
		end

	save_to_file(a_filename, a_description:attached READABLE_STRING_GENERAL)
		local
			l_c_filename, l_c_description:C_STRING
		do
			create l_c_filename.make (a_filename)
			create l_c_description.make (a_description)
			clear_error
			{MGL_EXTERNAL}.mgl_write_frame(c_graph_pointer, l_c_filename.item, l_c_description.item)
			valid_error
		end

	set_range(a_x_min,a_x_max,a_y_min,a_y_max:REAL_64)
		require
			A_X_Valid: a_x_min<a_x_max
			A_Y_Valid: a_y_min<a_y_max
		do
			x_min:=a_x_min
			x_max:=a_x_max
			y_min:=a_y_min
			y_max:=a_y_max
			clear_error
			{MGL_EXTERNAL}.mgl_set_ranges(c_graph_pointer,a_x_min,a_x_max,a_y_min,a_y_max,0.0,0.0)
			valid_error
		end

	set_x_range(a_x_min,a_x_max:REAL_64)
		require
			A_X_Valid: a_x_min<a_x_max
		do
			set_range(a_x_min,a_x_max,y_min,y_max)
		end

	set_y_range(a_y_min,a_y_max:REAL_64)
		require
			A_Y_Valid: a_y_min<a_y_max
		do
			set_range(x_min,x_max,a_y_min,a_y_max)
		end

	x_min:REAL_64 assign set_x_min

	x_max:REAL_64 assign set_x_max

	y_min:REAL_64 assign set_y_min

	y_max:REAL_64 assign set_y_max

	set_x_min(a_x_min:REAL_64)
		require
			A_X_Min_Valid: a_x_min<x_max
		do
			set_x_range(a_x_min,x_max)
		end

	set_x_max(a_x_max:REAL_64)
		require
			A_X_Max_Valid: a_x_max>x_min
		do
			set_x_range(x_min,a_x_max)
		end

	set_y_min(a_y_min:REAL_64)
		require
			A_Y_Min_Valid: a_y_min<y_max
		do
			set_y_range(a_y_min,y_max)
		end

	set_y_max(a_y_max:REAL_64)
		require
			A_Y_Max_Valid: a_y_max>y_min
		do
			set_y_range(y_min,a_y_max)
		end


	axis:attached MGL_AXIS_2D

	plotting_pen:attached MGL_PEN

feature {NONE} -- Implementation

	dispose
		do
			clear_error
			{MGL_EXTERNAL}.mgl_delete_graph(c_graph_pointer)
			valid_error
		end

	c_string_pen:attached C_STRING
		attribute
			create Result.make ("")
		end

	c_string_option:attached C_STRING
		attribute
			create Result.make ("")
		end

	get_3_c_data_from_2d(a_datas:attached SEQUENCE[TUPLE[x,y:REAL_64]]):attached TUPLE[c_x_data, c_y_data, c_z_data:POINTER]
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
			Result:=get_3_c_data(l_datas)
		end

	get_3_c_data(a_datas:attached SEQUENCE[TUPLE[x,y,z:REAL_64]]):attached TUPLE[c_x_data, c_y_data, c_z_data:POINTER]
		local
			l_c_x_data, l_c_y_data, l_c_z_data:POINTER
			l_x_array, l_y_array, l_z_array:ARRAYED_LIST[REAL_64]
			l_x_pointer, l_y_pointer, l_z_pointer:ANY
		do
			create l_x_array.make (a_datas.count)
			create l_y_array.make (a_datas.count)
			create l_z_array.make (a_datas.count)

			from a_datas.start
			until a_datas.exhausted
			loop
				if attached a_datas.item as l_item then
					l_x_array.extend (l_item.x)
					l_y_array.extend (l_item.y)
					l_z_array.extend (l_item.z)
				end
				a_datas.forth
			end

			l_x_pointer:=l_x_array.to_array.to_c
			l_y_pointer:=l_y_array.to_array.to_c
			l_z_pointer:=l_z_array.to_array.to_c

			clear_error
			l_c_x_data:={MGL_EXTERNAL}.mgl_create_data_size(l_x_array.count, 1, 1)
			valid_error
			clear_error
			l_c_y_data:={MGL_EXTERNAL}.mgl_create_data_size(l_y_array.count, 1, 1)
			valid_error
			clear_error
			l_c_z_data:={MGL_EXTERNAL}.mgl_create_data_size( l_z_array.count, 1,1)
			valid_error

			clear_error
			{MGL_EXTERNAL}.mgl_data_set_double(l_c_x_data,$l_x_pointer,l_x_array.count,1,1)
			valid_error
			clear_error
			{MGL_EXTERNAL}.mgl_data_set_double(l_c_y_data,$l_y_pointer,l_y_array.count,1,1)
			valid_error
			clear_error
			{MGL_EXTERNAL}.mgl_data_set_double(l_c_z_data,$l_z_pointer,l_z_array.count,1,1)
			valid_error
			Result:=[l_c_x_data, l_c_y_data, l_c_z_data]
		end

invariant
	C_Pointer_Is_Not_Null: not c_graph_pointer.is_default_pointer

end
