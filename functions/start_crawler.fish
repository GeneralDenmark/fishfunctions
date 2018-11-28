function start_crawler
	set crawler (docker ps --format '{{.Names}}' | grep $argv)
	if [ -z $crawler ]
		echo 'Did not find crawler matching:' $argv
		return
	end
	
	echo 'Restarting docker.'
	set restarted_answ (restart_docker $argv)
	
	echo 'Docker successfully restart.'
	command docker exec -t $crawler python main.py -d >/dev/null

	echo 'Docker executed successfully. Do you want to view it?'
	if read_confirm
		docker logs -f $crawler
	end

end
