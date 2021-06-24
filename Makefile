.PHONY: build run connect clean

EMULATOR_IMAGE=ohnomybinaries
UTIL_IMAGE=ohnomybinaries-util
LABEL=ohnomybinaries
CNI?=docker
PORT=$(shell sh -c "$(CNI) ps -f label=$(LABEL) --format={{.Ports}} | grep -oP '(?<=:)([0-9]+)'")

.id_ed25519:
	ssh-keygen -t ed25519 -f .id_ed25519 -P ''

build: .id_ed25519
	$(CNI) build -t $(EMULATOR_IMAGE) -f emulator/Dockerfile .

run:
	$(CNI) run --rm -it -p 127.0.0.1::22 -l $(LABEL) $(EMULATOR_IMAGE)

connect:
	ssh ohno@localhost -p $(PORT) -o "LogLevel QUIET" -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no" -i .id_ed25519

clean:
	$(CNI) ps -a -f label=$(LABEL) --format={{.ID}} | xargs $(CNI) rm || continue
	$(CNI) rmi $(EMULATOR_IMAGE) $(UTIL_IMAGE)

