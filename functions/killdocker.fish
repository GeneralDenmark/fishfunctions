# Defined in /tmp/fish.CXTKmF/killdocker.fish @ line 2
function killdocker
	echo "I will be killing: "
	echo (docker ps --format '{{.Names}}' | grep $argv ) 
    if test $argv[2] = '-y';set force_yes "-y";else;set force_yes '';end	
	if read_confirm $force_yes
		set dockers (docker ps | grep $argv | awk "{print\$1}" | grep -v 'CONTAINER')
		for dock in $dockers
			echo $dock
			command docker stop $dock >/dev/null 2>&1 &
		end
		await
		echo 'Finished killing dockers'
	else
		echo "Okay, quitting."
	end
end
