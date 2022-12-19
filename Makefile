BASEDIR = .
PROJ_S = $(BASEDIR)/mysite_sync
PROJ_A = $(BASEDIR)/mysite_async
POSTGRESDIR = $(BASEDIR)/postgres

default: build start test

build: build-sync build-async

build-sync:
	$(printTarget)
	docker build -f $(PROJ_S)/Dockerfile -t mysite_sync_web $(PROJ_S)/
	docker build -f $(PROJ_S)/nginx/Dockerfile -t mysite_sync_nginx $(PROJ_S)/nginx

build-async:
	$(printTarget)
	docker build -f $(PROJ_A)/Dockerfile -t mysite_async_web $(PROJ_A)/
	docker build -f $(PROJ_A)/nginx/Dockerfile -t mysite_async_nginx $(PROJ_A)/nginx

start: network start-sync start-async start-postgres

start-postgres:
	cd $(POSTGRESDIR) && docker compose up -d

start-sync:
	$(printTarget)
	cd $(PROJ_S) && docker compose up -d

start-async:
	$(printTarget)
	cd $(PROJ_A) && docker compose up -d

stop: stop-sync stop-async stop-postgres

stop-sync:
	$(printTarget)
	cd $(PROJ_S) && docker compose down

stop-async:
	$(printTarget)
	cd $(PROJ_A) && docker compose down

stop-postgres:
	cd $(POSTGRESDIR) && docker compose down

prepare-postgres:
	cd $(POSTGRESDIR) && ./populate.sh

test: test-sync test-async

test-sync:
	$(printTarget)
	ab -n 300 -c 300 http://127.0.0.1:8000/polls/

test-async:
	$(printTarget)
	ab -n 300 -c 300 http://127.0.0.1:8888/polls/

clean:
	$(printTarget)
	rm -rf venv

clean-postgres:
	$(printTarget)
	cd $(POSTGRESDIR) && ./clean.sh

network:
	$(printTarget)
	-docker network create my-network

clean-network:
	$(printTarget)
	docker network rm my-network

clean-all: clean clean-postgres clean-network


define printTarget
	@printf "\033[32m$(@)\n\033[0m"
endef