BASEDIR = .
PROJ_S = $(BASEDIR)/mysite_sync
PROJ_A = $(BASEDIR)/mysite_async

default: build run test

build: build-sync build-async

build-sync:
	$(printTarget)
	docker build -f $(PROJ_S)/Dockerfile -t mysite_sync_web $(PROJ_S)/
	docker build -f $(PROJ_S)/nginx/Dockerfile -t mysite_sync_nginx $(PROJ_S)/nginx

build-async:
	$(printTarget)
	docker build -f $(PROJ_A)/Dockerfile -t mysite_async_web $(PROJ_A)/
	docker build -f $(PROJ_A)/nginx/Dockerfile -t mysite_async_nginx $(PROJ_A)/nginx

run: run-sync run-async

run-sync:
	$(printTarget)
	cd $(PROJ_S) && docker compose up -d

run-async:
	$(printTarget)
	cd $(PROJ_A) && docker compose up -d

stop: stop-sync stop-async

stop-sync:
	$(printTarget)
	cd $(PROJ_S) && docker compose down

stop-async:
	$(printTarget)
	cd $(PROJ_A) && docker compose down

test: test-sync test-async

test-sync:
	$(printTarget)
	ab -n 20 -c 20 http://127.0.0.1:8000/polls/

test-async:
	$(printTarget)
	ab -n 20 -c 20 http://127.0.0.1:8888/polls/

clean:
	$(printTarget)
	rm -rf venv

define printTarget
	@printf "\033[32m$(@)\n\033[0m"
endef