function spam_notify
	set -l options 'h/help' 'u=+' 'i=+' 
	argparse $options -- $argv >/dev/null 2>&1;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and echo -n "spams the same thing in a chat using xdotool"; and echo -n "spam_notify [-h/--help display this message and exit | -u username (without @, required) | -i number of times to run]"
	and return 1
	end

	if set -q _flag_h;echo -n "spams the same thing in a chat using xdotool"; and echo -n "spam_notify [-h/--help display this message and exit | -u username (without @, required) | -i number of times to run]";return 0;end
	if not set -q _flag_u; echo 'You must input a username'; and return 1;end
	if set -q _flag_i;set index $_flag_i;else;set index 10;end
	echo "sleeping in 1 seconds."
	sleep 1s
	setxkbmap dk
	set count 0
	while [ $count -lt $index ]
		if [ (math $count%10) -eq 0 ]
			xdotool type "now for something completely different"  
		else
			xdotool key --delay 0 0x40 (string split "" -- $_flag_u)  ^/dev/null
		end
		sleep (math -s1 (random 4 10)/10.0)
		xdotool key KP_Enter Return
		xdotool key KP_Enter Return
		xdotool key KP_Enter Return
		xdotool key KP_Enter Return
		set count (math $count+1)
	end
end