function purge_branches
	set tmp_file /tmp/merged-branches
	git branch --merged > $tmp_file
	and	echo (zenity --text-info --filename $tmp_file --editable --width=500 --height=500) > $tmp_file
	and if [ (cat $tmp_file) != "" ];xargs git branch -d </tmp/merged-branches;and echo "Branches purged";else;echo "Nothing to do";end
end
