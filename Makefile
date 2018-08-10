run:
	./sentry

run-ssl:
	./knuckleschan --ssl --ssl-key-file dev_ssl/server.key --ssl-cert-file dev_ssl/server.crt

rebuild-sentry:
	curl -fsSLo- https://raw.githubusercontent.com/samueleaton/sentry/master/install.cr | crystal eval

shards:
	shards install

npm:
	npm install

install: shards rebuild-sentry npm

build:
	crystal build -o knuckleschan ./src/knuckleschan.cr

build-release:
	crystal build --stats --progress --release --verbose -o knuckleschan ./src/knuckleschan.cr