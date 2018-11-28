function wait
	while fg ^| grep -qv "There are no suitable jobs"; end
end
