function killdocker
	
	echo "I will be killing: "
	echo (docker ps --format '{{.Names}}' | grep $argv ) 
	
	if read_confirm
		set dockers (docker ps | grep $argv | awk "{print\$1}" | grep -v 'CONTAINER')
		for dock in $dockers
			echo $dock
			command docker stop $dock &
		end
		wait
		echo 'Finished killing dockers'
	else
		echo "Okay, quitting."
	end
end
