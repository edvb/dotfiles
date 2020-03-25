set verbose off
set confirm off
# set print addr off
set print pretty on

define tspp
	call tisp_print(stdout, $arg0)
	call fflush(0)
end
