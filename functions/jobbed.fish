function jobbed 
	set ras false
	getopts $argv | while read -l key value
		switch $key
			case 'h' 'help'
				printf "jobbed (optional -s for sudo)\n  Will run vim on .jobber and then jobber reload"; return 0;
			case 's' 'sudo'
				set ras true
			case '*'
				printf "Error, did not understand the following argument\n%s " $key; return 1
		end
	end

	if $ras
		get_sudo
		sudo vim /root/.jobber;and sudo jobber reload
	else		
		vim ~/.jobber; and jobber reload
	end
end
