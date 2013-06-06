note
	description: "Summary description for {MGL_AXIS_ARROW}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_AXIS_ARROW

inherit
	ANY
	redefine
		default_create
	end

create
	default_create

feature {NONE} -- Initialisation

	default_create
		do
			remove
		end

feature -- Access

	remove
		do
			internal_string:=""
		end

	set_normal
		do
			internal_string:="A"
		end

	set_triangle
		do
			internal_string:="T"
		end

	set_square
		do
			internal_string:="S"
		end

	set_round
		do
			internal_string:="O"
		end

	set_bar
		do
			internal_string:="I"
		end

	set_normal_with_bar
		do
			internal_string:="K"
		end

	set_rotated_square
		do
			internal_string:="D"
		end

feature {MGL_AXIS}

	internal_string:attached STRING

end
