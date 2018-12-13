# Defined in - @ line 0
function flex-manage --description 'alias flex-manage docker exec -it devenv_flex-app_1 /venv/bin/python /src/djflex/manage.py'
	docker exec -it devenv_flex-app_1 /venv/bin/python /src/djflex/manage.py $argv;
end
