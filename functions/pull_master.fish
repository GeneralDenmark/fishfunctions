function pull_master
	set -l options 'h/help' 'r/restart' 'R/rebuild' 'x-excludeflex' 'y-excludeshop' 'k-excludecrawler'
	argparse $options -- $argv ^/dev/null;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and pull_master.help;and return 1;end

	set home '/home/agw/'
	set devenv $home'PycharmProjects/devenv/'
	if test -n "$_flag_h";pull_master.help;return 0;end

	if test -z "$_flag_excludeshop"
		set vvsshop $devenv'shop-base/vvsshop'
		echo $vvsshop
		command git -C $vvsshop checkout master
		command git -C $vvsshop pull --all
	end	

	if test -z "$_flag_excludeflex"
		set neoflex $devenv'flex-base/neoflex'
		echo $neoflex
		command git -C $neoflex checkout master
		command git -C $neoflex pull --all
	end

	if test -z "$_flag_excludecrawler"
		set crawl $home'billigvvs_crawlers/crawler'
		echo $crawl
		command git -C $crawl checkout master
		command git -C $crawl pull --all
	end

	if test -n "$_flag_r"
		command make -C $devenv docker-rebuild
		return
	end
	if test -n "$_flag_R"
		command make -C $devenv docker-restart
	end
end