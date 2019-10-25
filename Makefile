
start: build
	cd _site && http-server

build:
	bundle exec jekyll build --config _config.yml,_config-dev.yml

install:
	bundle install

clean:
	bundle exec jekyll clean
