function show_time
	set -l options 'h/help' 's=+'
	argparse $options -- $argv ^/dev/null;
	or begin 
	echo "Some arguments [" $argv "] was not understood" ;
	and show_time.help;
	and return 1;
	end


	if set -q _flag_h;show_time.help;return 0;end
	if set -q _flag_s;set seconds $_flag_s;else;echo 'Please input seconds';and return 1;end

	set num $seconds;
    set min 0;
    set hour 0;
    set day 0;
    if [ $num -gt 59 ]
    	set sec (math $num%60)
        set num (math $num/60)
        if [ $num -gt 59 ]
        	set min (math $num%60)
        	set num (math $num/60)
        	if [ $num -gt 23 ]
        		set hour (math $num%60)
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
    set total_time ''
    if [ $day -ne 0 ];set total_time $total_time$day'd ';end
    if [ $hour -ne 0 ];set total_time $total_time$hour'h ';end
    if [ $min -ne 0 ];set total_time $total_time$min'm ';end
    if [ $sec -ne 0 ];set total_time $total_time$sec's ';end

    echo $total_time
end