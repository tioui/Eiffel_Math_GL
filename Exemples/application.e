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
		do
			draw_graph_function
			draw_function_with_rotation
			draw_graph_points
			draw_graph_lines
			log_scale
			graph_3d_and_box
		end

	draw_graph_function
		local
			l_graph:MGL_GRAPH_2D
		do
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Drawing function Exemple.")
			l_graph.set_range (-10, 10, -1, 1)
			l_graph.axis.set_origin (-0.0, -0.0)
			l_graph.axis.disable_tick_rotation_on_vertical_axis
			l_graph.axis.arrow.set_normal
			l_graph.axis.draw
			l_graph.plotting_pen.color.set_red
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.disable_lines_style
			l_graph.plotting_pen.disable_points_marker
			l_graph.plot_function ("sin(pi*x)")
			l_graph.save_to_file ("function.png","Drawing function.")
		end

	draw_function_with_rotation
		local
			l_graph:MGL_GRAPH_2D
		do
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Graphics 2D rotation Exemple.")
			l_graph.rotate (45.0)
			l_graph.set_range (-10, 10, -1, 1)
			l_graph.axis.set_origin (-0.0, -0.0)
			l_graph.axis.disable_tick_rotation_on_vertical_axis
			l_graph.axis.arrow.set_normal
			l_graph.axis.draw
			l_graph.plotting_pen.color.set_red
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.disable_lines_style
			l_graph.plotting_pen.disable_points_marker
			l_graph.plot_function ("sin(pi*x)")
			l_graph.save_to_file ("rotation.png","Graphics 2D rotation.")
		end



	draw_graph_points
		local
			l_graph:MGL_GRAPH_2D
			l_points:LIST[TUPLE[x,y:REAL_64]]
		do
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Drawing points Exemple.")
			create {ARRAYED_LIST[TUPLE[x,y:REAL_64]]} l_points.make (8)
			l_points.extend ([-8.0,-8.0])
			l_points.extend ([-5.0,5.0])
			l_points.extend ([0.0,0.0])
			l_points.extend ([8.0,3.0])
			l_points.extend ([7.0,-8.0])
			l_points.extend ([3.0,8.0])
			l_points.extend ([0.0,5.0])
			l_points.extend ([2.0,-3.0])
			l_graph.set_range (-10, 10, -10, 10)
			l_graph.axis.set_origin (-10.0, -10.0)
			l_graph.axis.arrow.set_round
			l_graph.axis.draw
			l_graph.axis.grid_pen.color.set_sky_blue
			l_graph.axis.draw_grid
			l_graph.axis.set_axis_label_size (3.5)
			l_graph.axis.draw_x_label_max ("X")
			l_graph.axis.draw_y_label_max ("Y")
			l_graph.plotting_pen.color.set_green
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.enable_lines_style_long_dash_and_dot
			l_graph.plotting_pen.enable_points_marker_star

			l_graph.plot_dots (l_points)
			l_graph.save_to_file ("points.png","Drawing points.")
		end

	draw_graph_lines
		local
			l_graph:MGL_GRAPH_2D
			l_points:LIST[TUPLE[x,y:REAL_64]]
		do
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Drawing lines Exemple.")
			create {ARRAYED_LIST[TUPLE[x,y:REAL_64]]} l_points.make (8)
			l_points.extend ([-8.0,-8.0])
			l_points.extend ([-5.0,5.0])
			l_points.extend ([0.0,0.0])
			l_points.extend ([8.0,3.0])
			l_points.extend ([7.0,-8.0])
			l_points.extend ([3.0,8.0])
			l_points.extend ([0.0,5.0])
			l_points.extend ([2.0,-3.0])
			l_graph.set_range (-10, 10, -10, 10)
			l_graph.axis.set_origin (-8.0, -8.0)
			l_graph.axis.disable_tick_rotation_on_vertical_axis
			l_graph.axis.arrow.set_triangle
			l_graph.axis.draw
			l_graph.plotting_pen.color.set_blue
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.enable_lines_style_long_dash_and_dot
			l_graph.plotting_pen.enable_points_marker_star

			l_graph.plot_lines (l_points)
			l_graph.save_to_file ("lines.png","Drawing lines.")
		end

	log_scale
		local
			l_graph:MGL_GRAPH_2D
		do
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Log-Scale Exemple.")
			l_graph.set_range (0, 10, 1, 1000)
		--	l_graph.set_x_coordinate_transformation ("x*cos(y)")
			l_graph.set_y_coordinate_transformation ("lg(y)")
			l_graph.axis.set_origin (-0.0, -1.0)
			l_graph.axis.disable_tick_rotation_on_vertical_axis
			l_graph.axis.arrow.set_normal
			l_graph.axis.draw
			l_graph.axis.draw_y_label_center ("y=2^x")
			l_graph.plotting_pen.color.set_red
			l_graph.plotting_pen.set_size (1)
			l_graph.plotting_pen.disable_lines_style
			l_graph.plotting_pen.disable_points_marker
			l_graph.plot_function ("2^x")
			l_graph.save_to_file ("scale.png","Using log-scale coordinate.")
		end

	graph_3d_and_box
		local
			l_graph:MGL_GRAPH_3D
			l_points:ARRAYED_LIST[TUPLE[x,y,z:REAL_64]]
		do
			create l_points.make (4)
			l_points.extend ([-8.0,-5.0,3.0])
			l_points.extend ([-1.0,3.0,7.0])
			l_points.extend ([4.0,-5.0,-2.0])
			l_points.extend ([6.0,8.0,-8.0])
			create l_graph.make (800, 600)
			l_graph.set_text_size (8.0)
			l_graph.set_title ("Lines in a 3D box Exemple.")
			l_graph.rotate_relative_to_axis (60, 0, 40)


			l_graph.set_range (-10, 10, -10, 10, -10, 10)
			l_graph.box.vertices_color.set_red
			l_graph.box.panel_color.set_green
			l_graph.box.draw
			l_graph.plotting_pen.color.set_blue_violet
			l_graph.plotting_pen.enable_points_marker_x
			l_graph.plot_lines (l_points)

			l_graph.save_to_file ("points3d.png","Lines in a 3D box.")
		end

end
