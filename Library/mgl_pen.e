note
	description: "Summary description for {MGL_PEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_PEN

inherit
	ANY
	redefine
		default_create,
		out
	end

create
	default_create

feature {NONE} -- Initialisation

	default_create
		do
			precursor
			create color
			set_size(0)
			disable_lines_style
			disable_points_marker
		end

feature -- Access

	size:INTEGER assign set_size

	set_size(a_size:INTEGER)
		require
			A_Size_Valid: a_size>=0 and a_size<10
		do
			size:=a_size
		end

	has_points_marker:BOOLEAN
		do
			Result := not points_marker.is_empty
		end

	disable_points_marker
		do
			points_marker:=""
		end

	is_points_marker_plus:BOOLEAN
		do
			Result:=points_marker.is_equal("+")
		end

	enable_points_marker_plus
		do
			points_marker:="+"
		end

	is_points_marker_star:BOOLEAN
		do
			Result:=points_marker.is_equal(".")
		end

	enable_points_marker_dot
		do
			points_marker:="*"
		end

	is_points_marker_dot:BOOLEAN
		do
			Result:=points_marker.is_equal(".")
		end

	enable_points_marker_star
		do
			points_marker:="*"
		end

	is_points_marker_triangle_left:BOOLEAN
		do
			Result:=points_marker.is_equal("<")
		end

	enable_points_marker_triangle_left
		do
			points_marker:="<"
		end

	is_points_marker_triangle_right:BOOLEAN
		do
			Result:=points_marker.is_equal(">")
		end

	enable_points_marker_triangle_right
		do
			points_marker:=">"
		end

	is_points_marker_triangle_up:BOOLEAN
		do
			Result:=points_marker.is_equal("^")
		end

	enable_points_marker_triangle_up
		do
			points_marker:="^"
		end

	is_points_marker_x:BOOLEAN
		do
			Result:=points_marker.is_equal("x")
		end

	enable_points_marker_x
		do
			points_marker:="x"
		end

	has_lines_style:BOOLEAN
		do
			Result := not lines_style.is_empty
		end

	disable_lines_style
		do
			lines_style:=""
		end

	is_lines_style_dash:BOOLEAN
		do
			Result:=lines_style.is_equal(";")
		end

	enable_lines_style_dash
		do
			lines_style:=";"
		end

	is_lines_style_short_dash:BOOLEAN
		do
			Result:=lines_style.is_equal("=")
		end

	enable_lines_style_short_dash
		do
			lines_style:="="
		end

	is_lines_style_long_dash:BOOLEAN
		do
			Result:=lines_style.is_equal("|")
		end

	enable_lines_style_long_dash
		do
			lines_style:="|"
		end

	is_lines_style_long_dash_and_dot:BOOLEAN
		do
			Result:=lines_style.is_equal("j")
		end

	enable_lines_style_long_dash_and_dot
		do
			lines_style:="j"
		end

	is_lines_style_dash_and_dot:BOOLEAN
		do
			Result:=lines_style.is_equal("i")
		end

	enable_lines_style_dash_and_dot
		do
			lines_style:="i"
		end

	is_lines_style_dot:BOOLEAN
		do
			Result:=lines_style.is_equal(":")
		end

	enable_lines_style_dot
		do
			lines_style:=":"
		end

	color:attached MGL_COLOR


	out:attached STRING_8
		do
			Result:=color.out
			if has_lines_style then
				Result:=Result+lines_style
			end
			if has_points_marker then
				Result:=Result+points_marker
			end
			if size/=0 then
				Result:=Result+size.out
			end

		end

feature {NONE} -- Implementation

	points_marker:attached STRING

	lines_style:attached STRING
end
