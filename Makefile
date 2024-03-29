start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup: install

install:
	npm install
	yarn build
	yarn build:css
	bin/setup
	bin/rails db:migrate
	bin/rails db:reset

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

check: test lint

test:
	RAILS_ENV=test bin/rails db:migrate
	RAILS_ENV=test rake db:fixtures:load FIXTURES_PATH=test/fixtures ORDER=users,categories,posts,post_comments,post_likes
	RAILS_ENV=test bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: test