function update_flex_and_shop
	set -l options 'h/help' 't/time=+' 'f/flex' 's/shop' 'y/force-yes' 'i=+'
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
	if set -q _flag_y;set force_yes '-y';else;set force_yes ' ';end 
	if set -q _flag_i;set time_display_interval $_flag_i;else;set time_display_interval 30;end
	if not set -q _flag_f; if not set -q _flag_s; echo "You need to either choose the shop or the flex to be updated"; and return 0;end;end
	echo "You've enabled the following options:"
	set sleep_seconds (math $target_epoch - (date '+%s'))

	echo "Shop to be updated...." $shop
	echo "Flex to be updated...." $flex
	
	if not read_confirm "$force_yes"
		return 0
	end
	if [ $sleep_seconds -gt "0" ]
		echo "Time untill run: " (countdown -t -s $sleep_seconds)
		countdown -s $sleep_seconds -d $time_display_interval
	else
		echo 'You inputte a time less than or equal to now.'
		if not read_confirm "$force_yes"
			return 1
		end
	end
	if set -q _flag_f
		echo "Starting Flex db update"
		bash -c "fish -c '""make -C $devenv shop-reset-db""';echo 'shop-done' '&"
	end
	if set -q _flag_s
		echo "Starting Shop db update"
		bash -c "fish -c '""make -C $devenv flex-reset-db""'; echo 'flex-done' &"
	end

	await
	echo "Update completed"
end
