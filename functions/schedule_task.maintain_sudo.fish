function schedule_task.maintain_sudo -d "This function is to help schedule_task function maintain sudo"
		while true;sudo -n true; sleep 60; kill -0 %self or exit;end 2>/dev/null
	end
