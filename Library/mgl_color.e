note
	description: "Summary description for {MGL_COLOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_COLOR

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
			set_default
		end

feature -- Access


	set_default
		do
			out_imp:=""
		end

	set_red
		do
			out_imp:="r"
		end

	set_green
		do
			out_imp:="g"
		end

	set_blue
		do
			out_imp:="b"
		end

	set_dark_gray
		do
			out_imp:="H"
		end

	set_cyan
		do
			out_imp:="c"
		end

	set_magenta
		do
			out_imp:="m"
		end

	set_yellow
		do
			out_imp:="y"
		end

	set_gray
		do
			out_imp:="h"
		end

	set_blue_green
		do
			out_imp:="l"
		end

	set_sky_blue
		do
			out_imp:="n"
		end

	set_orange
		do
			out_imp:="q"
		end

	set_yellow_green
		do
			out_imp:="e"
		end

	set_blue_violet
		do
			out_imp:="u"
		end

	set_purple
		do
			out_imp:="p"
		end

	is_default:BOOLEAN
		do
			Result:=out_imp.is_empty
		end

	is_red:BOOLEAN
		do
			Result:=out_imp.is_equal("r")
		end

	is_green:BOOLEAN
		do
			Result:=out_imp.is_equal("g")
		end

	is_blue:BOOLEAN
		do
			Result:=out_imp.is_equal("b")
		end

	is_dark_gray:BOOLEAN
		do
			Result:=out_imp.is_equal("H")
		end

	is_cyan:BOOLEAN
		do
			Result:=out_imp.is_equal("c")
		end

	is_magenta:BOOLEAN
		do
			Result:=out_imp.is_equal("m")
		end

	is_yellow:BOOLEAN
		do
			Result:=out_imp.is_equal("y")
		end

	is_gray:BOOLEAN
		do
			Result:=out_imp.is_equal("h")
		end

	is_blue_green:BOOLEAN
		do
			Result:=out_imp.is_equal("l")
		end

	is_sky_blue:BOOLEAN
		do
			Result:=out_imp.is_equal("n")
		end

	is_orange:BOOLEAN
		do
			Result:=out_imp.is_equal("q")
		end

	is_yellow_green:BOOLEAN
		do
			Result:=out_imp.is_equal("e")
		end

	is_blue_violet:BOOLEAN
		do
			Result:=out_imp.is_equal("u")
		end

	is_purple:BOOLEAN
		do
			Result:=out_imp.is_equal("p")
		end

	out:attached STRING
		do
			Result:=out_imp
		end

feature {NONE} -- Implementation

	out_imp:attached STRING
		attribute
			create Result.make_empty
		end


end
