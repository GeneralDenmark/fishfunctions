function schedule_task
	set -l options 'h/help' 'c/command=+' 't/hard-time=+' 'e/exact-period=+' 
	argparse $options -- $argv >/dev/null 2>&1;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and schedule_task.help
	and return 1
	end

	if set -q _flag_h;update_flex_and_shop.help;return 0;end
	if not set -q _flag_hard_time; if not set -q _flag_exact_period; echo 'You need to either set --hard-time or --exact-period. See -h/--help for more help.';and return 1;end;end
	if set -q _flag_hard_time; if set -q _flag_exact_period; echo 'You cannot set bot --hard-time and --exact-period. IT has to be one or the other';and return 1;end;end
	if not set -q _flag_c;echo 'You didn''t specify a command to execute, what is the purpose of running this?';and return 1;end

	switch $_flag_c
	case "*sudo*"
		sudo -v
		schedule_task.maintain_sudo &
		echo ''
	end
	if set -q _flag_hard_time
		echo 'Hard time has been enabled.'
		set target_epoch (date -d $_flag_hard_time)
		if [ sleepy_time -le 0 ]
			set target_epoch (date -d (date +%D)" " $_flag_hard_time)
			set sleepy_time (math (date -d $target_epoch +%s) - (date +%s))
		end
		echo "sleeper is set for" $target_epoch
		
	else if set -q _flag_exact_period
		echo 'Exact period has been enabled'
		set sleepy_time $_flag_exact_period
	end

	echo 'Goodnight, I''ll be sleeping in' (show_time -s $sleepy_time)
	sleep $sleepy_time
	echo 'Goodmorning. Executing command ' $_flag_c
	eval $_flag_c

end

