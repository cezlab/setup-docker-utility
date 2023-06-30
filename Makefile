.PHONY: init
init: 
	@echo '${GREEN}Let Init Everything on Server Docker${RESET}'
	make config-init

.PHONY: destroy
destroy:
	@echo '${GREEN}Let Destroy Everything on Server Docker${RESET}'
	make config-destroy

.PHONY: config-init
config-init:
	cp ./.docker/nginx.conf.dist ./.docker/nginx.conf
	cp ./.docker/php.ini.dist ./.docker/php.ini
	cp ./.docker/mysql.cnf.dist ./.docker/mysql.cnf
	cp ./.docker/.docker.env ./.docker/.env
.PHONY: config-destroy
config-destroy:
	rm -rf ./.docker/mysql.cnf
	rm -rf ./.docker/nginx.conf
	rm -rf ./.docker/php.ini
	rm -rf ./.docker/.env
