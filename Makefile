migration:
	cd cmd/migrations && tern new $(filter-out $@,$(MAKECMDGOALS))

migrate-up:
	cd cmd/migrations && tern migrate -d 1
 
migrate-down:
	cd cmd/migrations && tern migrate -d -1