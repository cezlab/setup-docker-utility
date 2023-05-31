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

.PHONY: config-destroy
config-destroy:
	rm -rf ./.docker/nginx.conf
	rm -rf ./.docker/php.ini