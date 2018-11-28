function calculate_from_string
	set text_to_calc ''
	getopts $argv | while read -l key value
		switch $key
			case s
				set num $value
			case _
				set text_to_calc $text_to_calc $value
		end
	end
	set count 0
	for bobs in (echo $text_to_calc | grep -o -E '[0-9]+')
		set count (math $count + $bobs)
	end
	echo $count
end
