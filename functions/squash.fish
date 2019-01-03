function squash
	set -l options 'h/help' 'b/branch=+' 'n/new-branch' 'a/auto' 'y/force-yes' 'c/custom-message'
	argparse $options -- $argv >/dev/null 2>&1;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and squash.help
	and return 1
	end

	if set -q _flag_h;squash.help;and return 0;end
	if set -q _flag_b;set branch _flag_b;else;set branch (git branch | grep \* | cut -d ' ' -f2);and echo "Branch not set, using " $branch;end


	if not git checkout master ^| grep -q "fatal: Not a git repository (or any of the parent directories): .git"
		echo "Error folder is not a repository"
		return 1
	end
	git pull

	git merge $branch
	echo "Look at the merges and continue when done"
	if not read_confirm
		echo "are you sure you want to exit?"
		if read_confirm
			return 0
		end
	end

	git reset origin/master

	git branch -D $branch
	if set -q _flag_n
		set branch $_flag_n
	end
	git branch $_flag_n
	git checkout $branch
	git add . --all
	if set -q _flag_c;set commit_message $_flag_c;else;set commit_message "Squash commit";end
	git commit -m $custom_message
	git push -u origin $branch

end