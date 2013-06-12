note
	description: "Summary description for {MGL_BOX_2D}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_BOX_2D

inherit
	MGL_BOX_3D
	export
		{NONE} 	draw_z_label_min, draw_z_label_max,	draw_z_label_center, draw_z_grid, set_ticks_z
	redefine
		make, draw_grid
	end

create {MGL_GRAPH_2D}
	make

feature {NONE} -- Initialisation

	make(a_graph_pointer:POINTER)
		do
			Precursor(a_graph_pointer)
		end

feature -- Access

	draw_grid
		do
			draw_grid_imp("xy")
		end



end
