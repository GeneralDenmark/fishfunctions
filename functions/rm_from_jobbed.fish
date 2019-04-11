function rm_from_jobbed
	set identifier '';set dryrun false
	getopts $argv | while read -l key value
		switch $key
			case '_'
				set identifier $value
			case 'h' 'help'
				printf "removes from jobbed can only be run with same previliges as user";
			case 'd' 'dry'
				set dryrun true
			case '*'
				printf "Error, did not understand the following argument\n%s " $key; return 1
		end
	end
	if test -z $identifier
		echo "an id must be specified"; return 1
	end

	### Make a backup ###

	cp -f ~/.jobber ~/logz/jobber/backup/jobber.bak

	### Run the pythonscript ###
	if $dryrun
		set output ~/logz/jobber/backup/dryrun.test
	else
		set output ~/.jobber
	end
	python ./rmerjobber.py -i ~/logz/jobber/backup/jobber.bak -o $output -d $identifier
	if $dryrun
		cat ~/logz/jobber/backup/dryrun.test
		rm ~/logz/jobber/backup/dryrun.test
	end
end
