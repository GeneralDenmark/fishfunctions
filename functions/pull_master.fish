function pull_master
	set home '/home/agw/'
	set devenv $home'PycharmProjects/devenv/'
	set crawl $home'billigvvs_crawlers/crawler'
	set vvsshop $devenv'shop-base/vvsshop'
	set neoflex $devenv'flex-base/neoflex'

	echo $vvsshop
	command git -C $vvsshop checkout master
	command git -C $vvsshop pull --all
	
	echo $neoflex
	command git -C $neoflex checkout master
	command git -C $neoflex pull --all

	echo $crawl
	command git -C $crawl checkout master
	command git -C $crawl pull --all

	echo 'You wanna rebuild?'
	if read_confirm
		command make -C $devenv docker-rebuild
	else
		echo 'Restart then?'
		if read_confirm
			command make -C $devenv docker-restart
		else
			echo 'Not doing anything then'
		end
	end
end