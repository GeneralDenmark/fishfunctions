# Defined in /tmp/fish.7mHKlk/alert.fish @ line 2
function alert
	set -l options 'h/help' 'm/message=+' 't/title=+' 'u/urgency=+' 'b/beep=+'
	argparse $options -- $argv >/dev/null 2>&1 ;
	or begin;echo "Some arguments [" $argv "] was not understood" 
	and alert.help; and return 1; end
	export DISPLAY=:0
	if set -q _flag_h;alert.help; and return 0; end

	if set -q _flag_b
		switch $_flag_b
		case fanfare
			echo "fanfare not implimented yet"
			return
		case triangle
			echo "triangle not implimented yet"
			return
		case fish
			echo "fish not implimented yet"
			return
		case '*'
			set p ''
		end
		beep $p &
	end

	notify-send $_flag_t $_flag_m -u $_flag_u -t 0
end
