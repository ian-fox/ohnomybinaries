.PHONY: build run connect clean clean_containers

IMAGE_NAME=ohnomybinaries
LABEL=ohnomybinaries
CNI?=docker
PORT=$(shell sh -c "$(CNI) ps -f label=$(LABEL) --format={{.Ports}} | grep -oP '(?<=:)([0-9]+)'")

.id_ed25519:
	ssh-keygen -t ed25519 -f .id_ed25519 -P ''

build: .id_ed25519
	$(CNI) build -t $(IMAGE_NAME) .

run:
	$(CNI) run -it -p 127.0.0.1::22 -l $(LABEL) $(IMAGE_NAME)

connect:
	ssh ohno@localhost -p $(PORT) -o "LogLevel QUIET" -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no" -i .id_ed25519

clean_containers:
	$(CNI) ps -a -f label=$(LABEL) --format={{.ID}} | xargs $(CNI) rm || continue

clean: clean_containers
	$(CNI) rmi $(IMAGE_NAME)
