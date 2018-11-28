# Defined in - @ line 0
function manage --description 'alias manage docker exec -it devenv_shop-app_dk_1 /venv/bin/python /src/lib/manage.py'
	docker exec -it devenv_shop-app_dk_1 /venv/bin/python /src/lib/manage.py $argv;
end
