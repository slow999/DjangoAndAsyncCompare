BASEDIR = .
PROJ_S = $(BASEDIR)/mysite_sync
PROJ_A = $(BASEDIR)/mysite_async

default: build test

build: build-sync build-async

build-sync:
	docker build -f $(PROJ_S)/Dockerfile -t mysite_sync_web $(PROJ_S)/
	docker build -f $(PROJ_S)/nginx/Dockerfile -t mysite_sync_nginx $(PROJ_S)/nginx

build-async:
	docker build -f $(PROJ_A)/Dockerfile -t mysite_async_web $(PROJ_A)/
	docker build -f $(PROJ_A)/nginx/Dockerfile -t mysite_async_nginx $(PROJ_A)/nginx

run: run-sync run-async

run-sync:
	cd $(PROJ_S) && docker compose up -d

run-async:
	cd $(PROJ_A) && docker compose up

stop: stop-sync stop-async

stop-sync:
	cd $(PROJ_S) && docker compose down

stop-async:
	cd $(PROJ_A) && docker compose down

venv: venv/touchfile

venv/touchfile: requirements.txt
	python -m venv venv
	. venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt
	touch $@

test: test-sync test-async

test-sync:
	@echo "testing sync"
	ab -n 100 -c 100 http://127.0.0.1:8000/polls/

test-async:
	@echo "testing async"
	ab -n 100 -c 100 http://127.0.0.1:8888/polls/

clean:
	rm -rf venv