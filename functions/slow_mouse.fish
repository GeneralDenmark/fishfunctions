# Defined in /tmp/fish.HoXBbv/slow_mouse.fish @ line 2
function slow_mouse --description 'slows or speeds up mouse'
	set -l help "Slows mouse. Usage: slow_mouse [-fs]"
	getopts $argv | while read -l key value
		switch $key
			case '_'
				echo "not supported "$value""; return 0
			case 'h' 'help'
				echo -e $help; return 0
			case 'f'
				xinput set-prop 'Logitech USB-PS/2 Optical Mouse' 'Coordinate Transformation Matrix' 5 0 0 0 5 0 0 0 1;return 0
			case 's'
				xinput set-prop 'Logitech USB-PS/2 Optical Mouse' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
			case '*'
				echo "Not udnerstood arg "$key; return 1
		end
	end

	if $AGW_SLOW_MOUSE
		set -Ux AGW_SLOW_MOUSE false
		xinput set-prop 'Logitech USB-PS/2 Optical Mouse' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
	else
		set -Ux AGW_SLOW_MOUSE true
		xinput set-prop 'Logitech USB-PS/2 Optical Mouse' 'Coordinate Transformation Matrix' 5 0 0 0 5 0 0 0 1
	end
end	
