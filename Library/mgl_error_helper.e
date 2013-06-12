note
	description: "Summary description for {MGL_ERROR_HELPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_ERROR_HELPER

feature -- Error Handelling

	has_error:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) /= {MGL_EXTERNAL}.mglWarnNone
		end

	is_error_data_dimension_incompatible:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnDim
		end

	is_error_data_dimension_too_small:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnLow
		end

	is_error_minimal_data_value_negative:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnNeg
		end

	is_error_no_file_or_wrong_data:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnFile
		end

	is_error_not_enough_memory:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnMem
		end

	is_error_data_values_zero:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnZero
		end

	is_error_no_legend_entry:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnLeg
		end

	is_error_slice_value_out_of_range:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnSlc
		end

	is_error_contour_count_not_positive:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnCnt
		end

	is_error_cannot_open_file:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnOpen
		end

	is_error_light_ID_out_of_range:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnLId
		end

	is_error_size_not_positive:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnSize
		end

	is_error_format_not_supported:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnFmt
		end

	is_error_axis_range_incompatible:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnTern
		end

	is_error_pointer_is_null:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnNull
		end

	is_error_not_enough_space_for_plot:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnSpc
		end

	is_error_maximum_warning:BOOLEAN
		do
			Result := {MGL_EXTERNAL}.mgl_get_warn(c_graph_pointer) = {MGL_EXTERNAL}.mglWarnEnd
		end

	get_error_message:attached READABLE_STRING_GENERAL
		local
			l_c_message:C_STRING
		do
			create l_c_message.make_by_pointer ({MGL_EXTERNAL}.mgl_get_mess(c_graph_pointer))
			create {STRING_8} Result.make_from_separate (l_c_message.string)
		end

	clear_error
		local
			l_c_info:C_STRING
		do
			create l_c_info.make ("")
			{MGL_EXTERNAL}.mgl_set_warn(c_graph_pointer, 0, l_c_info.item)
		end

feature {NONE} -- Implementation

	c_graph_pointer:POINTER

	valid_error
		do
			if has_error then
				io.error.put_string (get_error_message.to_string_8)
				io.error.put_new_line
				check False end
			end
		end

invariant
	C_Pointer_Is_Not_Null: not c_graph_pointer.is_default_pointer
	
end
