# Defined in - @ line 0
function shop_db --description 'alias shop_db docker exec -it devenv_shop-db_dk_1 psql -Ushop'
	docker exec -it devenv_shop-db_dk_1 psql -Ushop $argv;
end
