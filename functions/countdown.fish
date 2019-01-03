function countdown
	set -l options 'h/help' 'y-date=+' 'k-time=+' 'v-timezone=+' 's/seconds=+' 'd/delay=+' 't/show-time' 'M/minuts=+' 'H/hours=+' 'D/days=+'
	argparse $options -- $argv >/dev/null 2>&1 ;
	or begin;echo "Some arguments [" $argv "] was not understood" 
	and countdown.help; and return 1; end

	if set -q _flag_h;countdown.help;and return 0;end
	if set -q _flag_s;set num $_flag_s;else;set num 0;end
	if set -q _flag_M;set num (math "$num+$_flag_M*60");end
	if set -q _flag_H;set num (math "$num+$_flag_H*3600");end
	if set -q _flag_D;set num (math "$num+$_flag_D*86400");end
    if [ $num -lt 0 ];set num (math "$num * -1");end
	if begin set -q _flag_date; or set -q _flag_time; end
		if set -q _flag_timezone;set timezone $_flag_timezone;else;set timezone (date +%Z);end
    	if set -q _flag_time;set time $_flag_time;else;set time (date +%T);end 
		if set -q _flag_date;set date $_flag_date;else;set date (date +%D);end
		set num (math (date -d $date""$timezone""$time +%s) - (date +%s));end
	if [ $num -eq 0 ]; and not set -q _flag_s;echo "You must set a time ";and return 1;end
    if set -q _flag_t
    	set min 0;set hour 0;set day 0;
		if [ $num -gt 59 ]
	    	set sec (math $num%60)
	        set num (math $num/60)
	        if [ $num -gt 59 ]
	        	set min (math $num%60)
	        	set num (math $num/60)
	        	if [ $num -gt 23 ]
	        		set hour (math $num%24)
	        		set day (math $num/24)
	        	else
	        		set hour $num
	        	end	
	        else
	            set min $num
	        end
	    else
	        set sec $num
	    end
	    if [ $day -eq 1 ];set date_s "day";else; set date_s "days";end
	    set total_time ''
	    if [ $day -ne 0 ];set total_time (printf "%d %s, %02d:%02d:%02d" $day $date_s $hour $min $sec)
		else if [ $hour -ne 0 ];set total_time (printf "%02d:%02d:%02d" $hour $min $sec)
	    else if [ $min -ne 0 ];set total_time (printf "%02d:%02d" $min $sec)
	    else;set total_time $total_time(printf "%ds" $sec);end

	    echo $total_time
	    return 0
	end
    if not set -q _flag_d
	   	while [ $num -ne 0 ]
			printf "  %s \033[0K\r" (countdown -t -s $num)
			set num (math $num-1)
			sleep 1s
		end
	else
		set sleep_seconds $_flag_s
		while [ (math $sleep_seconds-$_flag_d) -ne 0 ]
			set sleep_seconds (math $sleep_seconds-$_flag_d)
			sleep $_flag_d
			printf '  time left %s \033[0K\r' (countdown -t -s $sleep_seconds)
		end
		sleep $sleep_seconds
	end
	echo 'done                                              '
end