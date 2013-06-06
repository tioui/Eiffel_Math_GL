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
			set_color_default
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

	set_color_default
		do
			c_color_imp:=""
		end

	set_color_red
		do
			c_color_imp:="r"
		end

	set_color_green
		do
			c_color_imp:="g"
		end

	set_color_blue
		do
			c_color_imp:="b"
		end

	set_color_dark_gray
		do
			c_color_imp:="H"
		end

	set_color_cyan
		do
			c_color_imp:="c"
		end

	set_color_magenta
		do
			c_color_imp:="m"
		end

	set_color_yellow
		do
			c_color_imp:="y"
		end

	set_color_gray
		do
			c_color_imp:="h"
		end

	set_color_blue_green
		do
			c_color_imp:="l"
		end

	set_color_sky_blue
		do
			c_color_imp:="n"
		end

	set_color_orange
		do
			c_color_imp:="q"
		end

	set_color_yellow_green
		do
			c_color_imp:="e"
		end

	set_color_blue_violet
		do
			c_color_imp:="u"
		end

	set_color_purple
		do
			c_color_imp:="p"
		end

	is_color_default:BOOLEAN
		do
			Result:=c_color_imp.is_empty
		end

	is_color_red:BOOLEAN
		do
			Result:=c_color_imp.is_equal("r")
		end

	is_color_green:BOOLEAN
		do
			Result:=c_color_imp.is_equal("g")
		end

	is_color_blue:BOOLEAN
		do
			Result:=c_color_imp.is_equal("b")
		end

	is_color_dark_gray:BOOLEAN
		do
			Result:=c_color_imp.is_equal("H")
		end

	is_color_cyan:BOOLEAN
		do
			Result:=c_color_imp.is_equal("c")
		end

	is_color_magenta:BOOLEAN
		do
			Result:=c_color_imp.is_equal("m")
		end

	is_color_yellow:BOOLEAN
		do
			Result:=c_color_imp.is_equal("y")
		end

	is_color_gray:BOOLEAN
		do
			Result:=c_color_imp.is_equal("h")
		end

	is_color_blue_green:BOOLEAN
		do
			Result:=c_color_imp.is_equal("l")
		end

	is_color_sky_blue:BOOLEAN
		do
			Result:=c_color_imp.is_equal("n")
		end

	is_color_orange:BOOLEAN
		do
			Result:=c_color_imp.is_equal("q")
		end

	is_color_yellow_green:BOOLEAN
		do
			Result:=c_color_imp.is_equal("e")
		end

	is_color_blue_violet:BOOLEAN
		do
			Result:=c_color_imp.is_equal("u")
		end

	is_color_purple:BOOLEAN
		do
			Result:=c_color_imp.is_equal("p")
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


	out:attached STRING_8
		do
			Result:=c_color_imp
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

	c_color_imp:attached STRING
		attribute
			create Result.make_empty
		end

	points_marker:attached STRING

	lines_style:attached STRING
end
