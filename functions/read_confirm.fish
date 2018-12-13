function read_confirm
  if and [ $argv = '-y' ] ^/dev/null
    echo 'Do you want to continue? [y/N] y '
    return 0
  end
  
  while true

	read -l -P 'Do you want to continue? [y/N] ' confirm
    
    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end