# Docker init commands and other

docker-init: docker-build docker-up

docker-build:
	docker-compose build --no-cache nginx mysql php-fpm php-worker redis redis-webui laravel-echo-server workspace mailhog adminer

docker-up:
	docker-compose up -d nginx mysql php-fpm php-worker redis redis-webui laravel-echo-server workspace mailhog adminer

docker-down:
	docker-compose down

docker-exec-workspace:
	docker-compose exec --user=laradock workspace bash

docker-workspace-composer-refresh:
	docker-compose exec --user=laradock workspace composer dumpautoload --optimize


# App commands

app-key-generate:
	docker-compose exec --user=laradock workspace php artisan key:generate --ansi

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
