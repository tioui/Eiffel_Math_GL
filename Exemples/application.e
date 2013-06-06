note
	description : "Math_GL_ex application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			l_graph:MGL_GRAPH_2D
			l_seq:LIST[TUPLE[x,y:REAL_64]]
		do
			create l_graph.make (800, 600)
			l_graph.set_title ("Graphique Exemple.", 8.0)
			create {ARRAYED_LIST[TUPLE[x,y:REAL_64]]} l_seq.make (8)
			l_seq.extend ([-8.0,-8.0])
			l_seq.extend ([-5.0,5.0])
			l_seq.extend ([0.0,0.0])
			l_seq.extend ([8.0,3.0])
			l_seq.extend ([7.0,-8.0])
			l_seq.extend ([3.0,8.0])
			l_seq.extend ([0.0,5.0])
			l_seq.extend ([2.0,-3.0])
			l_graph.set_range (-10, 10, -10, 10)
			l_graph.axis.set_origin (-8.0, -8.0)
			l_graph.axis.disable_tick_rotation_on_vertical_axis
			l_graph.axis.arrow.set_round
			l_graph.axis.draw
			l_graph.plotting_pen.set_color_blue
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.enable_lines_style_long_dash_and_dot
			l_graph.plotting_pen.enable_points_marker_star

			l_graph.plot_lines (l_seq)
			l_graph.plotting_pen.set_color_red
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.disable_lines_style
			l_graph.plotting_pen.disable_points_marker
			l_graph.plot_function ("sin(pi*x)")
			l_graph.save_to_file ("allo.png","descr")
			print("W: " + l_graph.width.out + "  - H: " + l_graph.height.out + "%N")
		end

end
