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

	### Edit backup ###
	set regex ". name: (\w*\s*\n*)id: "$identifier".*?\n\s*cmd: .*?\n\s*time:.*?\n\s*onError: \w*\n\s*notifyOnError: \w*\n\s*notifyOnFailure: \w*\n\s*notifyOnSucess: \w*"
	
	set jobbed (cat ~/.jobber)"
	echo $jobbed


	echo $regex
	if $dryrun
		echo ""(string replace -r (string escape --style=regex $regex) "" -- (cat ~/logz/jobber/backup/jobber.bak))"" > ~/logz/jobber/backup/dryrun.test
	end	
end
