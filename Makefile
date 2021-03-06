# Local commands

local-docker: local-docker-build local-docker-up

local-docker-no-cache: local-docker-build-no-cache local-docker-up

local-docker-build:
	docker-compose build nginx mysql php-fpm php-worker redis redis-webui laravel-echo-server workspace mailhog adminer selenium

local-docker-build-no-cache:
	docker-compose build --no-cache nginx mysql php-fpm php-worker redis redis-webui laravel-echo-server workspace mailhog adminer selenium

local-docker-up:
	docker-compose up -d nginx mysql php-fpm php-worker redis redis-webui laravel-echo-server workspace mailhog adminer selenium

local-docker-down:
	docker-compose down --remove-orphans


# Common commands

docker-ps-all:
	docker-compose ps -a

docker-exec-workspace:
	docker-compose exec --user=laradock workspace bash

docker-workspace-composer-install:
	docker-compose exec --user=laradock workspace composer install

docker-workspace-composer-refresh:
	docker-compose exec --user=laradock workspace composer dumpautoload --optimize

docker-workspace-frontend-build-dev:
	docker-compose exec --user=laradock workspace npm run dev

docker-workspace-frontend-build-prod:
	docker-compose exec --user=laradock workspace npm run prod

docker-kill-and-remove:
	docker-compose kill && docker-compose rm -f


# App commands

app-artisan:
	docker-compose exec --user=laradock workspace php artisan

app-tinker:
	docker-compose exec --user=laradock workspace php artisan tinker

app-queue-work:
	docker-compose exec --user=laradock workspace php artisan queue:work

app-refresh: app-migrate-fresh-with-seed app-cache-refresh


# App cache management commands

app-cache-clear:
	docker-compose exec --user=laradock workspace php artisan cache:clear

app-config-cache:
	docker-compose exec --user=laradock workspace php artisan config:cache

app-event-cache:
	docker-compose exec --user=laradock workspace php artisan event:cache

app-view-cache:
	docker-compose exec --user=laradock workspace php artisan view:cache

app-route-cache:
	docker-compose exec --user=laradock workspace php artisan route:cache

app-optimize:
	docker-compose exec --user=laradock workspace php artisan optimize

app-cache-clear-all: app-config-cache app-cache-clear app-route-cache app-view-cache app-event-cache

app-cache-refresh: app-cache-clear-all app-optimize


# App db management commands

app-migrate-with-seed:
	docker-compose exec --user=laradock workspace php artisan migrate --seed

app-migrate-fresh:
	docker-compose exec --user=laradock workspace php artisan migrate:fresh

app-migrate-fresh-with-seed:
	docker-compose exec --user=laradock workspace php artisan migrate:fresh --seed
