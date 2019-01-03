function center
	set b $argv
	set b_len (string length -- $b)
	set v_len 90
	
	echo (seq -s- $v_len|tr -d '[:digit:]')
	printf "%*s\n" (math (math (math $v_len-$b_len)/2) + (math (math $b_len%2) + $b_len))  $b
	echo (seq -s- $v_len|tr -d '[:digit:]')
  end
