docker-init: docker-build docker-up

docker-build:
	docker-compose build --no-cache nginx mysql php-fpm php-worker redis laravel-echo-server workspace mailhog adminer

docker-up:
	docker-compose up -d nginx mysql php-fpm php-worker redis laravel-echo-server workspace mailhog adminer

docker-down:
	docker-compose down

exec-workspace:
	docker-compose exec --user=laradock workspace bash
