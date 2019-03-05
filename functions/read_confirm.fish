
function read_confirm
  if test $argv = '-y'
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