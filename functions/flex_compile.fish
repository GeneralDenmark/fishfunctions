function flex_compile
	fish -c "__flex_scss_compile" &
	fish -c "__flex_ts_compile" &
	await
end