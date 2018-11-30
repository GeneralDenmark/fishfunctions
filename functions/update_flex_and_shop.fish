function update_flex_and_shop
	set -l options 'h/help' 't/time=+' 'f/flex' 's/shop' 'y/force-yes'
	argparse $options -- $argv >/dev/null 2>&1;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and update_flex_and_shop.help
	and return 1
	end
	set devenv /home/agw/PycharmProjects/devenv

	if set -q _flag_h;update_flex_and_shop.help;return 0;end
	if set -q _flag_t;set target_epoch (date -d (date '+%D')"  "$_flag_t +%s);else;set target_epoch (date -d (date '+%D')" 12:00" +%s);end
	if set -q _flag_f;set flex (set_color 0F0) True (set_color normal);else;set flex (set_color F00) False (set_color normal);end
	if set -q _flag_s;set shop (set_color 0F0) True (set_color normal);else;set shop (set_color F00) False (set_color normal);end
	if not set -q _flag_f; if not set -q _flag_s; echo "You need to either choose the shop or the flex to be updated"; and return 0;end;end
	echo "You've enabled the following options:"
	set sleep_seconds (math $target_epoch - (date '+%s'))
	echo "Time untill run: " (show_time -s $sleep_seconds)


	echo "Shop to be updated...." $shop
	echo "Flex to be updated...." $flex
	if not set -q _flag_y
		if not read_confirm
			return 0
		end
	else
		echo "Do you want to continue? [y/N] y"
	end
	if [ $sleep_seconds -gt 0 ]
		sleep $sleep_seconds
	end
	if set -q _flag_f
		echo "Starting Flex db update"
		fish -C "make -C $devenv shop-reset-db">/dev/null 2>&1 &
	end
	if set -q _flag_s
		echo "Starting Shop db update"
		fish -C "make -C $devenv flex-reset-db">/dev/null 2>&1 &
	end

	wait
	echo "Update completed"
end
