note
	description: "Summary description for {MGL_AXIS_HELPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MGL_AXIS_HELPER

inherit
	MGL_ERROR_HELPER

feature -- Access

	axis_label_size:REAL_64 assign set_axis_label_size

	set_axis_label_size(a_size: like axis_label_size)
		require
			a_Size_Not_Negative: a_size>=0
		do
			axis_label_size:=a_size
		end

	draw_x_label_min(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'x', -1.0)
		end

	draw_x_label_max(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'x', 1.0)
		end

	draw_x_label_center(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'x', 0.0)
		end

	draw_y_label_min(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'y', -1.0)
		end

	draw_y_label_max(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'y', 1.0)
		end

	draw_y_label_center(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'y', 0.0)
		end

	draw_z_label_min(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'z', -1.0)
		end

	draw_z_label_max(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'z', 1.0)
		end

	draw_z_label_center(a_label:attached READABLE_STRING_GENERAL)
		require
			A_Label_Not_Void: a_label /= Void
		do
			draw_one_axis_label(a_label, 'z', 0.0)
		end

	grid_pen:attached MGL_PEN

	draw_x_grid
		do
			draw_grid_imp("x")
		end

	draw_y_grid
		do
			draw_grid_imp("y")
		end

	draw_z_grid
		do
			draw_grid_imp("z")
		end

	draw_grid
		do
			draw_grid_imp("xyz")
		end

	set_ticks_x(a_ticks_step,a_start_ticks:REAL_64; a_number_sub_ticks:INTEGER)
		do
			clear_error
			{MGL_EXTERNAL}.mgl_set_ticks(c_graph_pointer,'x', a_ticks_step, a_number_sub_ticks, a_start_ticks)
			valid_error
		end

	set_ticks_y(a_ticks_step,a_start_ticks:REAL_64; a_number_sub_ticks:INTEGER)
		do
			clear_error
			{MGL_EXTERNAL}.mgl_set_ticks(c_graph_pointer,'x', a_ticks_step, a_number_sub_ticks, a_start_ticks)
			valid_error
		end

	set_ticks_z(a_ticks_step,a_start_ticks:REAL_64; a_number_sub_ticks:INTEGER)
		do
			clear_error
			{MGL_EXTERNAL}.mgl_set_ticks(c_graph_pointer,'x', a_ticks_step, a_number_sub_ticks, a_start_ticks)
			valid_error
		end

feature {NONE} -- Implementation

	draw_grid_imp(a_dir:attached READABLE_STRING_GENERAL)
		local
			l_c_dir, l_c_pen, l_c_opt:C_STRING
		do
			create l_c_dir.make (a_dir.as_string_8)
			create l_c_pen.make(grid_pen.out)
			create l_c_opt.make ("")
			clear_error
			{MGL_EXTERNAL}.mgl_axis_grid(c_graph_pointer,l_c_dir.item, l_c_pen.item, l_c_opt.item)
			valid_error
		end

	draw_one_axis_label(a_text:attached READABLE_STRING_GENERAL; a_dir:CHARACTER_8; a_pos:REAL_64)
		local
			l_c_text, l_c_opt:C_STRING
		do
			if not a_text.is_empty then
				create l_c_text.make (a_text)
				if axis_label_size >0 then
					create l_c_opt.make ("size "+axis_label_size.out)
				else
					create l_c_opt.make ("")
				end
				clear_error
				{MGL_EXTERNAL}.mgl_label(c_graph_pointer,a_dir, l_c_text.item, a_pos, l_c_opt.item)
				valid_error
			end
		end

end
