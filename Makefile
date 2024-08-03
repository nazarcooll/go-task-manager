BINARY_NAME=task-manager

# remove any binaries that are built
clean:
	rm -f ./.bin/$(BINARY_NAME)*

build-debug: clean
	 go build -gcflags=all="-N -l" -o ./.bin/$(BINARY_NAME)-debug ./cmd/task-manager/main.go

migration:
	cd cmd/migrations && tern new $(filter-out $@,$(MAKECMDGOALS))

migrate-up:
	cd cmd/migrations && tern migrate -d 1
 
migrate-down:
	cd cmd/migrations && tern migrate -d -1