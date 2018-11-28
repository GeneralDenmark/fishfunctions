# Defined in - @ line 0
function purge_branches --description 'alias purge_branches git branch --merged >/tmp/merged-branches; and vim /tmp/merged-branches; and xargs git branch -d </tmp/merged-branches'
	git branch --merged >/tmp/merged-branches; and vim /tmp/merged-branches; and xargs git branch -d </tmp/merged-branches $argv;
end
