function crawlrun
	set path_to_crawl '/home/agw/billigvvs_crawlers/crawler/main.py'
	set url $argv[2]
	set enviorment $argv[1]
	echo 'You are about to start a crawl with the following:'
	echo 'URL: '$url 
	echo 'Enviorment: '$enviorment
	if read_confirm
		command env CRAWLER=$argv[1] python3.6 $path_to_crawl -s $argv[2]
 	else
 		echo 'okay quitting.'
 	end 
end
