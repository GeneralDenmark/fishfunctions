function test_uniqueness
	
	set generated = ''
	set count 0
	while true
        set id (cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)
        if contains $id $generated; echo -e "\n\nMATCH.. TOTAL GENERATED: "$count "Matched on: "$id;return 0;end
        set generated $id $generated
        set count (math $count + 1)
   		echo -en "\e[1A"; echo -e "\e[0K\r count -> "$count" id ->"$id
    end
end