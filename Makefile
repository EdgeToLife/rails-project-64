start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup: install

install:
	bin/setup
	bin/rails db:migrate

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

check: test lint

test:
	RAILS_ENV=test
	make db-prepare
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: test