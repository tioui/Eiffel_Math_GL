note
	description: "Summary description for {MGL_EXTERNAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MGL_EXTERNAL

feature -- Function mgl_cf.h


	frozen mgl_create_graph(width, height:INTEGER):POINTER
		external
			"C (int,int):HMGL | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_create_graph"
		end

	frozen mgl_delete_graph(gr:POINTER)
		external
			"C (HMGL) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_delete_graph"
		end

	frozen mgl_fplot(gr, y, pen, opt:POINTER)
		external
			"C (HMGL, const char *, const char *, const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_fplot"
		end

	frozen mgl_clf(gr:POINTER)
		external
			"C (HMGL) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_clf"
		end

	frozen mgl_clf_rgb(gr:POINTER;r,g,b:REAL_64)
		external
			"C (HMGL, mreal, mreal, mreal) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_clf_rgb"
		end

	frozen mgl_write_frame(gr, fname, desc:POINTER)
		external
			"C (HMGL, const char *, const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_write_frame"
		end

	frozen mgl_box_str(gr, col:POINTER; ticks:INTEGER)
		external
			"C (HMGL, const char *, int) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_box_str"
		end

	frozen mgl_axis(gr,dir,stl,opt:POINTER)
		external
			"C (HMGL,const char *,const char *,const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_axis"
		end

	frozen mgl_set_ranges(gr:POINTER;x1,x2,y1,y2,z1,z2:REAL_64)
		external
			"C (HMGL,double,double,double,double,double,double) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_set_ranges"
		end

	frozen mgl_set_origin(gr:POINTER;x,y,z:REAL_64)
		external
			"C (HMGL,mreal,mreal,mreal) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_set_origin"
		end

	frozen mgl_dots(gr,x,y,z,sch,opt:POINTER)
		external
			"C (HMGL,HCDT,HCDT,HCDT,const char *, const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_dots"
		end

	frozen mgl_plot_xyz(gr,x,y,z,pen,opt:POINTER)
		external
			"C (HMGL,HCDT,HCDT,HCDT,const char *, const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_plot_xyz"
		end

	frozen mgl_create_data_size(mx,my,mz:INTEGER):POINTER
		external
			"C (int,int,int) : HMDT | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_create_data_size"
		end

	frozen mgl_data_set_double(dat, A:POINTER;mx,my,mz:INTEGER)
		external
			"C (HMDT, const double *, int,int,int) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_data_set_double"
		end

	frozen mgl_get_warn(gr:POINTER):INTEGER
		external
			"C (HMGL) : int | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_get_warn"
		end

	frozen mgl_get_mess(gr:POINTER):POINTER
		external
			"C (HMGL) : const char * | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_get_mess"
		end

	frozen mgl_set_warn(gr:POINTER;code:INTEGER;info:POINTER)
		external
			"C (HMGL,int,const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_set_warn"
		end

	frozen mgl_title(gr, txt, stl:POINTER;size:REAL_64)
		external
			"C (HMGL,const char *,const char *, mreal) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_title"
		end

	frozen mgl_get_width(gr:POINTER):INTEGER
		external
			"C (HMGL) : int | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_get_width"
		end

	frozen mgl_get_height(gr:POINTER):INTEGER
		external
			"C (HMGL) : int | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_get_height"
		end

	frozen mgl_set_func(gr,EqX,EqY,EqZ,EqA:POINTER)
		external
			"C (HMGL, const char *, const char *, const char *, const char *) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_set_func"
		end

	frozen mgl_rotate(gr:POINTER;TetX,TetZ,TetY:REAL_64)
		external
			"C (HMGL, mreal , mreal , mreal ) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_rotate"
		end

	frozen mgl_label(gr:POINTER; dir:CHARACTER_8; text:POINTER; pos:REAL_64; opt:POINTER)
		external
			"C (HMGL, char, const char *, mreal, const char * ) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_label"
		end

	frozen mgl_axis_grid(gr:POINTER; dir, pen, opt:POINTER)
		external
			"C (HMGL, const char *, const char *, const char * ) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_axis_grid"
		end

	frozen mgl_set_ticks(gr:POINTER; dir:CHARACTER_8; d:REAL_64; ns:INTEGER; org:REAL_64)
		external
			"C (HMGL, char, mreal, int , mreal) | <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mgl_set_ticks"
		end

feature -- Constants mgl_cf.h

	frozen mglWarnNone:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnNone"
		end

	frozen mglWarnDim:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnDim"
		end

	frozen mglWarnLow:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnLow"
		end

	frozen mglWarnNeg:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnNeg"
		end

	frozen mglWarnFile:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnFile"
		end

	frozen mglWarnMem:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnMem"
		end

	frozen mglWarnZero:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnZero"
		end

	frozen mglWarnLeg:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnLeg"
		end

	frozen mglWarnSlc:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnSlc"
		end

	frozen mglWarnCnt:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnCnt"
		end

	frozen mglWarnOpen:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnOpen"
		end

	frozen mglWarnLId:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnLId"
		end

	frozen mglWarnSize:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnSize"
		end

	frozen mglWarnFmt:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnFmt"
		end

	frozen mglWarnTern:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnTern"
		end

	frozen mglWarnNull:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnNull"
		end

	frozen mglWarnSpc:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnSpc"
		end

	frozen mglWarnEnd:INTEGER
		external
			"C inline use <stdbool.h>, <mgl2/mgl_cf.h>"
		alias
			"mglWarnEnd"
		end

end
