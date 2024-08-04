BINARY_NAME=task-manager

# remove any binaries that are built
clean:
	rm -f ./.bin/$(BINARY_NAME)*

build-debug: clean
	 go build -gcflags=all="-N -l" -o ./.bin/$(BINARY_NAME)-debug ./cmd/task-manager/main.go

build: clean
	 go build -o ./.bin/$(BINARY_NAME) ./cmd/task-manager/main.go

start: build
	./.bin/task-manager

air:
	@air -c attach-air.toml

migration:
	tern new -m internal/sql/migrations $(filter-out $@,$(MAKECMDGOALS))

migrate:
	tern migrate -m internal/sql/migrations -d +1

migrate-up:
	tern migrate -m internal/sql/migrations -d +1
 
migrate-down:
	tern migrate -m internal/sql/migrations -d -1