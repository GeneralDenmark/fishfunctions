function flex_ts_compile
	set base_location '~/PycharmProjects/devenv/flex-base/neoflex/'
echo 'Started listening on '$base_location
while true;
      inotifywait -q -e modify $base_location"djflex/customercenter/static/customercenter/base.ts" --format "%w/%f" | while read MODIFY
          echo "Filed modifed"
          fab -f $base_location"fabfile.py" compile_js
          echo "Compiled"
      
      end
  end
end
