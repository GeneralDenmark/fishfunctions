function __kill_children
	for x in (jobs -p | grep -v 'Process')
		kill $x
	end
end
